WITH CTE AS (
  SELECT 
    customer_id, 
    COUNT(customer_id) AS cnt, 
    AVG(txn_amount) AS avg_amnt
  FROM customer_transactions
  WHERE txn_type = 'deposit'
  GROUP BY customer_id
)

SELECT 
  ROUND(AVG(cnt)) AS count_avgcnt, 
  ROUND(AVG(avg_amnt)) AS amt_avgcnt
FROM CTE;