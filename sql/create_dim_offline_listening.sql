CREATE OR REPLACE TABLE `project_id.spotify_customer_churn.dim_offline_listening` AS
SELECT DISTINCT offline_listening,
  CASE
    WHEN offline_listening = 0 THEN 'Online'
    ELSE 'Offline'
  END AS listening_platform
FROM `project_id.spotify_customer_churn.Spotify Customer Churn`;