WITH CTE AS (
	SELECT runner_id, COUNT(order_id)::numeric totl_orders
	   , COUNT(CASE WHEN cancellation = '' THEN order_id END) com_orders 
FROM runner_orders_temp
GROUP BY runner_id)


SELECT runner_id
	   , (com_orders / totl_orders * 100)::INT  AS completed
FROM CTE
GROUP BY runner_id,completed;