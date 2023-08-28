SELECT
    DATE_TRUNC('month', start_date) AS month_start,
    COUNT(*) AS trial_starts
FROM
    subscriptions
WHERE
    plan_id = 0
GROUP BY
    month_start
ORDER BY
    month_start;
