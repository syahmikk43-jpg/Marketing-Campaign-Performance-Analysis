--Marketing Campaign Performance Project

--Staging Table:
create table marketing_campaign_staging (
	Campaign_ID text,
    Company text,
    Campaign_Type text,
    Target_Audience text,
    Duration text,
    Channel_Used text,
    Conversion_Rate numeric,
    Acquisition_Cost text,
    ROI numeric,
    Location text,
    Language text,
    Clicks bigint,
    Impressions bigint,
    Engagement_Score bigint,
    Customer_Segment text,
    Date date
);

--insert & verify data
insert into marketing_campaign_staging 
select *
from marketing_campaign_dataset;

select *
from marketing_campaign_staging
limit 10;

--transform datatype
alter table marketing_campaign_staging
alter column Acquisition_Cost TYPE numeric
using regexp_replace(Acquisition_Cost, '[$,]', '', 'g')::numeric;

--Display Unique Value:
select
    array_agg(distinct "campaign_type") as unique_campaign_types,
    array_agg(distinct "target_audience") as unique_target_audiences,
    array_agg(distinct "channel_used") as unique_channels
from marketing_campaign_staging;

--Missing Values:
select 
    count(*) filter (where conversion_rate is null) as missing_conversion_rate,
    count(*) filter (where acquisition_cost is null) as missing_cost,
    count(*) filter (where roi is null) as missing_roi,
    count(*) filter (where clicks is null) as missing_clicks,
    count(*) filter (where impressions is null) as missing_impressions
from marketing_campaign_staging;

--Invalid Values:
select *
from marketing_campaign_staging
where clicks > impressions
or conversion_rate >100
or conversion_rate < 0
or acquisition_cost < 0;

--Duplicate campaigns:
select campaign_id,
		count(*)
from marketing_campaign_staging
group by campaign_id 
having count(*) > 1;

--Cleaned fact table:
create table fact_campaign as 
select campaign_id,
		company,
		campaign_type,
		target_audience,
		case when duration ~ '^[0-9]+$' then duration::int
			 else regexp_replace(duration,'[^0-9]','','g')::int
		end as durations_days,
		channel_used,
		conversion_rate/100.0 as conversion_rate,		--xperlu bahagi 100 pun
		acquisition_Cost,
    	roi,
    	location,
    	language,
    	clicks,
    	impressions,
		engagement_Score,
		customer_Segment,
    	date
from marketing_campaign_staging;

--Create KPI View
create view vw_campaign_kpis as 
select *,
		case when impressions = 0 then 0
			 else clicks::float / impressions
		end as ctr,
		case when impressions = 0 then 0
			 else engagement_score::float / impressions
		end as engagement_rate,
		case when acquisition_cost = 0 then null
			 else roi / acquisition_cost
		end as cost_efficiency,
		(engagement_score*(conversion_rate)) as engagement_x_conversion
from fact_campaign;

--Performnce by channel
create view vw_channel_performance as 
select channel_used,
		count(*) as campaign_count,
		avg(conversion_rate) as avg_conversion_rate,
		avg(ctr) as avg_ctr,
		avg(engagement_rate) as avg_engagement_rate,
		avg(roi) as avg_roi,
		avg(cost_efficiency) as avg_cost_efficiency
from vw_campaign_kpis
group by channel_used;

--Performance by audience
create view vw_audience_performance as 
select target_audience,
		avg(conversion_rate) as avg_conversion_rate,
		avg(engagement_rate) as avg_engagement_rate,
		avg(roi) as avg_roi,
		avg(acquisition_cost) as avg_acquisition_cost
from vw_campaign_kpis
group by target_audience;

--Best & Worst campaigns
select *
from vw_campaign_kpis
order by roi desc
limit 10;

select *
from vw_campaign_kpis
order by roi asc
limit 10;

--tie series metric
create view vw_daily_metrics as
select date,
		sum(clicks) as total_clicks,
		sum(impressions) as total_impressions,
		avg(conversion_rate) as avg_conversion_rate,
		avg(engagement_score) as avg_engagement_score
from fact_campaign
group by date
order by date;

--which channel delivers the highest ROI
select channel_used,
		avg(roi) as avg_roi
from fact_campaign
group by channel_used
order by avg_roi desc;

--which customers segment engages the most
select customer_segment, avg(engagement_score) as avg_engagement
from fact_campaign
group by customer_segment 
order by avg_engagement desc;

--which audience convert rate the  best
select target_audience, avg(conversion_rate) as avg_conversion_rate
from fact_campaign
group by target_audience 
order by avg_conversion_rate desc;

--does duration correlate with performance
select durations_days, avg(roi)
from fact_campaign
group by durations_days 
order by durations_days;

--what drive hgh roi
select corr(roi,conversion_rate) as corr_roi_conv,
		corr(roi,engagement_score) as corr_roi_engagement,
		corr(roi, acquisition_cost) as corr_roi_cost
from fact_campaign;



