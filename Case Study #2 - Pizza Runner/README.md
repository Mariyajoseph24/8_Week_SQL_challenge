<h1>Case Study #2 Pizza Runner🍕</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/8fbb6bcb-31bd-4b7e-8083-07596fdd911d">
<h1>Contents</h1>
<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#entityrelationshipdiagram">Entity Relationship Diagram</a></li>
  <li><a href="#datacleaninganddatatransformation">Data Cleaning & Data Transformation</a></li>
  <li><a href="#casestudyquestionsandsolutions">Case Study Questions & Solutions</a></li>
  
  <ul>
  <li><a href="#a.pizzametrics">A. Pizza Metrics</a></li>
  <li><a href="#b.runnerandcustomerexperience">B. Runner And Customer Experience</a></li>
  <li><a href="#c.ingredientoptimisation">C. Ingredient Optimisation</a></li>
  </ul>
  
  <li><a href="#keyinsights">Key Insights</a></li>
</ul>

<h1><a name="introduction">Introduction</a></h1>
<p>Welcome to the Pizza Runner Case Study! Follow Danny's journey as he combines the irresistible allure of "80s Retro Styling and Pizza Is The Future" to launch Pizza Runner, an innovative venture in the pizza delivery industry. With his background in data science, Danny understands the significance of data collection for business growth. Now, he seeks assistance in cleaning and analyzing the data to optimize Pizza Runner's operations and guide his runners more efficiently. Join us as we explore how data-driven decisions propel Pizza Runner towards success and elevate the pizza delivery experience to new heights.</p>

<h1><a name="entityrelationshipdiagram"></a>Entity Relationship Diagram</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/38cb5eb7-522d-4081-adb5-0b47ac2ef0a8">

<h1><a name="datacleaninganddatatransformation"></a>Data Cleaning & Data Transformation</h1>

<ul>
<li><h5>customer_orders table Before</h5></li>
  
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/2ba5364c-d9b5-48f1-bb31-b010a28ad9b6">
<ul>
  <li>The customer_orders table consists of individual pizza orders, with each row representing a unique pizza.</li>
  <li>Key columns in the table are pizza_id, exclusions, and extras.</li>
  <li>Before utilizing the data for queries, the exclusions and extras columns require a data cleaning process to ensure accuracy and consistency.</li>
  <li>Data cleaning involves handling missing or null values in the exclusions and extras columns.</li>
  <li>The ingredient_id values in the exclusions and extras columns need to be standardized for uniformity.</li>
  <li>Inconsistencies and duplicates in the exclusions and extras data should be resolved to eliminate ambiguities.</li>
  <li>By performing thorough data cleaning, the customer_orders table will be optimized for effective analysis.</li>
  <li>The cleaned data will provide valuable insights into customer preferences, enabling better decision-making for Pizza Runner's operations.</li>
  <li>With accurate data, Pizza Runner can efficiently meet customer demands and deliver an enhanced pizza ordering experience.</li>
</ul>

```sql
DROP TABLE IF EXISTS customer_orders_tempp;
CREATE TABLE IF NOT EXISTS customer_orders_tempp AS
SELECT 
  order_id,
  customer_id,
  pizza_id,
  CASE 
    WHEN exclusions IS NULL OR exclusions LIKE 'null' THEN ''
    ELSE exclusions
  END AS exclusions,
  CASE 
    WHEN extras IS NULL OR extras LIKE 'null' THEN ''
    ELSE extras
  END AS extras,
  order_time
FROM customer_orders;

SELECT*
FROM customer_orders_temp
```
<li><h5>customer_orders table After AS customer_order_tempp</h5></li>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/2d344d6f-695f-4128-befe-09d692b7a115">
<li><h5>runner_orders table Before</h5></li>

<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/086a9085-3f8b-4f49-8ef0-101e198f91eb">
 <ul>
  <p>The data in the orders table of Pizza Runner contains valuable information regarding the assignment of orders to runners, including pickup times, distances, and durations. However, it is crucial to note that the table may have some known data issues that require careful handling during data cleaning.</p><br>

<p>Here are the key points to consider when cleaning the data in the orders table:</p>

<li>Verify Data Types: Before proceeding with data cleaning, it is essential to check the data types for each column in the schema SQL. Ensuring accurate data types will prevent potential data type mismatches and errors in subsequent queries.</li>

<li>Handle Incomplete Orders: Some orders may not be fully completed and can be canceled by either the restaurant or the customer. It is necessary to identify and properly handle these incomplete orders during the data cleaning process.</li>

<li>Address Null Values: The table may contain null values in certain columns, such as pickup_time, distance, and duration. Properly handling these null values is crucial to avoid inaccuracies in the analysis.</li>

<li>Validate Timestamps: The pickup_time column represents the timestamp when the runner arrives at Pizza Runner headquarters to pick up the pizzas. Validating and ensuring the consistency of these timestamps will be essential to maintain data integrity.</li>

