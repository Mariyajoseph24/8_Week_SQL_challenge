WITH CTE AS (
	SELECT pizza_id
       , string_to_table(toppings, ', ')::INT topping_id
	FROM pizza_recipes),
	topping_name AS(
SELECT pizza_id, topping_id, topping_name
	FROM CTE
	JOIN pizza_toppings
	USING(topping_id)
    ORDER BY pizza_id, topping_id)
	
SELECT pizza_name, STRING_AGG(topping_name, ', ') AS stndrd_ingredients
	FROM topping_name
	JOIN pizza_names
	USING(pizza_id)
	GROUP BY pizza_name;