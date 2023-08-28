WITH monthly_transactions AS (
  SELECT 
    customer_id, 
    DATE_TRUNC('month', txn_date) AS transaction_month,
    SUM(CASE WHEN txn_type = 'deposit' THEN 0 ELSE 1 END) AS deposit_count,
    SUM(CASE WHEN txn_type = 'withdrawal' THEN 0 ELSE 1 END) AS purchase_count,
	SUM(CASE WHEN txn_type = 'withdrawal' THEN 1 ELSE 0 END) AS withdrawal_count
  FROM customer_transactions
  GROUP BY customer_id,  DATE_TRUNC('month', txn_date)
)

SELECT
  transaction_month AS mth,
  COUNT(DISTINCT customer_id) AS customer_count
FROM monthly_transactions
WHERE deposit_count > 1 
  AND (purchase_count >= 1 OR withdrawal_count >= 1)
GROUP BY transaction_month
ORDER BY transaction_month;