<li>Clean Distance and Duration: The distance and duration fields provide information about the runner's travel to deliver the order. Cleaning these fields involves checking for any outliers or inconsistencies that may affect analysis results.</li>

<li>Address Known Data Issues: As there are known data issues in the table, special attention must be given to resolving these issues during the data cleaning process. Identifying and rectifying data discrepancies will enhance the accuracy and reliability of the dataset.</li>
</ul>

```sql
DROP TABLE IF EXISTS runner_orders_temp;

CREATE TABLE runner_orders_temp AS(
	SELECT order_id
	   , runner_id
	   , CASE 
	   	   WHEN pickup_time IS null OR pickup_time LIKE 'null' THEN null
	       ELSE pickup_time
	     END pickup_time
	   , CASE 
	   	   WHEN distance IS null OR distance LIKE 'null' THEN null
	       WHEN distance LIKE '%km' THEN TRIM('km' from distance)
	       ELSE distance
	     END distance
	   , CASE 
	   	  WHEN duration IS null OR duration LIKE 'null' THEN null
	      WHEN duration LIKE '%mins' THEN TRIM('mins' from duration)
	      WHEN duration LIKE '%minute' THEN TRIM('minute' from duration)
	      WHEN duration LIKE '%minutes' THEN TRIM('minutes' from duration)
	      ELSE duration 
	     END duration
	   , CASE 
	   	   WHEN cancellation IS null OR cancellation LIKE 'null'
		   THEN ''
	       ELSE cancellation
	     END cancellation
	FROM runner_orders
	);

ALTER TABLE runner_orders_temp
	ALTER COLUMN pickup_time TYPE timestamp without time zone
	USING pickup_time::timestamp,
	ALTER COLUMN distance TYPE NUMERIC
	USING distance::numeric,
	ALTER COLUMN duration TYPE INT
	USING duration::integer;
		
SELECT*
FROM runner_orders_temp
```


<li><h5>runner_orders table After AS runner_orders_temp</h5></li>
<img width="500" alt="Coding" src='https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/16580860-979b-450c-9cd4-c726659995a5'>
</ul>


<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>

<h4><a name="a.pizzametrics"></a>A. Pizza Metrics🍕🍕</h4>

<ol> 
  <li><h5>How many pizzas were ordered?</h5></li>
 
```sql
SELECT COUNT(order_id) AS pizza_orders
FROM customer_orders_tempp

```

<h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/7f304383-b85d-4cb9-80ac-863f641647a3">
<ul>
  <li>The SQL query selects the number of pizza orders (<code>pizza_orders</code>) from the <code>customer_orders_tempp</code> table.</li>
  <li>The <code>COUNT(order_id)</code> function calculates the total number of order IDs in the <code>customer_orders_tempp</code> table, effectively giving the count of pizza orders.</li>
  <li>As a result, the query presents the total count of pizza orders as <code>pizza_orders</code>.</li>
</ul>



   <li><h5>How many unique customer orders were made?</h5></li>
   
```sql
SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM customer_orders_tempp
```

   <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/015a6c20-99d0-4342-967f-ef3f4c12a69d">
<ul>
  <li>The SQL query selects the number of unique orders (<code>unique_orders</code>) from the <code>customer_orders_tempp</code> table.</li>
  <li>The <code>COUNT(DISTINCT order_id)</code> function calculates the total count of distinct order IDs in the <code>customer_orders_tempp</code> table, effectively giving the count of unique orders.</li>
  <li>As a result, the query presents the total count of unique orders as <code>unique_orders</code>.</li>
</ul>



   <li><h5>How many successful orders were delivered by each runner?</h5></li>

   ```sql
SELECT runner_id,COUNT(order_id)AS orders_delivered
FROM runner_orders_temp
WHERE cancellation=''
GROUP BY runner_id
```

  <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/315359f2-94ff-4db7-af2f-a1043259178f">
<ul>
  <li>The SQL query selects the <code>runner_id</code> and counts the number of orders delivered (<code>orders_delivered</code>) for each runner from the <code>runner_orders_temp</code> table.</li>
  <li>It retrieves data from the <code>runner_orders_temp</code> table.</li>
  <li>The query filters the data using the <code>WHERE</code> clause, selecting only the rows where the <code>cancellation</code> column is empty (i.e., no cancellation).</li>
  <li>Results are grouped by <code>runner_id</code>.</li>
  <li>The <code>COUNT(order_id)</code> function calculates the number of occurrences of each <code>order_id</code> in the <code>runner_orders_temp</code> table, giving the count of orders delivered by each runner.</li>
  <li>As a result, the query presents the total count of orders delivered as <code>orders_delivered</code> for each runner from the <code>runner_orders_temp</code> table.</li>
