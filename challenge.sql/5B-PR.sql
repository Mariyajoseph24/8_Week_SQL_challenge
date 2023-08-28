SELECT MAX(duration) AS long_delivery, MIN(duration) AS shortest_delivery
	   , MAX(duration) - MIN(duration) AS difference
FROM runner_orders_temp;
