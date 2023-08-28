SELECT
  f.interest_id,
  im.interest_name,
  AVG(f.ranking) AS avg_ranking
FROM filtered_table f
JOIN interest_map im ON f.interest_id = im.id::varchar
GROUP BY f.interest_id, im.interest_name
ORDER BY avg_ranking ASC
LIMIT 5;
