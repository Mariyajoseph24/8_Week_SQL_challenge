WITH MonthlyInterestCounts AS (
    SELECT interest_id, COUNT(DISTINCT month_year) AS month_count
    FROM interest_metrics
    GROUP BY interest_id
),
InterestCumulativePercentage AS (
    SELECT
        month_count,
        COUNT(interest_id) AS interest_count,
        SUM(COUNT(interest_id)) OVER (ORDER BY month_count DESC) AS total_interest_count
    FROM MonthlyInterestCounts
    GROUP BY month_count
)
SELECT
    month_count,
    total_interest_count,
    ROUND(total_interest_count * 100.0 / (SELECT SUM(interest_count) FROM InterestCumulativePercentage), 2) AS cumulative_percent
FROM InterestCumulativePercentage
WHERE ROUND(total_interest_count * 100.0 / (SELECT SUM(interest_count) FROM InterestCumulativePercentage), 2) > 90;
