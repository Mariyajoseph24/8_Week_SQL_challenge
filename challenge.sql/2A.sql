SELECT
  month_year,
  COUNT(*) AS record_count
FROM interest_metrics
GROUP BY month_year
ORDER BY month_year NULLS FIRST;



