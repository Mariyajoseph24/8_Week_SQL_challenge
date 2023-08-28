WITH CTE AS
(SELECT R.runner_id, C.customer_id, C.order_id, 
  COUNT(C.order_id) AS pizza_cnt,R.distance,
 ROUND(duration::numeric / 60, 2) hr_duration
FROM runner_orders_temp AS R
JOIN customer_orders_tempp  AS C ON R.order_id = C.order_id
WHERE R.cancellation =''
GROUP BY R.runner_id, C.customer_id, C.order_id, R.distance, R.duration,C.order_time
ORDER BY C.order_id)

SELECT runner_id, order_id, distance, hr_duration,ROUND(distance/hr_duration, 2) avg_speed
	FROM CTE
	GROUP BY runner_id, order_id, distance, hr_duration
	ORDER BY runner_id;