</ul>


   <li><h5>How many of each type of pizza was delivered?</h5></li>

  ```sql
SELECT pizza_name,COUNT(C.pizza_id)AS delivered_order_count
FROM customer_orders_tempp C
JOIN runner_orders_temp R ON C.order_id=R.order_id
JOIN pizza_names PN ON C.pizza_id=PN.pizza_id
WHERE cancellation=''
GROUP BY pizza_name

```

  <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/9278e4ca-3b7c-4bf4-807a-3ea93e21bd90">
<ul>
  <li>The SQL query retrieves the <code>pizza_name</code> and counts the number of delivered orders for each pizza (<code>delivered_order_count</code>) from the <code>customer_orders_tempp</code> table.</li>
  <li>It retrieves data from the <code>customer_orders_tempp</code> table and joins it with the <code>runner_orders_temp</code> table and the <code>pizza_names</code> table.</li>
  <li>The query performs joins between the tables based on matching <code>order_id</code>, <code>pizza_id</code>, and <code>pizza_name</code>.</li>
  <li>It also filters the data using the <code>WHERE</code> clause, selecting only the rows where the <code>cancellation</code> column is empty (i.e., no cancellation).</li>
  <li>Results are grouped by <code>pizza_name</code> to get the count of delivered orders for each pizza.</li>
  <li>The <code>COUNT(C.pizza_id)</code> function calculates the number of occurrences of each <code>pizza_id</code> in the <code>customer_orders_tempp</code> table, giving the count of delivered orders for each pizza.</li>
  <li>As a result, the query presents the total count of delivered orders as <code>delivered_order_count</code> for each pizza from the <code>customer_orders_tempp</code>, <code>runner_orders_temp</code>, and <code>pizza_names</code> tables.</li>
</ul>


   <li><h5>How many Vegetarian and Meatlovers were ordered by each customer?</h5></li>

   ```sql
SELECT C.customer_id,PN.pizza_name,COUNT(PN.pizza_id)AS count_ord
FROM customer_orders_temp C
JOIN pizza_names PN ON C.pizza_id=PN.pizza_id
GROUP BY C.customer_id,PN.pizza_name
ORDER BY C.customer_id
```  

   <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/83617d3c-0120-44e9-a1a0-144c96e37ec2">
<ul>
  <li>The SQL query retrieves the <code>customer_id</code>, <code>pizza_name</code>, and counts the number of ordered pizzas for each customer and pizza combination (<code>count_ord</code>) from the <code>customer_orders_temp</code> table.</li>
  <li>It retrieves data from the <code>customer_orders_temp</code> table and joins it with the <code>pizza_names</code> table based on matching <code>pizza_id</code>.</li>
  <li>Results are grouped by both <code>customer_id</code> and <code>pizza_name</code> to calculate the count of ordered pizzas for each customer and pizza combination.</li>
  <li>The <code>COUNT(PN.pizza_id)</code> function calculates the number of occurrences of each <code>pizza_id</code> in the <code>customer_orders_temp</code> table, giving the count of ordered pizzas for each customer and pizza combination.</li>
  <li>As a result, the query presents the total count of ordered pizzas as <code>count_ord</code> for each customer and pizza combination from the <code>customer_orders_temp</code> and <code>pizza_names</code> tables.</li>
  <li>The final result is sorted in ascending order based on the <code>customer_id</code>.</li>
</ul>


   <li><h5>What was the maximum number of pizzas delivered in a single order?</h5></li>

   ```sql
WITH CTE AS 
(SELECT C.order_id,COUNT(C.pizza_id) AS orders_delivered
FROM customer_orders_tempp C
JOIN runner_orders_temp R ON C.order_id=R.order_id
WHERE r.cancellation=''
GROUP BY C.order_id)

SELECT MAX(orders_delivered) AS max_deliver_pizza
FROM CTE
```

   <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/aded37c9-9df5-4da3-9708-b5061cbb16c4">
<ul>
  <li>The SQL query starts by creating a Common Table Expression (CTE) named <code>CTE</code>.</li>
  <li>Within the CTE, it retrieves the <code>order_id</code> and calculates the number of pizzas delivered for each order (<code>orders_delivered</code>) from the <code>customer_orders_tempp</code> table.</li>
  <li>It performs an inner join between the <code>customer_orders_tempp</code> table and the <code>runner_orders_temp</code> table on matching <code>order_id</code> to get the pizza delivery information.</li>
  <li>The query filters the data using the <code>WHERE</code> clause, selecting only the rows where the cancellation column (<code>cancellation</code>) in the <code>runner_orders_temp</code> table is empty (i.e., no cancellation).</li>
  <li>Results are grouped by <code>order_id</code> to calculate the count of pizzas delivered for each order.</li>
  <li>The <code>COUNT(C.pizza_id)</code> function calculates the number of occurrences of each <code>pizza_id</code> in the <code>customer_orders_tempp</code> table, giving the count of pizzas delivered for each order.</li>
  <li>Next, the main query selects the maximum value of <code>orders_delivered</code> from the <code>CTE</code> CTE.</li>
  <li>The <code>MAX(orders_delivered)</code> function returns the maximum value of <code>orders_delivered</code> among all the orders.</li>
  <li>As a result, the query presents the maximum count of pizzas delivered as <code>max_deliver_pizza</code> among all the orders from the <code>customer_orders_tempp</code> and <code>runner_orders_temp</code> tables, excluding any orders with cancellations.</li>
