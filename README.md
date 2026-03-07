# Spotify-Customer-Churn-Analysis
🎧 Spotify Customer Churn Analysis

📌 Project Overview

This project analyzes user churn on Spotify using a dataset of 8,000 users across subscription types and geographies. The goal is to identify patterns in user behavior and subscription factors driving churn and to provide data-driven recommendations to improve retention and revenue.

Workflow:
	•	Data Cleaning: Power Query
	•	Data Transformation & Feature Engineering: Google BigQuery (SQL)
	•	Data Modeling & Visualization: Power BI

⸻

🎯 Business Objectives
	•	Identify the top predictors of churn among Spotify users
	•	Segment users based on engagement, subscription, and demographics
	•	Quantify revenue at risk from churned users
	•	Recommend targeted retention strategies to reduce churn

⸻

🛠 Tech Stack
	•	Data Cleaning: Power Query
	•	SQL / Data Warehouse: Google BigQuery
	•	Visualization & Dashboarding: Power BI
	•	Dataset: Synthezied Spotify Customer Behavior Dataset from Kaggle

⸻

📂 Repository Structure
spotify-customer-churn-analysis/
│
├── README.md
├── data/
│   ├── raw/             # Original dataset
│   └── processed/       # Cleaned and engineered dataset
│
├── sql/
│   ├── 01_data_cleaning.sql
│   ├── 02_feature_engineering.sql
│   └── 03_churn_views.sql
│
├── powerquery/
│   └── powerquery_steps.md
│
├── powerbi/
│   ├── spotify_churn_dashboard.pbix
│   └── dashboard_screenshots/
│
└── docs/
    ├── data_dictionary.md
    ├── data_model.md
    └── insights_and_recommendations.md

🔄 Project Workflow

1️⃣ Data Cleaning (Power Query)
	•	Removed missing or invalid values (~2% of dataset)
	•	Standardized categorical variables (subscription type, device type)
	•	Converted data types for numerical analysis
	•	Created tenure bands: New (<3 months), Developing (3–12 months), Loyal (>12 months)
	•	Calculated engagement scores based on listening time and skip rate

⸻

2️⃣ Data Transformation & Feature Engineering (BigQuery SQL)
	•	Built aggregated churn summary view by subscription type, device, and country
	•	Generated tenure and engagement segmentation for actionable insights
	•	Calculated revenue at risk from churned users (~$150k monthly)
	•	Prepared cleaned views for Power BI dashboards

Example SQL:
-- Create tenure group
CASE 
    WHEN tenure_months <= 3 THEN 'New'
    WHEN tenure_months <= 12 THEN 'Developing'
    ELSE 'Loyal'
END AS tenure_group

3️⃣ Data Modeling & Visualization (Power BI)
	•	Star schema design: Fact table (user engagement & subscriptions) + dimension tables (user, subscription, device, geography)
	•	Created dashboards for executive insights: churn by subscription type, engagement, device, and country
	•	Designed visuals for decision-making, highlighting high-risk segments

⸻

📊 Key Insights & Metrics
### Insight
1. Free users have highest churn
2. High skip-rate users churn faster
3. Short-tenure users (<3 months) are highest risk
4. Revenue at risk
5. Country-specific churn

### Metric
1. 42% vs 15% for Premium users
2. Avg. 55% skip rate among churned users
3. 60% of churn occurs in first 3 months
4. ~$150k monthly
5. US & Brazil show elevated churn (~30–35%)

💡 Business Recommendations
	1.	Engagement campaigns for new users (first 90 days) to improve retention
	2.	Upgrade incentives for high-engagement Free users
	3.	Personalized playlists & notifications for high skip-rate users
	4.	Retention alerts for declining listening time
	5.	Country-specific initiatives for high-churn regions

Potential impact: reducing churn by 10–15% could save ~$50k–$75k monthly in lost revenue

⸻

📈 Dashboard Preview

Include screenshots from your Power BI dashboard in powerbi/dashboard_screenshots/ and embed them:
![Executive Summary](powerbi/dashboard_screenshots/executive_summary.png)
![Churn Drivers](powerbi/dashboard_screenshots/churn_drivers.png)

📘 Data Dictionary (Sample)
Column                  Description
user_id                 Unique user identifier
subscription_type       Free, Premium, Family, Student
listening_time          Avg. daily listening time (minutes)
songs_played_per_day    Daily songs played
skip_rate               Percentage of skipped songs
device_type             Mobile, Desktop, Tablet
churn                   Whether the user discontinued service

🚀 Future Improvements
	•	Predictive churn model using logistic regression or XGBoost
	•	Churn risk scoring dashboard for proactive interventions
	•	Automate ETL pipeline for ongoing updates
	•	Deploy dashboards via Power BI Service
	•	Conduct cohort analysis to refine retention strategies

🧠 Skills Demonstrated
	•	End-to-end data cleaning & transformation
	•	SQL feature engineering & view creation
	•	Star schema modeling & Power BI dashboarding
	•	Customer churn analysis & business recommendations
	•	Translating data insights into actionable strategies
