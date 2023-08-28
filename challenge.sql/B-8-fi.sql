SELECT
    COUNT(DISTINCT customer_id) AS upgraded_customers_count
FROM
    subscriptions
WHERE
    start_date >= '2020-01-01'
    AND start_date <= '2020-12-31'
    AND plan_id = 3; -- Plan ID 3 represents the annual pro plan