</ul>


   <li><h5>For each customer, how many delivered pizzas had at least 1 change and how many had no changes?</h5></li>

   ```sql
WITH CTE AS
(SELECT C.customer_id,
SUM(CASE WHEN C.exclusions!=''OR C.extras!=''THEN 1 ELSE 0 END) AS has_atleast_1_changes,
SUM(CASE WHEN C.exclusions=''AND C.extras=''THEN 1 ELSE 0 END) AS no_changes
FROM customer_orders_tempp C 
JOIN runner_orders_temp R ON C.order_id=R.order_id
WHERE R.cancellation=''
GROUP BY C.customer_id)

SELECT SUM(has_atleast_1_changes) AS has_atleast_1_changes,
	   SUM(no_changes) AS no_changes
FROM CTE
```

   <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/02068c6b-aff7-4a87-997a-ff02f56d3cf3">
<ul>
  <li>The SQL query starts by creating a Common Table Expression (CTE) named <code>CTE</code>.</li>
  <li>Within the CTE, it retrieves the <code>customer_id</code> and calculates two aggregates: 
    <ul>
      <li><code>has_atleast_1_changes</code> - the count of customers who have at least one change in their orders.</li>
      <li><code>no_changes</code> - the count of customers who have no changes in their orders (neither exclusions nor extras).</li>
    </ul>
  </li>
  <li>It performs an inner join between the <code>customer_orders_tempp</code> table and the <code>runner_orders_temp</code> table on matching <code>order_id</code> to get the order information.</li>
  <li>The query filters the data using the <code>WHERE</code> clause, selecting only the rows where the cancellation column (<code>cancellation</code>) in the <code>runner_orders_temp</code> table is empty (i.e., no cancellation).</li>
  <li>The <code>CASE</code> statement is used to conditionally evaluate whether there are exclusions or extras in the orders for each customer.</li>
  <li>The <code>SUM</code> function is then used to calculate the totals of <code>has_atleast_1_changes</code> and <code>no_changes</code> for each customer.</li>
  <li>Next, the main query selects the sum of <code>has_atleast_1_changes</code> and <code>no_changes</code> from the <code>CTE</code> CTE.</li>
  <li>The <code>SUM</code> function returns the sum of these values, giving the total count of customers who have at least one change in their orders and the total count of customers who have no changes in their orders.</li>
  <li>As a result, the query presents the total count of customers with at least one change (<code>has_atleast_1_changes</code>) and the total count of customers with no changes (<code>no_changes</code>) among all the orders from the <code>customer_orders_tempp</code> and <code>runner_orders_temp</code> tables, excluding any orders with cancellations.</li>
</ul>


   <li><h5>How many pizzas were delivered that had both exclusions and extras?</h5></li>

   ```sql
SELECT SUM(CASE WHEN C.exclusions!='' AND C.extras!='' THEN 1 ELSE 0 END) AS pizza_with_exclusions_extras
FROM customer_orders_tempp C
JOIN runner_orders_temp R ON C.order_id=R.order_id
WHERE R.cancellation=''
```

   <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/d2596131-2fdd-444b-9f52-aa17bf8b4e0b">
<ul>
  <li>The SQL query calculates the count of pizzas with both exclusions and extras (<code>pizza_with_exclusions_extras</code>) from the <code>customer_orders_tempp</code> table.</li>
  <li>It performs an inner join between the <code>customer_orders_tempp</code> table and the <code>runner_orders_temp</code> table on matching <code>order_id</code> to get the order information.</li>
  <li>The query filters the data using the <code>WHERE</code> clause, selecting only the rows where the cancellation column (<code>cancellation</code>) in the <code>runner_orders_temp</code> table is empty (i.e., no cancellation).</li>
  <li>The <code>CASE</code> statement is used to conditionally evaluate whether there are both exclusions and extras in the orders for each pizza.</li>
  <li>The <code>SUM</code> function then calculates the total count of pizzas with both exclusions and extras by summing up the ones that meet the specified condition.</li>
  <li>As a result, the query presents the total count of pizzas with both exclusions and extras as <code>pizza_with_exclusions_extras</code> among all the orders from the <code>customer_orders_tempp</code> and <code>runner_orders_temp</code> tables, excluding any orders with cancellations.</li>
