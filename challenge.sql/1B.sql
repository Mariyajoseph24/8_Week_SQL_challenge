SELECT DISTINCT interest_id
FROM interest_metrics 
GROUP BY interest_id
HAVING COUNT(DISTINCT month_year) = (SELECT COUNT(DISTINCT month_year) FROM interest_metrics);

