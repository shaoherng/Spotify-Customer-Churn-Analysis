# DAX Calculated Columns

These calculated columns were added in Power BI after connecting to the BigQuery data source. They were not created at the SQL layer because they are primarily used for **visual segmentation and chart grouping** in Power BI, rather than for core business logic or aggregations that belong in the data warehouse.

---

## `age_group`

**Purpose:** Age is a continuous variable, which makes it difficult to use directly in bar charts or filters. Bucketing users into generational cohorts allows churn rates to be compared meaningfully across life stages.

```dax
age_group = 
SWITCH(TRUE(), 
[age] < 20, "10s", 
[age] < 30, "20s", 
[age] < 40, "30s", 
[age] < 50, "40s", 
[age] < 60, "50s", 
"60s and Above") 
```

---

## `user_status`

**Purpose:** A human-readable active/churned label derived from listening behaviour. It helps segment churn risk in the Behaviour Analysis page without exposing raw numeric thresholds to report consumers.

```dax
user_status = 
IF(fact_customer_churn[is_churned] = 0, "Active", "Churned")
```

---

## `offline_status`

**Purpose:** The raw `offline_listening` column is a binary integer (1/0), which renders poorly in visuals. This column maps it to a readable label to improve chart clarity and filter usability.

```dax
offline_status = 
IF(fact_customer_churn[offline_listening] = 0, "Online", "Offline")
```

---

## `ads_bucket`

**Purpose:** Ad exposure (`ads_listened_per_week`) is a continuous variable. Bucketing it into low, medium, and high tiers allows the Churn Risk Analysis page to show how ad friction increases churn risk across meaningful segments rather than plotting a noisy scatter of individual values.

```dax
ads_bucket = 
SWITCH(TRUE(), 
fact_customer_churn[subscription_type] <> "Free", "Not Available", 
fact_customer_churn[ads_listened_per_week] <= 10, "1-10", 
fact_customer_churn[ads_listened_per_week] <= 20, "11-20", 
fact_customer_churn[ads_listened_per_week] <= 30, "21-30", 
fact_customer_churn[ads_listened_per_week] <=40, "31-40", "41-50")
```

> **Note:** Premium, Family, and Student subscribers have `ads_listened_per_week = 0` and are therefore labelled "Not Available", since ad exposure is not applicable to paid plans. This preserves analytical accuracy when filtering free-tier users only.