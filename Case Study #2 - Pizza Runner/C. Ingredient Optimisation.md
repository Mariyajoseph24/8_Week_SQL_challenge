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
  <ul>
  <li>The SQL query starts by creating two Common Table Expressions (CTEs) named <code>CTE</code> and <code>topping_name</code>.</li>
  <li>In the first CTE, named <code>CTE</code>, it retrieves the <code>pizza_id</code> and separates the toppings data (previously stored as a comma-separated string) into individual integers (<code>topping_id</code>) using the <code>string_to_table</code> function.</li>
  <li>The <code>pizza_recipes</code> table is used to extract the pizza's <code>pizza_id</code> and comma-separated <code>toppings</code> field.</li>
  <li>Results are stored as individual rows in the CTE, with each row containing a <code>pizza_id</code> and corresponding <code>topping_id</code>.</li>
  <li>The second CTE, named <code>topping_name</code>, retrieves the <code>pizza_id</code>, <code>topping_id</code>, and the <code>topping_name</code> for each topping based on the <code>topping_id</code>.</li>
  <li>The <code>topping_name</code> CTE uses the <code>CTE</code> CTE and the <code>pizza_toppings</code> table to get the pizza's <code>pizza_id</code>, <code>topping_id</code>, and the corresponding <code>topping_name</code> for each topping in the recipe.</li>
  <li>Results are ordered by <code>pizza_id</code> and <code>topping_id</code> to ensure a consistent order.</li>
  <li>The main query then retrieves the <code>pizza_name</code> and uses the <code>STRING_AGG</code> function to concatenate all the <code>topping_name</code> values for each pizza into a single string, separated by commas.</li>
  <li>The <code>pizza_names</code> table is used to get the <code>pizza_name</code> corresponding to each <code>pizza_id</code>.</li>
  <li>Results are grouped by <code>pizza_name</code> to concatenate all the <code>topping_name</code> values for each pizza.</li>
  <li>As a result, the query presents the <code>pizza_name</code> and the corresponding standardized ingredients (all the toppings concatenated into a single string, separated by commas) for each pizza from the <code>pizza_recipes</code> table, with the toppings being retrieved from the <code>pizza_toppings</code> table.</li>
</ul>

    
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
  <ul>
  <li>The SQL query starts by creating a Common Table Expression (CTE) named <code>CTE</code>.</li>
  <li>Within the CTE, it retrieves all columns from the <code>customer_orders_tempp</code> table and separates the data in the <code>extras</code> field (previously stored as a comma-separated string) into individual integers (<code>topping_id</code>) using the <code>STRING_TO_TABLE</code> function.</li>
  <li>The <code>WHERE extras != ''</code> clause filters the data to only include rows where the <code>extras</code> field is not empty.</li>
  <li>Results are stored as individual rows in the CTE, with each row containing all columns from the <code>customer_orders_tempp</code> table and the corresponding <code>topping_id</code> values for each pizza in the <code>extras</code> field.</li>
  <li>The main query then retrieves the <code>topping_id</code>, <code>topping_name</code>, and the count of occurrences of each <code>topping_id</code> in the <code>CTE</code>.</li>
  <li>The <code>pizza_toppings</code> table is used to get the <code>topping_name</code> corresponding to each <code>topping_id</code>.</li>
  <li>Results are grouped by <code>topping_id</code> and <code>topping_name</code> to calculate the count of occurrences of each topping.</li>
  <li>The <code>COUNT(topping_id)</code> function calculates the number of occurrences of each <code>topping_id</code> in the <code>CTE</code>, representing the count of pizzas that have the topping as an extra.</li>
  <li>Results are ordered by <code>extra_count</code> in descending order to find the topping with the highest number of occurrences as an extra.</li>
  <li>The <code>LIMIT 1</code> clause ensures that only the topping with the highest count is returned.</li>
  <li>As a result, the query presents the <code>topping_id</code>, <code>topping_name</code>, and the corresponding count of pizzas that have the topping as an extra from the <code>customer_orders_tempp</code> table, with the topping name retrieved from the <code>pizza_toppings</code> table. Only the topping with the highest count is displayed.</li>
