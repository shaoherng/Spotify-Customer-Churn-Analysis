# 🎵 Spotify Customer Churn Analysis

A end-to-end data analysis project exploring customer churn behaviour on Spotify. Raw data was modelled in **Google BigQuery** using fact and dimension tables, then visualized in a 5-page **Power BI** dashboard to surface actionable retention insights.

---

## 📌 Project Overview & Goals

Customer churn is one of the most critical metrics for any subscription-based business. This project aims to:

- Identify the key behavioural, demographic, and pricing signals that predict churn
- Quantify revenue at risk from churned users
- Segment users by risk level to enable targeted retention strategies
- Deliver clear, recruiter-ready visualizations that translate data into business decisions

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Google BigQuery (SQL) | Data modelling — fact & dimension tables |
| Power BI | Dashboard design & data visualization |

---

## 📊 Dashboard Structure

The Power BI report is structured across 5 pages, each answering a specific business question.

### Page 1 — Executive Summary

High-level snapshot of the churn problem:
- **KPI Cards:** Overall churn %, churned user count, avg subscription price, revenue at risk estimate
- **Donut Chart:** Churned vs retained user split
- **Bar Chart:** Churn rate broken down by subscription type

---

### Page 2 — Behavioral Analysis

Digs into how user listening habits correlate with churn:
- **Box Plot / Histogram:** Listening time distribution by churn status
- **Scatter Plot:** Skip rate vs songs played
- **Clustered Bar:** Offline listening behaviour vs churn
- **Heatmap / Matrix:** Device type × churn rate

---

### Page 3 — Monetization & Pricing

Examines how pricing and ads influence churn decisions:
- **Bar Chart:** Churn rate broken down by price tier
- **Scatter Plot:** Ads per week vs churn rate
- **Stacked Bar:** Free vs premium churn comparison side by side

---

### Page 4 — Demographics & Segmentation

Profiles which user groups churn most:
- **Map Visual:** Churn rate by country
- **Bar Chart:** Churn broken down by age group
- **Matrix Table:** Gender fairness check across churn segments

---

### Page 5 — Risk Segments & Recommendations

Translates findings into prioritized retention actions:
- **Funnel / Table:** Users segmented into high / medium / low churn risk
- **KPI Cards:** Estimated revenue saved through intervention
- **Text Insight Boxes:** 3 key recommendations for the business

---

## 🗄️ Data Modelling (BigQuery)

The data was structured using a **star schema** in Google BigQuery:

- **Fact Table:** Core churn events and subscription metrics per user
- **Dimension Tables:** User demographics, subscription plans, device types, listening behaviour

This modelling approach ensured clean, performant queries and a scalable foundation for the Power BI reports.

---

## 🔍 Key Findings

- Churn is strongly correlated with **low listening time** and **high skip rates**, indicating disengaged users are at the highest risk
- Users on **free plans** exposed to more ads per week showed significantly higher churn rates, pointing to ad friction as a retention lever
- **Price tier sensitivity** was evident — higher-tier subscribers churned less, suggesting perceived value plays a key role
- Certain **device types and age groups** showed disproportionately high churn, revealing targeted segments for re-engagement campaigns
- The risk segmentation model identifies users likely to churn, enabling proactive outreach before cancellation occurs

---

## 📁 Repository Structure

```
spotify-churn-analysis/
│
├── sql/
│   ├── fact_table.sql
│   └── dim_tables.sql
│
├── powerbi/
│   └── spotify_churn_dashboard.pbix
│
└── README.md
```

---

## 🚀 Getting Started

1. **BigQuery:** Run the SQL scripts in the `/sql` folder to recreate the fact and dimension tables in your own GCP project
2. **Power BI:** Open the `.pbix` file and update the data source connection to point to your BigQuery instance

---

## 👤 Author

**Shao Herng Gan**
[https://www.linkedin.com/in/shao-herng-gan/](#) · [Portfolio](#)