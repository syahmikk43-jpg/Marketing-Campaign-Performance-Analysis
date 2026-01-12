# Marketing-Campaign-Performance-Analysis
## Project Overview
This project presents an end-to-end analysis of a **Marketing Campaign Performance Dataset** containing approximately 200,000 campaign records. The dataset captures campaign-level information across multiple companies, marketing channels, customer segments, geographic locations, languages, and time periods.

The objective of this project is to **evaluate campaign effectiveness**, **validate performance consistency**, **identify potential optimisation constraints**, and support data-driven marketing decisions using structured SQL analysis and interactive Power BI dashboards.

The project follows a **real-world analytics workflow**, beginning with data validation and preparation in SQL, followed by modelling, KPI creation, and storytelling using Power BI.

#### Resources :
- The original dataset is available [here](https://www.kaggle.com/datasets/manishabhatt22/marketing-campaign-performance-dataset?utm%5C_source=chatgpt.com).
- The SQL queries used for data inspection, validation, cleaning, and type normalisation can be found [here](https://github.com/syahmikk43-jpg/Marketing-Campaign-Performance-Analysis/blob/main/marketing_campaign_sql/01_data_cleaning.sql).
- The SQL queries used for feature engineering and business metric derivation can be found [here](https://github.com/syahmikk43-jpg/Marketing-Campaign-Performance-Analysis/blob/main/marketing_campaign_sql/02_feature_engineering.sql).
- The SQL queries used to build analytical views and KPI aggregations consumed by Power BI can be found [here](https://github.com/syahmikk43-jpg/Marketing-Campaign-Performance-Analysis/blob/main/marketing_campaign_sql/03_analysis_views.sql).
- An interactive PowerBI dashboard can be downloaded [here](https://github.com/syahmikk43/Marketing-Campaign-Performance-Analysis/tree/main/marketing_campaign_dashboard).
  
---

## Business Problem
Marketing teams often invest heavily across multiple channels and campaign types, but struggle to answer key questions such as:
- Which channels and campaign types generate the highest ROI?
- Are acquisition costs aligned with conversion performance?
- Which customer segments respond best to marketing efforts?
- Do geography, language, or campaign duration impact performance?
- How does performance evolve over time?

This project addresses these questions by transforming raw campaign data into **clear, actionable insights** that can guide marketing strategy and budget allocation.

---

## Dataset Description
The dataset contains **~200,000 unique marketing campaigns**, with the following key attributes:

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
## Executive Summary
This project evaluates marketing campaign performance in 2021 using SQL-based data analysis and interactive Power BI dashboards. The goal is to assess effectiveness across channels, campaign types, customer segments, geographies, and time, and to determine whether the data supports clear optimisation actions.

The analysis finds that campaign performance is **highly consistent across all dimensions**, with key metrics such as ROI, conversion rate, CTR, and acquisition cost showing minimal variation. No channel, segment, or market materially outperforms others at an aggregate level, indicating a controlled and standardised execution model rather than isolated performance gaps.

As a result, the primary value of this analysis is the establishment of a **reliable performance baseline** for monitoring, governance, and anomaly detection. The findings suggest that meaningful optimisation would require more granular or experimental data rather than further aggregation.

---

## Insight Deep Dive
### Overall Campaign Performance
Across the 2021 period, marketing campaigns exhibit **highly consistent performance**, with average ROI clustering tightly around 500 percent and conversion rates remaining near 8 percent across all channels and campaign types. The narrow performance range indicates a well-controlled marketing execution environment rather than isolated high- or low-performing initiatives. Acquisition costs show similarly limited variation, reinforcing that profitability is driven by standardised execution rather than aggressive risk-taking.

<img src = "marketing_campaign_dashboard/marketing_campaign_page-0001.jpg" height=500>

### Channel & Campaign Efficiency
Analysis by channel and campaign type shows **minimal variance in average ROI and conversion rates**, with differences falling within a narrow band. This suggests that no single channel or campaign type materially outperforms others at an aggregate level. The consistency implies that channel selection alone is unlikely to drive significant performance gains under the current strategy, and that channel mix decisions are being executed with comparable effectiveness.

<img src = "marketing_campaign_dashboard/marketing_campaign_page-0002.jpg" height=500>

### Customer Segment Performance
Customer segment analysis reveals **uniform performance across segments**, with average conversion and engagement metrics differing only marginally. This indicates that campaign messaging and targeting strategies are broadly effective across audiences, but also suggests limited opportunity for performance uplift through segmentation alone when evaluated at an aggregate level.

### Geographic & Language Insights
Geographic and language-level analysis show **stable ROI across locations and languages**, with no region or language demonstrating a statistically meaningful deviation from the overall average. This consistency indicates that campaigns are being deployed with similar effectiveness across markets and that localisation, while operationally important, is not currently a primary performance differentiator.

<img src = "marketing_campaign_dashboard/marketing_campaign_page-0003.jpg" height=500>

### Time Trends & Campaign Duration
Time-based analysis shows stable ROI throughout the year, with only modest seasonal variation in conversion rates. Campaign duration analysis similarly reveals **limited performance separation**, suggesting that duration length alone does not materially alter outcomes under the current campaign design approach.

<img src = "marketing_campaign_dashboard/marketing_campaign_page-0004.jpg" height=500>

---

## Recommendations
-	**Maintain current budget allocation across channels**, as the data does not indicate material efficiency differences that would justify reallocating spend without introducing additional risk.
-	**Use the established performance ranges as control thresholds**, enabling marketing teams to quickly identify underperforming campaigns when metrics vary from expected norms.
-	**Introduce targeted pilot campaigns with differentiated strategies** (e.g., creative, audience depth, or channel mix) to deliberately test whether variance can be created and exploited, rather than assuming it already exists.
-	**Align channel usage with strategic intent rather than Efficiency**, such as using certain channels for brand visibility and others for acquisition, given their comparable efficiency outcomes.
-	**Treat this dashboard as a baseline monitoring tool**, supporting ongoing decision-making rather than one-time optimisation.

---

## Limitations
- **The lack of natural performance variance limits prescriptive decision-making**, as the data does not strongly favor one channel, segment, or market over another.
- **Controlled Environment Bias:** The dataset reflects a very stable period. It may not account for external factors like sudden market shifts, seasonal changes, or aggressive competitor moves.
- **No Evidence of Causality:** This analysis shows us what is happening, but it doesn't prove why. Therefore, we lack the experimental proof needed to justify drastic moves like doubling a budget or shutting a channel down entirely.


