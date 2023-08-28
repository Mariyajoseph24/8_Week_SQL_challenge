SELECT COUNT(*) AS num_downgrades
FROM subscriptions prev
JOIN subscriptions current ON prev.customer_id = current.customer_id
                          AND prev.plan_id = 2 -- Plan ID 2 represents pro monthly plan
                          AND current.plan_id = 1 -- Plan ID 1 represents basic monthly plan
                          AND prev.start_date <= current.start_date
WHERE EXTRACT(YEAR FROM prev.start_date) = 2020;
