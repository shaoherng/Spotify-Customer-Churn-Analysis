CREATE OR REPLACE TABLE `project_id.spotify_customer_churn.dim_is_churned` AS
SELECT DISTINCT is_churned,
  CASE
    WHEN is_churned = 0 THEN 'Renewed'
    ELSE 'Churned'
  END AS subcription_status
FROM `project_id.spotify_customer_churn.Spotify Customer Churn`;