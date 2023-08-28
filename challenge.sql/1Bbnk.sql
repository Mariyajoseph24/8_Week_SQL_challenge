SELECT
  txn_type AS transaction_type, 
  COUNT(customer_id) AS tn_cnt, 
  SUM(txn_amount) AS ttl_amnt
FROM customer_transactions
GROUP BY txn_type;
