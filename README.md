# Marketing-Campaign-Performance-Analysis
## Project Overview
This project presents an end-to-end analysis of a Marketing Campaign Performance Dataset containing approximately 200,000 campaign records spanning two years. The dataset captures campaign-level information across multiple companies, marketing channels, customer segments, geographic locations, languages, and time periods.

The objective of this project is to evaluate campaign effectiveness, identify optimisation opportunities, and support data-driven marketing decisions using structured SQL analysis and interactive Power BI dashboards.

The project follows a real-world analytics workflow, beginning with data validation and preparation in SQL, followed by modelling, KPI creation, and storytelling using Power BI.

#### Resources :
- The original dataset is available [here](https://www.kaggle.com/datasets/manishabhatt22/marketing-campaign-performance-dataset?utm%5C_source=chatgpt.com).
- The SQL queries used for data inspection, validation, cleaning, and type normalisation can be found [here](https://github.com/syahmikk43-jpg/Marketing-Campaign-Performance-Analysis/blob/main/marketing_campaign_sql/01_data_cleaning.sql).
- The SQL queries used for feature engineering and business metric derivation can be found [here](https://github.com/syahmikk43-jpg/Marketing-Campaign-Performance-Analysis/blob/main/marketing_campaign_sql/02_feature_engineering.sql).
- The SQL queries used to build analytical views and KPI aggregations consumed by Power BI can be found [here](https://github.com/syahmikk43-jpg/Marketing-Campaign-Performance-Analysis/blob/main/marketing_campaign_sql/03_analysis_views.sql).
- An interactive PowerBI dashboard can be downloaded [here]().
  
---

# Business Problem
Marketing teams often invest heavily across multiple channels and campaign types, but struggle to answer key questions such as:
- Which channels and campaign types generate the highest ROI?
- Are acquisition costs aligned with conversion performance?
- Which customer segments respond best to marketing efforts?
- Do geography, language, or campaign duration impact performance?
- How does performance evolve over time?

This project addresses these questions by transforming raw campaign data into clear, actionable insights that can guide marketing strategy and budget allocation.

---

# Dataset Description
The dataset contains 200,000 unique marketing campaigns, with the following key attributes:

| Column Name | Description |
|--------------|-------------|
| `Company` | Fictional brands responsible for campaigns |
| `Campaign Type` | Email, Social Media, Influencer, Display, Search |
| `Channels Used` | Email, Facebook, Google Ads, Instagram, Website, YouTube |
| `Target Audience & Customer Segmen` | Demographic and behavioural groupings |
| `Geography & Language` | Major cities and multilingual campaigns |
| `Campaign Duration` | Number of days active |
| `Date` | Campaign timeline for trend analysis |

Core Performance Metrics:
-	Conversion Rate
-	Acquisition Cost
-	ROI
-	Click-Through Rate (CTR)
-	Engagement Score

---

# Key Findings & Insights
### Overall Campaign Performance
-	Marketing campaigns achieve a consistently strong average ROI of ~500%.
-	Conversion rates remain stable at approximately 8%, indicating a reliable acquisition funnel.
-	Acquisition costs are well controlled across channels.
### Channel & Campaign Efficiency
-	Email and Website channels deliver the strongest cost efficiency.
-	Influencer and Social Media campaigns achieve higher conversion rates.
-	CTR remains consistent across channels, suggesting uniform creative effectiveness.
### Customer Segment Performance
-	Foodies and Outdoor Adventurers show the highest conversion rates.
-	Tech Enthusiasts perform especially well on websites and YouTube.
-	Fashionistas display lower engagement, indicating potential creative misalignment.
### Geographic & Language Insights
-	Campaigns in Miami and Los Angeles deliver the highest ROI.
-	Non-English campaigns (French and Mandarin) slightly outperform English campaigns.
-	Performance remains strong across regions, indicating scalability.
### Time Trends & Campaign Duration
-	Conversion rates peak during mid-year months (August–September).
-	Campaigns lasting 30–50 days generate the highest ROI.
-	Very short and very long campaigns tend to underperform.

---

# Business Recommendations
Based on the analysis, the following strategic recommendations are proposed:
-	Reallocate more budget toward Email and Website channels to improve efficiency.
-	Scale Influencer and Social Media campaigns for conversion-focused objectives.
-	Develop segment-specific messaging for high-performing customer segments.
-	Refresh creative strategy for underperforming segments such as Fashionistas.
-	Expand localised and multilingual campaigns to reduce market saturation.
-	Standardise campaign planning around 30–50 day durations.