</ul>


   <li><h5>What was the total volume of pizzas ordered for each hour of the day?</h5></li>

   ```sql
SELECT 
  EXTRACT(HOURS FROM order_time) AS hours,
  COUNT(order_id) AS "pizza ordered"
FROM customer_orders_tempp
GROUP BY hours
ORDER BY hours;
```

   <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/571af1d6-8293-4332-a466-5d5c7c15728f">
<ul>
  <li>The SQL query selects the hours portion of the <code>order_time</code> and the count of orders (<code>pizza ordered</code>) from the <code>customer_orders_tempp</code> table.</li>
  <li>It uses the <code>EXTRACT</code> function with <code>HOURS</code> to extract the hour portion from the <code>order_time</code>.</li>
  <li>Results are grouped by the extracted hour value to calculate the count of orders for each hour.</li>
  <li>The <code>COUNT(order_id)</code> function calculates the number of occurrences of each <code>order_id</code> in the <code>customer_orders_tempp</code> table, giving the count of orders for each hour.</li>
  <li>The query presents the extracted hours as <code>hours</code> and the corresponding count of orders as <code>pizza ordered</code>.</li>
  <li>Finally, the results are sorted in ascending order based on the extracted hours.</li>
</ul>


   <li><h5>What was the volume of orders for each day of the week?</h5></li>

   ```sql
SELECT to_char(order_time, 'DAY')AS day, COUNT(order_id) AS ordered_pizza
FROM customer_orders_tempp
GROUP BY 1
```

   <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/55255c08-49f8-4b59-bd18-62c37c99fcf7">
<ul>
  <li>The SQL query selects the day of the week from the <code>order_time</code> and the count of orders (<code>ordered_pizza</code>) from the <code>customer_orders_tempp</code> table.</li>
  <li>It uses the <code>to_char</code> function to convert the <code>order_time</code> into a textual representation of the day of the week (<code>DAY</code>).</li>
  <li>Results are grouped by the textual representation of the day of the week to calculate the count of orders for each day.</li>
  <li>The <code>COUNT(order_id)</code> function calculates the number of occurrences of each <code>order_id</code> in the <code>customer_orders_tempp</code> table, giving the count of orders for each day of the week.</li>
  <li>The query presents the textual representation of the day of the week as <code>day</code> and the corresponding count of orders as <code>ordered_pizza</code>.</li>
  <li>Finally, the results are sorted based on the textual representation of the day of the week.</li>
</ul>
</ol>

<h4><a name="b.runnerandcustomerexperience"></a>B. Runner And Customer Experience 💁‍♂️🍕</h4>

<ol>
  
  <li><h5>How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)</h5></li>
  
  ```sql
SELECT to_char(registration_date::date, 'ww')::int AS weeks
	  , COUNT(runner_id)AS signed_runner_week
FROM runners
GROUP BY 1
ORDER BY 1;
```
  
  <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/8f396ba8-7760-47a1-9b2e-6ec1124770f8">
  <ul>
  <li>The SQL query retrieves the week number of the year from the <code>registration_date</code> column in the <code>runners</code> table and the count of signed-up runners for each week (<code>signed_runner_week</code>).</li>
  <li>It uses the <code>to_char</code> function to convert the <code>registration_date</code> to a text representation of the week number of the year (<code>'ww'</code>).</li>
  <li>The <code>::date</code> cast is used to convert the <code>registration_date</code> from a timestamp to a date data type before extracting the week number.</li>
  <li>Results are grouped by the week number of the year to calculate the count of signed-up runners for each week.</li>
  <li>The <code>COUNT(runner_id)</code> function calculates the number of occurrences of each <code>runner_id</code> in the <code>runners</code> table, giving the count of signed-up runners for each week.</li>
  <li>As a result, the query presents the week number of the year as <code>weeks</code> and the corresponding count of signed-up runners as <code>signed_runner_week</code>.</li>
  <li>Finally, the results are sorted in ascending order based on the week number of the year.</li>
