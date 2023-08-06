<h2><a name="b.runnerandcustomerexperience"></a>B. Runner and Customer Experience💁‍♂️🍕</h2>
<h5>Solutions:</h5>

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

