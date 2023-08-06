<h2><a name="c.ingredientoptimisation"></a>C. Ingredient Optimisation🍕</h2>
<h5>Solutions:</h5>

<ol>
  <li><h5>What are the standard ingredients for each pizza?</h5></li>

  ```sql
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
```
<h6>Answer:</h6>
  <img width="400" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/7af6d859-545c-488c-bee8-5e4bc4f4848f">
    
  <li><h5>What was the most commonly added extra?</h5></li>

  ```sql
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
```
<h6>Answer:</h6>
  <img width="300" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/8996c135-c2ae-4ad2-8f46-661c56c2ceb7">
    
  <li><h5>What was the most common exclusion?</h5></li>
  
  ```sql
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
  ```
<h6>Answer:</h6>
  <img width="300" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/7a84787b-26ba-4c32-838c-26d6826b381b">
    
  <li><h5>Generate an order item for each record in the customers_orders table in the format of one of the following:
<ul>
<li>Meat Lovers</li>
<li>Meat Lovers - Exclude Beef</li>
<li>Meat Lovers - Extra Bacon</li>
<li>Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers</li></h5></li></ul>

```sql
WITH orders AS (
    SELECT
    row_number() OVER() AS id
    , C.*
    , pn.pizza_name
       , CASE
            WHEN LENGTH(C.exclusions) = 0 THEN null
            ELSE string_to_array(C.exclusions,',')::int[]
        END exclusion
       , CASE
            WHEN LENGTH(C.extras) = 0 THEN null
            ELSE string_to_array(C.extras,',')::int[]
        END extra
FROM  customer_orders_tempp C
JOIN pizza_names pn
USING(pizza_id)
ORDER BY id, order_id
),

results AS (SELECT
    id
    , order_id
    , pizza_name
    , (
        SELECT 
            string_agg(topping_name, ', ')
        from pizza_toppings pt
        where pt.topping_id IN (SELECT unnest(exclusion) FROM orders o WHERE o.id = orders.id)
    ) exclusions
    , (
        SELECT 
            string_agg(topping_name, ', ')
        from pizza_toppings pt
        where pt.topping_id IN (SELECT unnest(extra) FROM orders o WHERE o.id = orders.id)
    ) extras
    , order_time
FROM orders)

SELECT
    id
    , pizza_name || CASE
        WHEN exclusions IS NULL THEN ''
        ELSE ' - Exclude ' || exclusions
        END || CASE
        WHEN extras IS NULL THEN ''
        ELSE ' - Extras ' || extras
        END order_items
FROM results; 

```
<h6>Answer:</h6>
<img width="400" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/d243a081-ea2a-49af-b8be-78a96399ee48">
</ol>
