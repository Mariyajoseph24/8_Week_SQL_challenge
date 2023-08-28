SELECT customer_id, ROUND(AVG(distance),2) AS average
FROM customer_orders_tempp C
JOIN runner_orders_temp R ON C.order_id=R.order_id
WHERE cancellation=''
GROUP BY customer_id