WITH CTE as (
		SELECT c.order_id, 
    c.order_time, 
    r.pickup_time, EXTRACT(minutes FROM pickup_time - order_time) AS Subst
		FROM runner_orders_temp R
		JOIN customer_orders_tempp C
		USING (order_id)
		WHERE cancellation=''
		GROUP BY c.order_id, c.order_time, r.pickup_time
		)
		
SELECT AVG(Subst)::INT AS pickup_avg
FROM CTE
WHERE Subst > 1;
