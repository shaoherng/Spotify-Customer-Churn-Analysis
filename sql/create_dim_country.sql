CREATE OR REPLACE TABLE `project_id.spotify_customer_churn.dim_country` AS
SELECT DISTINCT country,
  CASE
    WHEN country = 'AU' THEN 'Australia'
    WHEN country = 'CA' THEN 'Canada'
    WHEN country = 'US' THEN 'United States of America'
    WHEN country = 'UK' THEN 'United Kingdom'
    WHEN country = 'FR' THEN 'France'
    WHEN country = 'DE' THEN 'Germany'
    WHEN country = 'IN' THEN 'India'
    WHEN country = 'PK' THEN 'Pakistan'
  END AS country_name,
  CASE
    WHEN country = 'AU' THEN 'Oceania'
    WHEN country IN ('CA', 'US') THEN 'North America'
    WHEN country IN ('UK', 'FR', 'DE') THEN 'Europe'
    WHEN country IN ('IN', 'PK') THEN 'Asia'
  END AS region,
FROM `project_id.spotify_customer_churn.Spotify Customer Churn`;