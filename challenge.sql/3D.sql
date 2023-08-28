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
  month_year,
  AVG(avg_composition) AS average_avg_composition
FROM ranks_tab
WHERE ranks <= 10
GROUP BY month_year
ORDER BY month_year;
