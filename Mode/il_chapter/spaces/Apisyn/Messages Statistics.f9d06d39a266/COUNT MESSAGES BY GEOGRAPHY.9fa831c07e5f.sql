SELECT
  SPLIT_PART(user.usr_timezone, '/', 1) AS region,
  SPLIT_PART(user.usr_timezone, '/', 2) AS city,
  SUM(fct.count_msgs) AS count_msgs
FROM
  
  SLACK.DBT_CLOUD_PROD.FCT_MESSAGES fct
  LEFT JOIN SLACK.DBT_CLOUD_PROD.DIM_USERS user ON fct.USR_KEY = user.USR_KEY
GROUP BY
  1,
  2