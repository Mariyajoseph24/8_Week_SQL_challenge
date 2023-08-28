WITH all_plans AS (
  SELECT 
    s.customer_id,
    s.plan_id,
    p.plan_name,
    s.start_date AS plan_start_date,
    p.price,
    CASE 
      WHEN p.plan_name LIKE 'pro monthly%' THEN 
        DATE_TRUNC('month', s.start_date)::DATE
      ELSE 
        CASE 
          WHEN EXTRACT(MONTH FROM s.start_date) = 12 THEN s.start_date
          ELSE DATE_TRUNC('month', s.start_date + INTERVAL '1 month')::DATE
        END
    END AS payment_date
  FROM subscriptions s
  JOIN plans p ON s.plan_id = p.plan_id
  WHERE s.start_date >= '2020-01-01' AND s.start_date <= '2020-12-31'
)
, payments AS (
  SELECT 
    customer_id,
    plan_id,
    plan_name,
    payment_date,
    price AS amount,
    ROW_NUMBER() OVER (PARTITION BY customer_id, plan_id, plan_name, payment_date ORDER BY plan_start_date) AS payment_order
  FROM all_plans
)
-- Finalize the query
SELECT 
  customer_id,
  plan_id,
  plan_name,
  payment_date,
  amount,
  payment_order
FROM payments
WHERE payment_order = 1 OR (amount > 0 AND payment_order > 1)
ORDER BY customer_id, plan_id, payment_date, payment_order
LIMIT 20;
