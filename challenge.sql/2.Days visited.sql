SELECT customer_id, COUNT(DISTINCT order_date) AS No_Days
FROM sales
GROUP BY customer_id