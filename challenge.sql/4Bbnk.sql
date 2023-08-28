WITH customer_monthly_balances AS (
  SELECT
    customer_id,
    DATE_TRUNC('month', txn_date) AS transaction_month,
    SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE 0 END) -
    SUM(CASE WHEN txn_type IN ('purchase', 'withdrawal') THEN txn_amount ELSE 0 END) AS closing_balance
  FROM customer_transactions
  GROUP BY customer_id, transaction_month
)

SELECT
  customer_id,
  transaction_month,
  closing_balance
FROM customer_monthly_balances
ORDER BY customer_id, transaction_month;
