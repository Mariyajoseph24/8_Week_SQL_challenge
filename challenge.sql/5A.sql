SELECT id,interest_name, COUNT(*) AS record_count
FROM interest_map im
join interest_metrics ime on im.id=ime.interest_id::integer
GROUP BY id,interest_name
ORDER BY record_count DESC;