</ul>

  
   <li><h5>What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pick up the order?</h5></li>

   ```sql
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

```

 <h6>Answer:</h6>
   <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/f0033011-8021-43dd-a719-b0fbf2ef8bb3">
   <ul>
  <li>The SQL query starts by creating a Common Table Expression (CTE) named <code>CTE</code>.</li>
  <li>Within the CTE, it retrieves the <code>order_id</code>, <code>order_time</code>, <code>pickup_time</code>, and calculates the time difference in minutes (<code>Subst</code>) between the <code>pickup_time</code> and <code>order_time</code> for each order from the <code>runner_orders_temp</code> and <code>customer_orders_tempp</code> tables.</li>
  <li>It performs an inner join between the <code>runner_orders_temp</code> table and the <code>customer_orders_tempp</code> table on matching <code>order_id</code> to get the order and pickup time information.</li>
  <li>The query filters the data using the <code>WHERE</code> clause, selecting only the rows where the cancellation column (<code>cancellation</code>) in the <code>runner_orders_temp</code> table is empty (i.e., no cancellation).</li>
  <li>Results are grouped by <code>order_id</code>, <code>order_time</code>, and <code>pickup_time</code> to calculate the time difference (<code>Subst</code>) for each order.</li>
  <li>The <code>EXTRACT(minutes FROM pickup_time - order_time)</code> expression calculates the time difference in minutes between the <code>pickup_time</code> and <code>order_time</code> for each order.</li>
  <li>Next, the main query retrieves the integer value of the average of all <code>Subst</code> values greater than 1 from the <code>CTE</code> CTE.</li>
  <li>The <code>AVG(Subst)::INT</code> expression calculates the average of all <code>Subst</code> values in the CTE and then converts it to an integer, effectively rounding down to the nearest integer.</li>
  <li>The <code>WHERE Subst > 1</code> clause filters out any time differences that are less than or equal to 1 minute.</li>
  <li>As a result, the query presents the integer value of the average pickup time for all orders with pickup times more than 1 minute after the order times from the <code>runner_orders_temp</code> and <code>customer_orders_tempp</code> tables, excluding any orders with cancellations.</li>
</ul>
   
   <li><h5>Is there any relationship between the number of pizzas and how long the order takes to prepare?</h5></li>

```sql
  WITH CTE AS
(SELECT c.order_id, 
    COUNT(C.order_id) AS pizza_order, 
    C.order_time, 
    R.pickup_time,EXTRACT(minutes FROM pickup_time - order_time) AS min
	  
FROM customer_orders_tempp C
JOIN runner_orders_temp R
USING(order_id)
WHERE cancellation=''
GROUP BY c.order_id, c.order_time, r.pickup_time)

SELECT 
  pizza_order, 
  ROUND(AVG(min),2) AS avg_prep_time_minutes
FROM CTE
WHERE min > 1
GROUP BY pizza_order;

```

<h6>Answer:</h6>
   <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/ca6a5e02-74d8-4a33-8688-5621ac2bb58e">
   <ul>
  <li>The SQL query starts by creating a Common Table Expression (CTE) named <code>CTE</code>.</li>
  <li>Within the CTE, it retrieves the <code>order_id</code>, calculates the count of pizzas ordered for each order (<code>pizza_order</code>), the <code>order_time</code>, <code>pickup_time</code>, and calculates the time difference in minutes (<code>min</code>) between the <code>pickup_time</code> and <code>order_time</code> for each order from the <code>customer_orders_tempp</code> and <code>runner_orders_temp</code> tables.</li>
  <li>It performs an inner join between the <code>customer_orders_tempp</code> table and the <code>runner_orders_temp</code> table on matching <code>order_id</code> to get the order and pickup time information.</li>
  <li>The query filters the data using the <code>WHERE</code> clause, selecting only the rows where the cancellation column (<code>cancellation</code>) in the <code>runner_orders_temp</code> table is empty (i.e., no cancellation).</li>
  <li>Results are grouped by <code>order_id</code>, <code>order_time</code>, and <code>pickup_time</code> to calculate the count of pizzas ordered and the time difference (<code>min</code>) for each order.</li>
  <li>The <code>COUNT(C.order_id)</code> function calculates the number of occurrences of each <code>order_id</code> in the <code>customer_orders_tempp</code> table, giving the count of pizzas ordered for each order.</li>
  <li>The <code>EXTRACT(minutes FROM pickup_time - order_time)</code> expression calculates the time difference in minutes between the <code>pickup_time</code> and <code>order_time</code> for each order.</li>
  <li>Next, the main query retrieves the count of pizzas ordered (<code>pizza_order</code>) and the rounded average of all <code>min</code> values (average preparation time in minutes) for orders with preparation times more than 1 minute from the <code>CTE</code> CTE.</li>
  <li>The <code>ROUND(AVG(min),2)</code> expression calculates the average preparation time for pizzas and rounds it to two decimal places.</li>
  <li>The <code>WHERE min > 1</code> clause filters out any orders with preparation times less than or equal to 1 minute.</li>
  <li>Results are grouped by <code>pizza_order</code>, which represents the count of pizzas ordered for each order.</li>
  <li>As a result, the query presents the count of pizzas ordered (<code>pizza_order</code>) and the rounded average preparation time in minutes for orders with preparation times more than 1 minute from the <code>customer_orders_tempp</code> and <code>runner_orders_temp</code> tables, excluding any orders with cancellations.</li>
