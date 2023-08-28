WITH cte AS (
  SELECT interest_id, COUNT(DISTINCT month_year) AS month_count
  FROM interest_metrics
  GROUP BY interest_id
  HAVING COUNT(DISTINCT month_year) >= 6
)

SELECT *
INTO filtered_table
FROM interest_metrics
WHERE interest_id IN (SELECT interest_id FROM cte);

-- Top 10 interests with largest composition values
SELECT
  f.month_year,
  f.interest_id,
  im.interest_name,
  MAX(f.composition) AS max_composition
FROM filtered_table f
JOIN interest_map im ON f.interest_id = im.id::varchar
GROUP BY f.month_year, f.interest_id, im.interest_name
ORDER BY max_composition DESC
LIMIT 10;

-- Bottom 10 interests with smallest composition values
SELECT
  f.month_year,
  f.interest_id,
  im.interest_name,
  MAX(f.composition) AS max_composition
FROM filtered_table f
JOIN interest_map im ON f.interest_id = im.id::varchar
GROUP BY f.month_year, f.interest_id, im.interest_name
ORDER BY max_composition ASC
LIMIT 10;
