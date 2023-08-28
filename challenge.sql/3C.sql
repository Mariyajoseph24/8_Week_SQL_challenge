SELECT
  f.interest_id,
  im.interest_name,
  STDDEV(f.percentile_ranking) AS std_dev_percentile_ranking
FROM filtered_table f
JOIN interest_map im ON f.interest_id = im.id::varchar
GROUP BY f.interest_id, im.interest_name
ORDER BY std_dev_percentile_ranking DESC
LIMIT 5;
