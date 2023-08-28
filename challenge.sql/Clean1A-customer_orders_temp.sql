DROP TABLE IF EXISTS customer_orders_temp;
CREATE TEMPORARY TABLE customer_orders_temp AS
SELECT 
  order_id, 
  customer_id, 
  pizza_id, 
  CASE
    WHEN exclusions IS NULL OR exclusions LIKE 'null' THEN ' '
    ELSE exclusions
  END AS exclusions,
  CASE
    WHEN extras IS NULL OR extras LIKE 'null' THEN ' '
    ELSE extras
  END AS extras,
  order_time
FROM customer_orders;

SELECT * FROM customer_orders_temp;