</ul>
   
   <li><h5>What was the average distance travelled for each customer?</h5></li>

   ```sql
SELECT customer_id, ROUND(AVG(distance),2) AS average
FROM customer_orders_tempp C
JOIN runner_orders_temp R ON C.order_id=R.order_id
WHERE cancellation=''
GROUP BY customer_id
```

 <h6>Answer:</h6>
   <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/0574485e-13d0-4779-9d23-019f0871ecbc">
   <ul>
  <li>The SQL query retrieves the <code>customer_id</code> and calculates the rounded average distance traveled for each customer (<code>average</code>) from the <code>customer_orders_tempp</code> and <code>runner_orders_temp</code> tables.</li>
  <li>It performs an inner join between the <code>customer_orders_tempp</code> table and the <code>runner_orders_temp</code> table on matching <code>order_id</code> to get the order and delivery information.</li>
  <li>The query filters the data using the <code>WHERE</code> clause, selecting only the rows where the cancellation column (<code>cancellation</code>) in the <code>runner_orders_temp</code> table is empty (i.e., no cancellation).</li>
  <li>Results are grouped by <code>customer_id</code> to calculate the average distance traveled for each customer.</li>
  <li>The <code>AVG(distance)</code> function calculates the average value of the <code>distance</code> column from the joined tables, which represents the distance traveled for each order.</li>
  <li>The <code>ROUND(AVG(distance),2)</code> expression calculates the rounded average distance for each customer to two decimal places.</li>
  <li>As a result, the query presents the <code>customer_id</code> and the corresponding rounded average distance traveled as <code>average</code> for each customer from the <code>customer_orders_tempp</code> and <code>runner_orders_temp</code> tables, excluding any orders with cancellations.</li>
</ul>
   
   <li><h5>What was the difference between the longest and shortest delivery times for all orders?</h5></li>

   ```sql
SELECT MAX(duration) AS long_delivery, MIN(duration) AS shortest_delivery
	   , MAX(duration) - MIN(duration) AS difference
FROM runner_orders_temp;
```

 <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/9c7a053f-9620-4572-b650-eacdbc00138f">
  <ul>
  <li>The SQL query calculates the longest delivery duration (<code>long_delivery</code>), shortest delivery duration (<code>shortest_delivery</code>), and the difference between the longest and shortest durations (<code>difference</code>) from the <code>runner_orders_temp</code> table.</li>
  <li>The <code>MAX(duration)</code> function calculates the maximum value of the <code>duration</code> column from the <code>runner_orders_temp</code> table, representing the longest delivery duration.</li>
  <li>The <code>MIN(duration)</code> function calculates the minimum value of the <code>duration</code> column from the <code>runner_orders_temp</code> table, representing the shortest delivery duration.</li>
  <li>The <code>MAX(duration) - MIN(duration)</code> expression calculates the difference between the longest and shortest delivery durations.</li>
  <li>As a result, the query presents the longest delivery duration as <code>long_delivery</code>, the shortest delivery duration as <code>shortest_delivery</code>, and the difference between the two durations as <code>difference</code> from the <code>runner_orders_temp</code> table.</li>
</ul>
  
   <li><h5>What was the average speed for each runner for each delivery and do you notice any trend for these values?</h5></li>

   ```sql
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
```

  <h6>Answer:</h6>
  <img width="300" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/04d504d4-1f42-4eb8-bd17-80949a183457">
  <ul>
  <li>The SQL query starts by creating a Common Table Expression (CTE) named <code>CTE</code>.</li>
  <li>Within the CTE, it retrieves the <code>runner_id</code>, <code>customer_id</code>, <code>order_id</code>, calculates the count of pizzas ordered for each order (<code>pizza_cnt</code>), <code>distance</code> traveled by the runner, and the duration of delivery in hours (<code>hr_duration</code>) from the <code>runner_orders_temp</code> and <code>customer_orders_tempp</code> tables.</li>
  <li>It performs an inner join between the <code>runner_orders_temp</code> table and the <code>customer_orders_tempp</code> table on matching <code>order_id</code> to get the order and delivery information.</li>
  <li>The query filters the data using the <code>WHERE</code> clause, selecting only the rows where the cancellation column (<code>cancellation</code>) in the <code>runner_orders_temp</code> table is empty (i.e., no cancellation).</li>
  <li>Results are grouped by <code>runner_id</code>, <code>customer_id</code>, <code>order_id</code>, <code>distance</code>, <code>duration</code>, and <code>order_time</code> to calculate the count of pizzas ordered, distance, and the duration of delivery in hours for each order.</li>
  <li>The <code>COUNT(C.order_id)</code> function calculates the number of occurrences of each <code>order_id</code> in the <code>customer_orders_tempp</code> table, giving the count of pizzas ordered for each order.</li>
  <li>The <code>ROUND(duration::numeric / 60, 2)</code> expression calculates the delivery duration in hours for each order.</li>
  <li>The main query then retrieves the <code>runner_id</code>, <code>order_id</code>, <code>distance</code>, <code>hr_duration</code>, and the average speed of the runner for each order.</li>
  <li>The <code>ROUND(distance/hr_duration, 2)</code> expression calculates the average speed of the runner (distance per hour) for each order and rounds it to two decimal places.</li>
  <li>Results are grouped by <code>runner_id</code>, <code>order_id</code>, <code>distance</code>, and <code>hr_duration</code>.</li>
  <li>As a result, the query presents the <code>runner_id</code>, <code>order_id</code>, <code>distance</code>, <code>hr_duration</code>, and the corresponding average speed of the runner for each order from the <code>runner_orders_temp</code> and <code>customer_orders_tempp</code> tables, excluding any orders with cancellations.</li>
