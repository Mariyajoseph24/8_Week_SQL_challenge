SELECT 
  EXTRACT(HOURS FROM order_time) AS hours,
  COUNT(order_id) AS "pizza ordered"
FROM customer_orders_tempp
GROUP BY hours
ORDER BY hours;
