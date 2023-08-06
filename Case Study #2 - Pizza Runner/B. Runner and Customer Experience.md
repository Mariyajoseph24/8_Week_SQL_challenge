<h2><a name="b.runnerandcustomerexperience"></a>B. Runner and Customer Experience</h2>
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
   
   <li><h5>What was the difference between the longest and shortest delivery times for all orders?</h5></li>

   ```sql
SELECT MAX(duration) AS long_delivery, MIN(duration) AS shortest_delivery
	   , MAX(duration) - MIN(duration) AS difference
FROM runner_orders_temp;
```
  <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/9c7a053f-9620-4572-b650-eacdbc00138f">
  
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
   
</ol>

