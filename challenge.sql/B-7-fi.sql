SELECT
    p.plan_name,
    COUNT(DISTINCT s.customer_id) AS customer_count,
    ROUND(100.0 * COUNT(DISTINCT s.customer_id) / (SELECT COUNT(DISTINCT customer_id) FROM subscriptions WHERE start_date <= '2020-12-31'), 1) AS percentage
FROM
    subscriptions s
JOIN
    plans p ON s.plan_id = p.plan_id
WHERE
    s.start_date <= '2020-12-31'
GROUP BY
    p.plan_name,p.plan_id
ORDER BY
    p.plan_id;
