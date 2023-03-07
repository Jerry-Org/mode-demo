  SELECT
  sources.source_name
  , channels.channel_name
  , SUM(fct.count_msgs) AS count_msgs
FROM
  SLACK.DBT_CLOUD_PROD.FCT_MESSAGES fct
  LEFT JOIN SLACK.DBT_CLOUD_PROD.DIM_CHANNELS channels ON fct.channel_key = channels.channel_key
  LEFT JOIN SLACK.DBT_CLOUD_PROD.DIM_SOURCES sources ON fct.source_key = sources.source_key
GROUP BY
  1,2