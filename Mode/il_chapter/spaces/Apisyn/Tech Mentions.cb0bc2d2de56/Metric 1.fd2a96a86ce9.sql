{% raw %}
  SELECT date_day as "msg_send_date",total_number_tech_mentions_america as "total_number_tech_mentions_america",tech_name as "tech_name"
  FROM {{
    metrics.calculate(
      metric('total_number_tech_mentions_america'),
      dimensions=['tech_name'],
      grain='day',
    )
  }}
{% endraw %}