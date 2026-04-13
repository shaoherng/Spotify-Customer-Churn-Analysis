# 🎵 Spotify Customer Churn Analysis

An end-to-end data analytics project analyzing customer churn behaviour for a music streaming platform. A synthetic dataset was sourced from Kaggle, modelled in **Google BigQuery** using a star schema, and visualized in a 4-page interactive **Power BI** dashboard to surface actionable retention and monetization insights.

📊 **[View Live Dashboard](#)** ← *(replace `#` with your Power BI Service URL)*

---

## 📌 Project Overview & Goals

Customer churn is one of the most critical metrics for any subscription-based business, losing a user means losing recurring revenue and the cost to reacquire them is far higher than retaining them. This project simulates the end-to-end analytical workflow a Data Analyst or Data Scientist would follow to investigate churn at a streaming company.

**Business questions this project answers:**

- Which group of customers have the highest churning rate?
- Which behaviours indicate high churn rate?
- Which customer segments are most profitable?
- How does ad exposure influence a user's likelihood to churn?
- Do people stay because they paid or because they're engaged?

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Kaggle | Source of synthetic dataset |
| Google BigQuery (SQL) | Cloud data warehouse — star schema modelling |
| Power BI | Dashboard design, DAX calculated columns, data visualization |

---

## 🗄️ Data Modelling (BigQuery)

The raw Kaggle dataset served as the **fact table**, containing one row per user with all core behavioural and demographic attributes. Four **dimension tables** were created in BigQuery using SQL to normalize the data into a **star schema**, enabling clean relationships and performant queries in Power BI.

### Fact Table — `fact_users`

| Column | Description |
|---|---|
| `user_id` | Unique identifier per user |
| `gender` | User gender |
| `age` | User age |
| `country` | ISO country code |
| `subscription_type` | Free, Premium, Family, or Student |
| `listening_time` | Total listening time (minutes) |
| `songs_played_per_day` | Average songs played per day |
| `skip_rate` | Proportion of songs skipped (0–1) |
| `device_type` | Primary device used |
| `ads_listened_per_week` | Number of ads heard per week |
| `offline_listening` | Binary flag — whether user listens offline |
| `is_churned` | Binary churn label (1 = churned, 0 = retained) |

### Dimension Tables

**`dim_subscription`** — Subscription plan attributes

| Column | Description |
|---|---|
| `subscription_type` | Free, Premium, Family, Student |
| `monthly_price` | Monthly cost (CAD) |
| `subscription_tier` | Free or Paid |

**`dim_country`** — Geographic enrichment

| Column | Description |
|---|---|
| `country` | ISO country code |
| `country_name` | Full country name |
| `region` | Continent/region (e.g. Asia, Europe, North America) |

**`dim_offline_listening`** — Offline usage lookup

| Column | Description |
|---|---|
| `offline_listening` | Binary flag (1 or 0) |
| `listening_platform` | Offline or Online |

**`dim_is_churned`** — Churn status lookup

| Column | Description |
|---|---|
| `is_churned` | Binary flag (1 or 0) |
| `subscription_status` | Churned or Renewed |

---

## 📐 Calculated Columns (Power BI)

After connecting BigQuery to Power BI, the following calculated columns were created using DAX to support chart segmentation and behavioral analysis:

| Column | Logic |
|---|---|
| `user_status` | Derived active/inactive status based on listening behaviour |
| `offline_status` | Human-readable label from the `offline_listening` flag |
| `age_group` | Age bucketed into generational cohorts (e.g. 10s, 20s, 30s) |
| `ads_bucket` | Ad exposure segmented into 1-10 / 11-20 / 21-30 / 31-40 / 41-50 categories |
| `listening_time_bucket` | Listening time categorized into engagement tiers (Passive, Engaged, Power) |
| `songs_played_bucket` | Songs played per day categorized into engagement tiers (Passive, Engaged, Power) |
| `skip_rate_bucket` | Skip rate categorized into behavior tiers (Low, Medium, High) |

> 📄 Full DAX expressions with business context are documented in [`/dax/calculated_columns.md`](dax/calculated_columns.md)

---

## 📊 Dashboard Structure

The Power BI report is structured across 4 pages, each addressing a distinct business question.

### Page 1 — Overview

High-level snapshot of the churn landscape across the user base:
- **KPI Cards:** Overall churn rate, total users, total revenue, revenue lost due to churn
- **Donut Chart:** Active vs Churned users distribution
- **Column Charts:** 
  - Churn rate by subscription type
  - Churn rate by age group
  - Churn rate by gender
- **Bar Charts:**
  - Churn rate by region
  - Churn rate by country
- **Slicers:** Subscription type, country, and age filters

### Page 2 — Behaviour Analysis

Examines how listening habits correlate with churn risk:
- **Column Charts:**
  - Churn rate by listening time bucket
  - Churn rate by songs played per day bucket
  - Churn rate by skip rate bucket
- **Bar Charts:**
  - Churn rate by device type
  - Churn rate by listening platform
- **Slicers:** Subscription type, country, age, and gender filters

### Page 3 — Revenue Analysis

Explores which customer segments are more profitable:
- **Scatterplot Charts:**
  - Churn Rate vs Average Revenue Per Subscription (ARPS) by Country
  - Churn Rate vs Average Revenue Per Subscription (ARPS) by Age
  - Churn Rate vs Average Revenue Per Subscription (ARPS) by Gender
- **Bar Chart:**
  - Total Revenue by Subscription

- **Slicers:** Country, age, and gender filters

### Page 4 — Churn Risk Analysis

Identifies the behaviours free-tier users are likely to exhibit before upgrading or churning:
- **Column Charts:**
  - Average listening time comparison between Free vs Paid users
  - Average songs played per day comparison between Free vs Paid users
  - Average skip rate comparison between Free vs Paid users
- **Stacked Bar Charts:**
  - Free vs Paid user distribution by device type (Desktop, Web, Mobile)
  - Free vs Paid user distribution by listening platform (Offline, Online)
- **Scatter Plot:** Free users churn rate by ads listened per week (segmented by ad buckets: 1-10, 11-20, 21-30, 31-40, 41-50)
- **Slicers:** Subscription type, country, age, and gender filters

Examines whether payment status or engagement behaviors drive retention, revealing that engagement—not subscription tier—is the primary retention factor:

- **Scatter Plots (Churn vs. Engagement by Paid Status):**
  - Churn rate vs. listening time across engagement tiers (Passive, Engaged, Power)
  - Churn rate vs. songs played per day across engagement tiers (Passice, Engaged, Power)
  - Churn rate vs. skip rate across skip behavior levels (Low, Medium, High)
  - Each plot compares Free vs. Paid users to isolate payment effects

- **Stacked Column Chart:**
  - Churn rate comparison by device type (Mobile, Desktop, Web) for Free vs. Paid users

- **Scatter Plot (Free Users Only):**
  - Churn rate by weekly ad exposure, segmented into buckets (1-10, 11-20, 21-30, 31-40, 41-50 ads)

- **Slicers:** Subscription type, country, age, and gender filters

---

## 🔍 Key Findings & Recommendations

### 1. Geographic & Demographic Churn Hotspots
**Finding:** Churn peaks at **32.6%** among **Student plan users in their 20s-30s** across **Pakistan, Germany, and France**, with additional concentration in the "Other" gender category.

**Why it matters:** Student plans may be underpriced for the churn risk, or these markets lack features/content that resonate with younger users.

**Recommendation:** Conduct exit surveys in these three countries to identify specific pain points. Consider localized content partnerships or student-specific engagement features (e.g., collaborative playlists, campus events) to improve retention before focusing on acquisition.

---

### 2. Behavioral Churn Indicators
**Finding:** Users with **high skip rates, mobile-only usage, and frequent offline listening** show elevated churn rates.

**Why it matters:** These behaviors signal dissatisfaction with recommendations (high skips) or situational/casual usage (mobile/offline) rather than habitual engagement.

**Recommendation:** Flag high-skip users for improved recommendation tuning within their first 30 days. For mobile-heavy users, drive cross-device adoption through desktop-exclusive features (e.g., enhanced playlists, lyrics) to increase platform stickiness.

---

### 3. Profitability Sweet Spots
**Finding:** **Germany** dominates profitability across all markets. **Male users** deliver the highest Average Revenue Per Subscription (ARPS) with lowest churn. Users in their **30s** offer the best balance of revenue and retention, while 50s drive peak ARPS.

**Why it matters:** These segments represent the most efficient growth opportunities (high value, low churn risk).

**Recommendation:** Prioritize acquisition spend on 30s males in Germany and similar high-GDP markets. Develop retention programs for 50s users (who may have higher willingness to pay) while scaling proven engagement tactics from the 30s cohort.

---

### 4. Ad Fatigue Threshold
**Finding:** Free users exposed to **41-50 ads weekly churn at 27.6%**—the highest rate among free tiers, showing a strong positive correlation between ad frequency and attrition.

**Why it matters:** Aggressive ad load monetizes in the short term but accelerates user loss, reducing lifetime value.

**Recommendation:** Test a **35-ad weekly cap** to balance revenue and retention. Introduce "ad-free hours" as a retention incentive for at-risk free users (e.g., after 6 months of consistent usage) rather than pushing immediate paid conversion.

---

### 5. Payment Is a Symptom, Not a Solution
**Finding:** **Payment doesn't reduce churn, engagement does.** Paid users actually churn **3.7 points higher** than free users at matched engagement levels (engaged tier: 27.3% paid vs. 22.6% free), suggesting **premium features underwhelm**. Power users retain between 25-26% regardless of subscription status, while passive users churn at ~26% whether they pay or not.

**Why it matters:** Converting free users to paid won't improve retention if their engagement remains low. The premium tier may suffer from a value perception gap.

**Recommendation:** Audit premium features against user expectations—run surveys asking paid churners "what would have kept you subscribed?" Shift strategy from conversion-focused to **engagement-first**: build features that drive habitual usage (personalized playlists, social sharing, exclusive early releases), *then* gate them behind paywalls. Consider usage-based pricing tiers to better match value to engagement levels.

---

## 📁 Repository Structure

```
spotify-churn-analysis/
│
├── sql/
│   ├── fact_users.sql
│   ├── dim_subscription.sql
│   ├── dim_country.sql
│   ├── dim_offline_listening.sql
│   └── dim_is_churned.sql
│
├── dax/
│   └── calculated_columns.md
│
├── powerbi/
│   └── spotify_churn_dashboard.pbix
│
└── README.md
```

---

## 🚀 Getting Started

> 🌐 **Just want to explore the dashboard?** View it live [here](#) ← *(replace `#` with your Power BI Service URL)*

1. **BigQuery:** Run the SQL scripts in the `/sql` folder to recreate the fact and dimension tables in your own GCP project. Ensure the dataset is created in BigQuery before running the dimension table scripts, as they reference the uploaded fact table.
2. **Power BI:** Open the `.pbix` file and update the BigQuery data source connection under **Transform Data → Data Source Settings** to point to your own GCP project and dataset.
3. **Calculated Columns:** The DAX calculated columns (`user_status`, `offline_status`, `age_group`, `ads_bucket`, `listening_time_bucket`, `songs_played_bucket`, `skip_rate_bucket`) are already embedded in the `.pbix` file and will populate automatically once the data connection is refreshed.

---

## 👤 Author

**Shao Herng Gan**

[LinkedIn](https://www.linkedin.com/in/shao-herng-gan/) · [Portfolio](#)