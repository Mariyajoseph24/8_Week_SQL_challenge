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
  ROUND(
    (COUNT(*) FILTER (WHERE closing_balance_increase > 5) * 100.0) / COUNT(*),
    2
  ) AS percentage_increase
FROM (
  SELECT
    customer_id,
    transaction_month,
    closing_balance,
    LAG(closing_balance) OVER (PARTITION BY customer_id ORDER BY transaction_month) AS prev_balance,
    (closing_balance - LAG(closing_balance) OVER (PARTITION BY customer_id ORDER BY transaction_month)) * 100.0 / NULLIF(LAG(closing_balance) OVER (PARTITION BY customer_id ORDER BY transaction_month), 0) AS closing_balance_increase
  FROM customer_monthly_balances
) AS balance_changes;

