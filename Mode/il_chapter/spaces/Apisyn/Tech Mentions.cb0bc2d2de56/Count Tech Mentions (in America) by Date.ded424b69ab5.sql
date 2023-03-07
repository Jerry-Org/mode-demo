{% raw %}
  SELECT date_month as "msg_send_date",total_number_tech_mentions_america as "total_number_tech_mentions_america"
  FROM {{
    metrics.calculate(
      metric('total_number_tech_mentions_america'),
      dimensions=[],
      grain='month',
    )
  }}
{% endraw %}