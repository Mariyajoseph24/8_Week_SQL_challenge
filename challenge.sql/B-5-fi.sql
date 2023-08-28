WITH ranked_cte AS (
  SELECT 
    sub.customer_id,  
    plans.plan_name, 
	  LEAD(plans.plan_name) OVER ( 
      PARTITION BY sub.customer_id
      ORDER BY sub.start_date) AS next_plan
  FROM subscriptions AS sub
  JOIN plans 
    ON sub.plan_id = plans.plan_id
)
  
SELECT 
  COUNT(customer_id) AS customers,
  ROUND(100.0 * 
    COUNT(customer_id) 
    / (SELECT COUNT(DISTINCT customer_id) 
      FROM subscriptions)
  ) AS churn_percentage
FROM ranked_cte
WHERE plan_name = 'trial' 
  AND next_plan = 'churn';
