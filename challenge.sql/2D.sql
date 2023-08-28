WITH ranks_tab AS (
  SELECT
    i.interest_id,
    interest_name,
    month_year,
    AVG(composition / index_value) AS avg_composition,
    RANK() OVER (PARTITION BY month_year ORDER BY AVG(composition / index_value) DESC) AS ranks
  FROM interest_metrics i
  JOIN interest_map m ON i.interest_id = m.id::varchar
  GROUP BY i.interest_id, interest_name, month_year
)
SELECT
  interest_id,
  interest_name,
  COUNT(*) OVER (PARTITION BY interest_name) AS counts
FROM ranks_tab
WHERE ranks <= 10
ORDER BY 3 DESC;

