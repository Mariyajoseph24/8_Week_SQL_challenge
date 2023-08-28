SELECT
  _month,
  _year,
  month_year,
  interest_id,
  ROUND(SUM(composition)::numeric / SUM(index_value)::numeric, 2) AS average_composition
FROM interest_metrics
GROUP BY _month, _year, month_year, interest_id
ORDER BY _year, _month, average_composition DESC
LIMIT 10;
