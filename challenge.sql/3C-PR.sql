SELECT topping_id, topping_name, COUNT(topping_id) AS exclusions_cnt
FROM (
	SELECT *
	   , STRING_TO_TABLE(exclusions, ',')::INT topping_id
	FROM customer_orders_tempp
	WHERE exclusions != ''
	) split_exclusions
	
JOIN pizza_toppings
USING(topping_id)
GROUP BY topping_id,topping_name
ORDER BY exclusions_cnt DESC
LIMIT 1;
