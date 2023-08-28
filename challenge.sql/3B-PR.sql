WITH CTE AS
(SELECT c.order_id, 
    COUNT(C.order_id) AS pizza_order, 
    C.order_time, 
    R.pickup_time,EXTRACT(minutes FROM pickup_time - order_time) AS min
	  
FROM customer_orders_tempp C
JOIN runner_orders_temp R
USING(order_id)
WHERE cancellation=''
GROUP BY c.order_id, c.order_time, r.pickup_time)

SELECT 
  pizza_order, 
  ROUND(AVG(min),2) AS avg_prep_time_minutes
FROM CTE
WHERE min > 1
GROUP BY pizza_order;
