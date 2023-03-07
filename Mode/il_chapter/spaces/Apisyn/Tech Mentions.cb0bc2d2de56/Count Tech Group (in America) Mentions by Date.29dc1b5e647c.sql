{% raw %}
  SELECT date_month as "msg_send_date",total_number_tech_mentions_america as "total_number_tech_mentions_america",tech_group as "tech_group"
  FROM {{
    metrics.calculate(
      metric('total_number_tech_mentions_america'),
      dimensions=['tech_group'],
      grain='month',
    )
  }}
{% endraw %}