</ul>
  
   <li><h5>What is the successful delivery percentage for each runner?</h5></li>

   ```sql
WITH CTE AS (
	SELECT runner_id, COUNT(order_id)::numeric totl_orders
	   , COUNT(CASE WHEN cancellation = '' THEN order_id END) com_orders 
FROM runner_orders_temp
GROUP BY runner_id)


SELECT runner_id
	   , (com_orders / totl_orders * 100)::INT  AS completed
FROM CTE
GROUP BY runner_id,completed;
```

  <h6>Answer:</h6>
   <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/57d96551-c237-4231-a1d9-3bb5c577fd57">
   <ul>
  <li>The SQL query starts by creating a Common Table Expression (CTE) named <code>CTE</code>.</li>
  <li>Within the CTE, it retrieves the <code>runner_id</code> and calculates the total number of orders for each runner (<code>totl_orders</code>) and the count of completed orders (i.e., orders with no cancellation) for each runner (<code>com_orders</code>) from the <code>runner_orders_temp</code> table.</li>
  <li>Results are grouped by <code>runner_id</code> to calculate the total number of orders and completed orders for each runner.</li>
  <li>The <code>COUNT(order_id)</code> function calculates the number of occurrences of each <code>order_id</code> in the <code>runner_orders_temp</code> table, giving the total number of orders for each runner.</li>
  <li>The <code>COUNT(CASE WHEN cancellation = '' THEN order_id END)</code> expression calculates the number of completed orders (orders with no cancellation) for each runner.</li>
  <li>The main query then retrieves the <code>runner_id</code> and calculates the percentage of completed orders for each runner (<code>completed</code>).</li>
  <li>The expression <code>(com_orders / totl_orders * 100)::INT</code> calculates the percentage of completed orders as an integer value for each runner.</li>
  <li>Results are grouped by <code>runner_id</code> and <code>completed</code>.</li>
  <li>As a result, the query presents the <code>runner_id</code> and the corresponding percentage of completed orders as <code>completed</code> for each runner from the <code>runner_orders_temp</code> table.</li>
</ul>
</ol>


<h4><a name="c.ingredientoptimisation"></a>C. Ingredient Optimisation🍕</h4>

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


<h1><a name="keyinsights"></a>Key Insights</h1>
<ul>
  <li>Analyzing pizza orders and customer preferences can guide menu optimization.</li>
  <li>Identifying top-performing runners ensures efficient delivery and customer satisfaction.</li>
  <li>Understanding customer order patterns aids in targeted promotions and staffing.</li>
  <li>Ingredient optimization reduces food waste and enhances inventory management.</li>
  <li>Data cleaning ensures accurate analysis and informed decision-making.</li>
  <li>Improving the customer experience fosters loyalty and business growth.</li>
  <li>Data-driven decisions lead to better resource allocation and growth opportunities.</li>
  <li>Runner Sign-Ups: Analyzing the number of runners signing up each week helps identify trends and patterns in runner recruitment and engagement.</li>
  <li>Delivery Time Analysis: Calculating the average time it takes for runners to arrive at Pizza Runner HQ for order pickups can reveal efficiency levels and potential areas for improvement in the delivery process.</li>
  <li>Order Preparation and Pizza Count: Exploring any relationship between the number of pizzas ordered and the time it takes to prepare them can assist in optimizing kitchen operations and delivery timelines.</li>
  <li>Customer Average Distance: Understanding the average distance traveled for each customer's orders can help identify delivery patterns and optimize delivery routes.</li>
  <li>Longest and Shortest Delivery Times: Analyzing the difference between the longest and shortest delivery durations can reveal variations in delivery efficiency and potential outliers.</li>
  <li>Runner Average Speed: Calculating the average speed of each runner for each delivery provides insights into their performance and helps identify high-performing runners.</li>
  <li>Successful Delivery Percentage: Determining the successful delivery percentage for each runner allows assessing their reliability and performance in completing orders.</li>
  <li>Standard Ingredients for Each Pizza: Understanding the standard ingredients for each pizza helps identify the base recipe and essential toppings used for various pizza types.</li>
  <li>Most Commonly Added Extra: Analyzing the most commonly added extra topping provides insights into customer preferences and popular customization choices.</li>
  <li>Most Common Exclusion: Identifying the most common exclusion topping helps understand popular preferences for omitting specific ingredients.</li>
  <li>Generating Order Items: Creating formatted order items for each record in the customer_orders table allows presenting detailed information about each order, including the pizza name, excluded toppings, and extra toppings.</li>



</ul>

 

