CREATE OR REPLACE TABLE `project_id.spotify_customer_churn.dim_subscription` AS
SELECT subscription_type,
  CASE
    WHEN subscription_type = 'Free' THEN 0
    WHEN subscription_type = 'Premium' THEN 12.69
    WHEN subscription_type = 'Student' THEN 6.39
    WHEN subscription_type = 'Family' THEN 20.99
  END AS monthly_price,
  CASE
    WHEN subscription_type = 'Free' THEN 'Free'
    ELSE 'Paid'
  END AS subscription_tier
FROM (
  SELECT DISTINCT subscription_type
  FROM `project_id.spotify_customer_churn.Spotify Customer Churn`
);
