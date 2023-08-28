WITH CTE AS (
			SELECT *
				   , STRING_TO_TABLE(extras, ',')::INT topping_id
			FROM customer_orders_tempp
			WHERE extras != '')
		
SELECT topping_id, topping_name, COUNT(topping_id) AS extra_count
FROM CTE
JOIN pizza_toppings
USING(topping_id)
GROUP BY topping_id,topping_name
ORDER BY extra_count DESC
LIMIT 1;
