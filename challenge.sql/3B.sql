WITH InterestMonthsCounts AS (
    SELECT interest_id, COUNT(DISTINCT month_year) AS month_count
    FROM interest_metrics
    GROUP BY interest_id
),
TotalMonths AS (
    SELECT MAX(month_count) AS total_months
    FROM InterestMonthsCounts
)
SELECT SUM(imc.month_count) AS total_data_points_to_keep,
       (SELECT COUNT(*) FROM interest_metrics) - SUM(imc.month_count) AS total_data_points_removed
FROM InterestMonthsCounts imc
JOIN TotalMonths tm ON imc.month_count >= tm.total_months;
