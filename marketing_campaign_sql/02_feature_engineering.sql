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
		conversion_rate/100.0 as conversion_rate,
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


