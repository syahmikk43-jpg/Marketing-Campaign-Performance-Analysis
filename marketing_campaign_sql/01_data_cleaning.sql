--Create staging Table:
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

--Insert data:
insert into marketing_campaign_staging 
select *
from marketing_campaign_dataset;

--Display sample data:
select *
from marketing_campaign_staging
limit 10;

--Display Unique Value:
select
    array_agg(distinct "campaign_type") as unique_campaign_types,
    array_agg(distinct "target_audience") as unique_target_audiences,
    array_agg(distinct "channel_used") as unique_channels
from marketing_campaign_staging;

--Display missing values:
select 
    count(*) filter (where conversion_rate is null) as missing_conversion_rate,
    count(*) filter (where acquisition_cost is null) as missing_cost,
    count(*) filter (where roi is null) as missing_roi,
    count(*) filter (where clicks is null) as missing_clicks,
    count(*) filter (where impressions is null) as missing_impressions
from marketing_campaign_staging;

--Display invalid values:
select *
from marketing_campaign_staging
where clicks > impressions
or conversion_rate >100
or conversion_rate < 0
or acquisition_cost < 0;

--Display duplicate campaigns:
select campaign_id,
		count(*)
from marketing_campaign_staging
group by campaign_id 
having count(*) > 1;

--Transform datatype:
alter table marketing_campaign_staging
alter column Acquisition_Cost TYPE numeric
using regexp_replace(Acquisition_Cost, '[$,]', '', 'g')::numeric;