</ul>

    
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
  <ul>
  <li>The SQL query starts by creating a subquery (also known as an inline view) to split the data in the <code>exclusions</code> field (previously stored as a comma-separated string) into individual integers (<code>topping_id</code>) using the <code>STRING_TO_TABLE</code> function.</li>
  <li>The subquery retrieves all columns from the <code>customer_orders_tempp</code> table and stores the resulting data in the <code>split_exclusions</code> view.</li>
  <li>Within the subquery, the <code>WHERE exclusions != ''</code> clause filters the data to only include rows where the <code>exclusions</code> field is not empty.</li>
  <li>Results are stored as individual rows in the <code>split_exclusions</code> view, with each row containing all columns from the <code>customer_orders_tempp</code> table and the corresponding <code>topping_id</code> values for each pizza in the <code>exclusions</code> field.</li>
  <li>The main query then retrieves the <code>topping_id</code>, <code>topping_name</code>, and the count of occurrences of each <code>topping_id</code> in the <code>split_exclusions</code> view.</li>
  <li>The <code>pizza_toppings</code> table is used to get the <code>topping_name</code> corresponding to each <code>topping_id</code>.</li>
  <li>Results are grouped by <code>topping_id</code> and <code>topping_name</code> to calculate the count of occurrences of each topping as an exclusion.</li>
  <li>The <code>COUNT(topping_id)</code> function calculates the number of occurrences of each <code>topping_id</code> in the <code>split_exclusions</code> view, representing the count of pizzas that have the topping as an exclusion.</li>
  <li>Results are ordered by <code>exclusions_cnt</code> in descending order to find the topping with the highest number of occurrences as an exclusion.</li>
  <li>The <code>LIMIT 1</code> clause ensures that only the topping with the highest count is returned.</li>
  <li>As a result, the query presents the <code>topping_id</code>, <code>topping_name</code>, and the corresponding count of pizzas that have the topping as an exclusion from the <code>customer_orders_tempp</code> table, with the topping name retrieved from the <code>pizza_toppings</code> table. Only the topping with the highest count is displayed.</li>
</ul>

    
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
<ul>
  <li>The SQL query uses two Common Table Expressions (CTEs) named <code>orders</code> and <code>results</code> to process and format the data from the <code>customer_orders_tempp</code>, <code>pizza_names</code>, and <code>pizza_toppings</code> tables.</li>
  <li>In the first CTE, named <code>orders</code>, it assigns a unique row number to each record using the <code>row_number() OVER()</code> function to create the <code>id</code> column.</li>
  <li>The CTE <code>orders</code> retrieves all columns from the <code>customer_orders_tempp</code> table and joins the <code>pizza_names</code> table using the <code>pizza_id</code> to get the corresponding <code>pizza_name</code>.</li>
  <li>For each record, it creates two arrays: one for exclusions and one for extras. The <code>string_to_array</code> function is used to split the comma-separated values from the <code>exclusions</code> and <code>extras</code> columns into arrays, and the <code>::int[]</code> cast is used to convert them to arrays of integers.</li>
  <li>Results are ordered by <code>id</code> and <code>order_id</code> to ensure consistent ordering.</li>
  <li>In the second CTE, named <code>results</code>, it further processes the data from the <code>orders</code> CTE and formats the results.</li>
  <li>The CTE <code>results</code> selects the <code>id</code>, <code>order_id</code>, <code>pizza_name</code>, <code>exclusions</code>, <code>extras</code>, and <code>order_time</code> columns from the <code>orders</code> CTE.</li>
  <li>For each record, it uses subqueries to retrieve the corresponding exclusion and extra topping names based on the <code>id</code> and formats them into comma-separated strings using the <code>string_agg</code> function.</li>
  <li>The subqueries utilize the <code>unnest</code> function to extract individual values from the exclusion and extra arrays and then join the <code>pizza_toppings</code> table to get the corresponding topping names.</li>
  <li>Finally, the main query retrieves the <code>id</code>, <code>pizza_name</code>, and formatted order items (including exclusions and extras, if available) as a single string.</li>
  <li>The <code>||</code> operator is used to concatenate the <code>pizza_name</code>, "Exclude" if there are exclusions, and "Extras" if there are extras, to form the final <code>order_items</code> string.</li>
  <li>As a result, the query presents the <code>id</code>, <code>pizza_name</code>, and the formatted order items (including exclusions and extras, if available) as a single string for each order from the <code>customer_orders_tempp</code>, <code>pizza_names</code>, and <code>pizza_toppings</code> tables.</li>
</ul>

</ol>
