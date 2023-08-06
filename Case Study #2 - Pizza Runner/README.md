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
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/2ba5364c-d9b5-48f1-bb31-b010a28ad9b6">
<li><h5>customer_orders table After AS customer_order_tempp</h5></li>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/2d344d6f-695f-4128-befe-09d692b7a115">
<li><h5>runner_orders table Before</h5></li>
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
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/086a9085-3f8b-4f49-8ef0-101e198f91eb">
<li><h5>runner_orders table After AS runner_orders_temp</h5></li>
<img width="500" alt="Coding" src='https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/16580860-979b-450c-9cd4-c726659995a5'>
</ul>


<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>
<h4><a name="a.pizzametrics"></a>A. Pizza Metrics</h4>

<ol> 
  <li><h5>How many pizzas were ordered?</h5></li>
 
```sql
SELECT COUNT(order_id) AS pizza_orders
FROM customer_orders_tempp

```

<h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/7f304383-b85d-4cb9-80ac-863f641647a3">


   <li><h5>How many unique customer orders were made?</h5></li>
   
```sql
SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM customer_orders_tempp
```

   <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/015a6c20-99d0-4342-967f-ef3f4c12a69d">


   <li><h5>How many successful orders were delivered by each runner?</h5></li>

   ```sql
SELECT runner_id,COUNT(order_id)AS orders_delivered
FROM runner_orders_temp
WHERE cancellation=''
GROUP BY runner_id
```

  <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/315359f2-94ff-4db7-af2f-a1043259178f">

   <li><h5>How many of each type of pizza was delivered?</h5></li>

  ```sql
SELECT runner_id,COUNT(order_id)AS orders_delivered
FROM runner_orders_temp
WHERE cancellation=''
GROUP BY runner_id
```

  <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/9278e4ca-3b7c-4bf4-807a-3ea93e21bd90">

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

   <li><h5>How many pizzas were delivered that had both exclusions and extras?</h5></li>

   ```sql
SELECT SUM(CASE WHEN C.exclusions!='' AND C.extras!='' THEN 1 ELSE 0 END) AS pizza_with_exclusions_extras
FROM customer_orders_tempp C
JOIN runner_orders_temp R ON C.order_id=R.order_id
WHERE R.cancellation=''
```

   <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/d2596131-2fdd-444b-9f52-aa17bf8b4e0b">

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

   <li><h5>What was the volume of orders for each day of the week?</h5></li>

   ```sql
SELECT to_char(order_time, 'DAY')AS day, COUNT(order_id) AS ordered_pizza
FROM customer_orders_tempp
GROUP BY 1
```

   <h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/55255c08-49f8-4b59-bd18-62c37c99fcf7">

</ol>


<h4><a name="b.runnerandcustomerexperience"></a>B. Runner And Customer Experience</h4>
<h4><a name="c.ingredientoptimisation"></a>C. Ingredient Optimisation</h4>

<h1><a name="keyinsights"></a>Key Insights</h1>
 

