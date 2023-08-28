SELECT
    COUNT(DISTINCT CASE WHEN s.plan_id = 4 AND s.start_date <= CURRENT_DATE THEN s.customer_id END) AS churned_customers,
    ROUND(COUNT(DISTINCT CASE WHEN s.plan_id = 4 AND s.start_date <= CURRENT_DATE THEN s.customer_id END) * 100.0 / COUNT(DISTINCT s.customer_id), 1) AS churned_percentage
FROM
    subscriptions s;
