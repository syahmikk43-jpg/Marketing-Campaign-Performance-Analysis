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

--Time series metric
create view vw_daily_metrics as
select date,
		sum(clicks) as total_clicks,
		sum(impressions) as total_impressions,
		avg(conversion_rate) as avg_conversion_rate,
		avg(engagement_score) as avg_engagement_score
from fact_campaign
group by date
order by date;

--Best campaigns:
select *
from vw_campaign_kpis
order by roi desc
limit 10;

--Worst campaigns:
select *
from vw_campaign_kpis
order by roi asc
limit 10;

--Which channel delivers the highest ROI:
select channel_used,
		avg(roi) as avg_roi
from fact_campaign
group by channel_used
order by avg_roi desc;

--Which customers segment engages the most:
select customer_segment, avg(engagement_score) as avg_engagement
from fact_campaign
group by customer_segment 
order by avg_engagement desc;

--Which audience convert rate the  best:
select target_audience, avg(conversion_rate) as avg_conversion_rate
from fact_campaign
group by target_audience 
order by avg_conversion_rate desc;

--Does duration correlate with performance:
select durations_days, avg(roi)
from fact_campaign
group by durations_days 
order by durations_days;

--What drive high roi:
select corr(roi,conversion_rate) as corr_roi_conv,
		corr(roi,engagement_score) as corr_roi_engagement,
		corr(roi, acquisition_cost) as corr_roi_cost
from fact_campaign;


