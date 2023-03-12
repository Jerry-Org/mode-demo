-- SQL is not limited to just SELECT:
  -- Creating, dropping, and altering tables and views
  -- INSERT, DELETE and UPDATE operations
  -- Creating, modifying, or employing user-defined functions
  
-- SQL support Liquid template language

--  Support integration with Github to version control SQL queries and Python notebook.

SELECT
  sources.source_name
  , channels.channel_name
  , SUM(fct.count_msgs) AS count_msgs
FROM
  SLACK.DBT_CLOUD_PROD.FCT_MESSAGES fct
  LEFT JOIN SLACK.DBT_CLOUD_PROD.DIM_CHANNELS channels ON fct.channel_key = channels.channel_key
  LEFT JOIN SLACK.DBT_CLOUD_PROD.DIM_SOURCES sources ON fct.source_key = sources.source_key
WHERE 1=1
AND fct.MSG_SEND_DATE >= '{{ msg_send_date_params }}'
GROUP BY
  1,2
  
{% form %}

msg_send_date:
    type: date
    default: 2021-01-01

{% endform %}