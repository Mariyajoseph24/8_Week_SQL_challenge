<h1>Case Study #3 - Foodie-Fi🫕🥑</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/abd6c8a0-371d-4c17-8e36-4a22fd894c20">
<h1>Contents</h1>

<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#entityrelationshipdiagram">Entity Relationship Diagram</a></li>
  <li><a href="#casestudyquestionsandsolutions">Case Study Questions & Solutions</a></li>

<ul>
  <li><a href="#a.customerjourney">A. Customer Journey</a></li>
  <li><a href="#b.dataanalysisquestions">B. Data Analysis Questions</a></li>
  <li><a href="#c.challengepaymentquestion">C. Challenge Payment Question</a></li>
  </ul>
  
  
</ul>

<h1><a name="introduction">Introduction</a></h1>
<p>In response to the growing popularity of subscription-based businesses, Danny recognized a significant market gap. He saw an opportunity to introduce a distinctive streaming service, one that exclusively featured culinary content—a culinary counterpart to platforms like Netflix. With this vision in mind, Danny collaborated with a group of astute friends to establish Foodie-Fi, a startup launched in 2020. The company quickly began offering monthly and annual subscription plans, granting subscribers unrestricted access to an array of exclusive culinary videos sourced from across the globe.<br>

At the heart of Foodie-Fi's foundation lies Danny's commitment to data-driven decision-making. He was resolute in leveraging data to inform all future investments and innovative features. This case study delves into the realm of subscription-style digital data, where insights derived from data analysis are pivotal in addressing critical business inquiries and steering the company toward sustained growth and success.</p>

<h1><a name="entityrelationshipdiagram"></a>Entity Relationship Diagram</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/82dd908e-38b9-4d7f-a17e-743bc745469d">

<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>

<h4><a name="a.customerjourney"></a>A. Customer Journey🫕🥑</h4>

<ol> 
  <li><h5>Based off the 8 sample customers provided in the sample from the subscriptions table, write a brief description about each customer’s onboarding journey.</h5></li>

  ```sql
SELECT
    s.customer_id,
    p.plan_name,
    s.start_date
FROM
    subscriptions s
JOIN
    plans p ON s.plan_id = p.plan_id
ORDER BY
    s.customer_id, s.start_date;
```

<h6>Answer:</h6>
<img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/eb8df25b-8606-4bea-9008-e67b15c27a77">
</ol>

<ol>
  <li>
    <strong>Customer 1:</strong>
    <ul>
      <li>Started with a trial plan on 2020-08-01.</li>
      <li>Upgraded to the basic monthly plan on 2020-08-08.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 2:</strong>
    <ul>
      <li>Started with a trial plan on 2020-09-20.</li>
      <li>Upgraded to the pro annual plan on 2020-09-27.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 11:</strong>
    <ul>
      <li>Started with a trial plan on 2020-11-19.</li>
      <li>Downgraded to the churn plan on 2020-11-26.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 13:</strong>
    <ul>
      <li>Started with a trial plan on 2020-12-15.</li>
      <li>Upgraded to the basic monthly plan on 2020-12-22.</li>
      <li>Upgraded to the pro monthly plan on 2021-03-29.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 15:</strong>
    <ul>
      <li>Started with a trial plan on 2020-03-17.</li>
      <li>Upgraded to the pro monthly plan on 2020-03-24.</li>
      <li>Downgraded to the churn plan on 2020-04-29.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 16:</strong>
    <ul>
      <li>Started with a trial plan on 2020-05-31.</li>
      <li>Upgraded to the basic monthly plan on 2020-06-07.</li>
      <li>Upgraded to the pro annual plan on 2020-10-21.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 18:</strong>
    <ul>
      <li>Started with a trial plan on 2020-07-06.</li>
      <li>Upgraded to the pro monthly plan on 2020-07-13.</li>
    </ul>
  </li>
  <li>
    <strong>Customer 19:</strong>
    <ul>
      <li>Started with a trial plan on 2020-06-22.</li>
      <li>Upgraded to the pro monthly plan on 2020-06-29.</li>
      <li>Upgraded to the pro annual plan on 2020-08-29.</li>
    </ul>
  </li>
</ol>
</ol>

<h4><a name="b.dataanalysisquestions"></a>B. Data Analysis Questions📊</h4>
<ol>
  <li><h5>How many customers has Foodie-Fi ever had?</h5></li>

  ```sql
SELECT COUNT(DISTINCT customer_id) AS customer_count
FROM subscriptions
```
   <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/c5d03554-ff58-44c0-96cf-dd13ed9483b4">
  <ul>
  <li>The SQL query retrieves the count of distinct <code>customer_id</code> values from the <code>subscriptions</code> table.</li>
  <li>The <code>COUNT(DISTINCT customer_id)</code> function calculates the number of unique <code>customer_id</code> values in the <code>subscriptions</code> table.</li>
  <li>As a result, the query presents the total number of unique customers who have subscriptions in the <code>subscriptions</code> table.</li>
</ul>

  
  <li><h5>What is the monthly distribution of trial plan start_date values for our dataset - use the start of the month as the group by value</h5></li>

  ```sql
SELECT
    DATE_TRUNC('month', start_date) AS month_start,
    COUNT(*) AS trial_starts
FROM
    subscriptions
WHERE
    plan_id = 0
GROUP BY
    month_start
ORDER BY
    month_start;
```
  <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/8d1a6bef-80c1-4392-9b8f-5ee08b249a10">
  <ul>
  <li>The SQL query retrieves data related to trial subscriptions from the <code>subscriptions</code> table.</li>
  <li>The <code>DATE_TRUNC</code> function is used to truncate the <code>start_date</code> column to the start of each month, resulting in the <code>month_start</code> column.</li>
  <li>The <code>COUNT(*)</code> function calculates the number of records (trial starts) in the <code>subscriptions</code> table for each truncated month.</li>
  <li>The <code>WHERE plan_id = 0</code> condition filters the data to include only trial subscriptions, where the <code>plan_id</code> is 0.</li>
  <li>Results are grouped by the <code>month_start</code> column, which represents the start of each month after truncation.</li>
  <li>The <code>ORDER BY month_start</code> clause arranges the results in ascending order based on the <code>month_start</code> column.</li>
  <li>As a result, the query presents the truncated start of each month and the corresponding count of trial subscription starts for that month from the <code>subscriptions</code> table.</li>
</ul>

  
  <li><h5>What plan start_date values occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name</h5></li>

  ```sql
SELECT
    p.plan_name,
	p.plan_id,
    COUNT(*) AS event_count
FROM
    subscriptions s
JOIN
    plans p ON s.plan_id = p.plan_id
WHERE
    s.start_date > '2020-12-31' -- Filter for start dates after 2020
GROUP BY
    p.plan_name, p.plan_id
ORDER BY
    p.plan_name, p.plan_id;
```
  <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/ba0305f6-a4c7-4100-8cb0-0b96cf5f58f1">
  <ul>
  <li>The SQL query retrieves data related to subscription events from the <code>subscriptions</code> table and their corresponding plan details from the <code>plans</code> table.</li>
  <li>The <code>SELECT</code> statement selects the <code>plan_name</code>, <code>plan_id</code>, and the count of records (subscription events) as <code>event_count</code> from the <code>subscriptions</code> table.</li>
  <li>The <code>JOIN</code> clause connects the <code>subscriptions</code> table with the <code>plans</code> table using the common <code>plan_id</code> column.</li>
  <li>The <code>WHERE s.start_date > '2020-12-31'</code> condition filters the data to include only records with start dates after December 31, 2020.</li>
  <li>Results are grouped by the <code>plan_name</code> and <code>plan_id</code> columns from the <code>plans</code> table.</li>
  <li>The <code>ORDER BY p.plan_name, p.plan_id</code> clause arranges the results in ascending order based on the <code>plan_name</code> and <code>plan_id</code> columns.</li>
  <li>As a result, the query presents the plan name, plan ID, and the corresponding count of subscription events for each plan that started after December 31, 2020, using data from the <code>subscriptions</code> and <code>plans</code> tables.</li>
</ul>

  
  <li><h5>What is the customer count and percentage of customers who have churned rounded to 1 decimal place?</h5></li>

  ```sql
SELECT
    COUNT(DISTINCT CASE WHEN s.plan_id = 4 AND s.start_date <= CURRENT_DATE THEN s.customer_id END) AS churned_customers,
    ROUND(COUNT(DISTINCT CASE WHEN s.plan_id = 4 AND s.start_date <= CURRENT_DATE THEN s.customer_id END) * 100.0 / COUNT(DISTINCT s.customer_id), 1) AS churned_percentage
FROM
    subscriptions s;
```
  <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/e3e6ab3e-bfe8-43b2-aa0f-157f29b32a1c">
  <ul>
  <li>The SQL query calculates the count and percentage of churned customers based on certain conditions from the <code>subscriptions</code> table.</li>
  <li>The first <code>COUNT(DISTINCT CASE WHEN ... END)</code> expression calculates the count of distinct customer IDs who have a plan ID of 4 and started their subscription on or before the current date. This count represents the churned customers.</li>
  <li>The second <code>ROUND(...)</code> expression calculates the churned percentage by dividing the count of churned customers by the count of distinct customer IDs and then multiplying by 100.0. The <code>ROUND</code> function rounds the result to one decimal place.</li>
  <li>The <code>FROM subscriptions s</code> clause specifies that the data is being retrieved from the <code>subscriptions</code> table with the alias <code>s</code>.</li>
  <li>As a result, the query presents the count of churned customers (those with plan ID 4 and a start date on or before the current date) and the corresponding percentage of churned customers in relation to all distinct customers from the <code>subscriptions</code> table.</li>
</ul>

  
  <li><h5>How many customers have churned straight after their initial free trial - what percentage is this rounded to the nearest whole number?</h5></li>

  ```sql
WITH ranked_cte AS (
  SELECT 
    sub.customer_id,  
    plans.plan_name, 
	  LEAD(plans.plan_name) OVER ( 
      PARTITION BY sub.customer_id
      ORDER BY sub.start_date) AS next_plan
  FROM subscriptions AS sub
  JOIN plans 
    ON sub.plan_id = plans.plan_id
)
  
SELECT 
  COUNT(customer_id) AS customers,
  ROUND(100.0 * 
    COUNT(customer_id) 
    / (SELECT COUNT(DISTINCT customer_id) 
      FROM subscriptions)
  ) AS churn_percentage
FROM ranked_cte
WHERE plan_name = 'trial' 
  AND next_plan = 'churn';

```
  <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/80d4fcdc-7aff-4c12-8b8b-8c8c7154d204">
  <ul>
  <li>The SQL query calculates the count and percentage of customers who have churned from a trial plan to a churn plan, based on data from the <code>subscriptions</code> and <code>plans</code> tables.</li>
  <li>The <code>ranked_cte</code> Common Table Expression (CTE) is defined to retrieve customer IDs, current plan names, and the next plan names using the <code>LEAD</code> window function.</li>
  <li>Within the <code>ranked_cte</code> CTE, the <code>LEAD(plans.plan_name) OVER (PARTITION BY sub.customer_id ORDER BY sub.start_date)</code> function retrieves the name of the next plan for each customer, ordered by their subscription start date.</li>
  <li>The main query selects the count of customer IDs who transitioned from a 'trial' plan to a 'churn' plan and calculates the churn percentage.</li>
  <li>The <code>COUNT(customer_id)</code> function counts the number of customers who transitioned from a 'trial' plan to a 'churn' plan.</li>
  <li>The <code>ROUND(...)</code> function calculates the churn percentage by dividing the count of customers who transitioned by the total count of distinct customer IDs from the <code>subscriptions</code> table, multiplied by 100.0. The result is rounded to the nearest whole number.</li>
  <li>The subquery <code>(SELECT COUNT(DISTINCT customer_id) FROM subscriptions)</code> calculates the total count of distinct customer IDs in the <code>subscriptions</code> table.</li>
  <li>The <code>WHERE plan_name = 'trial' AND next_plan = 'churn'</code> condition filters the data to include only cases where customers transitioned from a 'trial' plan to a 'churn' plan.</li>
  <li>As a result, the query presents the count and percentage of customers who have transitioned from a 'trial' plan to a 'churn' plan using data from the <code>subscriptions</code> and <code>plans</code> tables.</li>
</ul>

  
  <li><h5>What is the number and percentage of customer plans after their initial free trial?</h5></li>

  ```sql
WITH next_plans AS (
  SELECT 
    customer_id, 
    plan_id, 
    LEAD(plan_id) OVER(
      PARTITION BY customer_id 
      ORDER BY plan_id) as next_plan_id
  FROM subscriptions
)

SELECT 
  next_plan_id AS plan_id, 
  COUNT(customer_id) AS after_free_customers,
  ROUND(100 * 
    COUNT(customer_id)::NUMERIC 
    / (SELECT COUNT(DISTINCT customer_id) 
      FROM subscriptions)
  ,1) AS after_percentage
FROM next_plans
WHERE next_plan_id IS NOT NULL 
  AND plan_id = 0
GROUP BY next_plan_id
ORDER BY next_plan_id;
```
  <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/658fc25d-ce6e-4617-b16a-2f59e7d254ac">
  <ul>
  <li>The SQL query calculates the count and percentage of customers who transitioned from a free trial plan to a subsequent plan, based on data from the <code>subscriptions</code> table.</li>
  <li>The <code>next_plans</code> Common Table Expression (CTE) is defined to retrieve customer IDs, current plan IDs, and the next plan IDs using the <code>LEAD</code> window function.</li>
  <li>Within the <code>next_plans</code> CTE, the <code>LEAD(plan_id) OVER (PARTITION BY customer_id ORDER BY plan_id)</code> function retrieves the ID of the next plan for each customer, ordered by plan ID.</li>
  <li>The main query selects the next plan ID, counts the number of customers who transitioned to that plan, and calculates the percentage of customers who transitioned.</li>
  <li>The <code>COUNT(customer_id)</code> function counts the number of customers who transitioned to each next plan.</li>
  <li>The <code>ROUND(...)</code> function calculates the percentage of customers who transitioned to each next plan by dividing the count of transitioning customers by the total count of distinct customer IDs from the <code>subscriptions</code> table, multiplied by 100.0. The result is rounded to one decimal place.</li>
  <li>The subquery <code>(SELECT COUNT(DISTINCT customer_id) FROM subscriptions)</code> calculates the total count of distinct customer IDs in the <code>subscriptions</code> table.</li>
  <li>The <code>WHERE next_plan_id IS NOT NULL AND plan_id = 0</code> condition filters the data to include only cases where customers transitioned from a free trial plan to a subsequent plan.</li>
  <li>Results are grouped by the <code>next_plan_id</code> and ordered by <code>next_plan_id</code>.</li>
  <li>As a result, the query presents the next plan ID, count of customers who transitioned to each next plan, and the corresponding percentage of customers who transitioned from a free trial plan to that next plan.</li>
</ul>

  
  <li><h5>What is the customer count and percentage breakdown of all 5 plan_name values at 2020-12-31?</h5></li>

  ```sql
SELECT
    p.plan_name,
    COUNT(DISTINCT s.customer_id) AS customer_count,
    ROUND(100.0 * COUNT(DISTINCT s.customer_id) / (SELECT COUNT(DISTINCT customer_id) FROM subscriptions WHERE start_date <= '2020-12-31'), 1) AS percentage
FROM
    subscriptions s
JOIN
    plans p ON s.plan_id = p.plan_id
WHERE
    s.start_date <= '2020-12-31'
GROUP BY
    p.plan_name,p.plan_id
ORDER BY
    p.plan_id;
````
  <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/a7865e1f-d503-42d7-b27f-8795fbee0a4f">
  <ul>
  <li>The SQL query calculates the count and percentage of customers for each plan who subscribed on or before December 31, 2020, based on data from the <code>subscriptions</code> and <code>plans</code> tables.</li>
  <li>The <code>SELECT</code> statement selects the <code>plan_name</code>, count of distinct customer IDs, and the corresponding percentage of customers for each plan.</li>
  <li>The <code>COUNT(DISTINCT s.customer_id)</code> function calculates the count of distinct customer IDs who subscribed on or before December 31, 2020, for each plan.</li>
  <li>The second <code>ROUND(...)</code> expression calculates the percentage of customers for each plan by dividing the count of distinct customer IDs by the total count of distinct customer IDs who subscribed on or before December 31, 2020, multiplied by 100.0. The result is rounded to one decimal place.</li>
  <li>The subquery <code>(SELECT COUNT(DISTINCT customer_id) FROM subscriptions WHERE start_date <= '2020-12-31')</code> calculates the total count of distinct customer IDs who subscribed on or before December 31, 2020.</li>
  <li>The <code>FROM subscriptions s</code> clause specifies that the data is being retrieved from the <code>subscriptions</code> table with the alias <code>s</code>.</li>
  <li>The <code>JOIN plans p ON s.plan_id = p.plan_id</code> clause connects the <code>subscriptions</code> table with the <code>plans</code> table using the common <code>plan_id</code> column.</li>
  <li>The <code>WHERE s.start_date <= '2020-12-31'</code> condition filters the data to include only records with subscription start dates on or before December 31, 2020.</li>
  <li>Results are grouped by the <code>plan_name</code> and <code>plan_id</code> columns from the <code>plans</code> table.</li>
  <li>The <code>ORDER BY p.plan_id</code> clause arranges the results in ascending order based on the <code>plan_id</code>.</li>
  <li>As a result, the query presents the plan name, count of distinct customers, and corresponding percentage of customers for each plan who subscribed on or before December 31, 2020.</li>
</ul>

  
  <li><h5>How many customers have upgraded to an annual plan in 2020?</h5></li>

  ```sql
SELECT
    COUNT(DISTINCT customer_id) AS upgraded_customers_count
FROM
    subscriptions
WHERE
    start_date >= '2020-01-01'
    AND start_date <= '2020-12-31'
    AND plan_id = 3; -- Plan ID 3 represents the annual pro plan
```
  <h6>Answer:</h6>
  <img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/9941e762-8415-4b50-b9db-012650cba5d1">
  <ul>
  <li>The SQL query calculates the count of distinct customers who upgraded to the annual pro plan (Plan ID 3) during the year 2020.</li>
  <li>The <code>COUNT(DISTINCT customer_id)</code> function calculates the count of distinct customer IDs who meet the specified conditions.</li>
  <li>The <code>FROM subscriptions</code> clause specifies that the data is being retrieved from the <code>subscriptions</code> table.</li>
  <li>The <code>WHERE start_date >= '2020-01-01' AND start_date <= '2020-12-31' AND plan_id = 3</code> condition filters the data to include only records with start dates within the year 2020 and a plan ID equal to 3 (representing the annual pro plan).</li>
  <li>As a result, the query presents the count of distinct customers who upgraded to the annual pro plan (Plan ID 3) during the year 2020.</li>
</ul>

  
  <li><h5>How many customers downgraded from a pro monthly to a basic monthly plan in 2020?</h5></li>

  ```sql
SELECT COUNT(*) AS num_downgrades
FROM subscriptions prev
JOIN subscriptions current ON prev.customer_id = current.customer_id
                          AND prev.plan_id = 2 -- Plan ID 2 represents pro monthly plan
                          AND current.plan_id = 1 -- Plan ID 1 represents basic monthly plan
                          AND prev.start_date <= current.start_date
WHERE EXTRACT(YEAR FROM prev.start_date) = 2020;
```
  <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/8e50e760-b694-4a90-832a-1338e13e2115">
  <ul>
  <li>The SQL query calculates the count of downgrades from the pro monthly plan (Plan ID 2) to the basic monthly plan (Plan ID 1) during the year 2020, based on data from the <code>subscriptions</code> table.</li>
  <li>The <code>COUNT(*)</code> function calculates the count of records that meet the specified conditions.</li>
  <li>The query performs a self-join on the <code>subscriptions</code> table, where the <code>prev</code> table represents the previous subscription and the <code>current</code> table represents the current subscription.</li>
  <li>The <code>ON prev.customer_id = current.customer_id AND prev.plan_id = 2 AND current.plan_id = 1 AND prev.start_date <= current.start_date</code> condition ensures that the join is made between a pro monthly plan (Plan ID 2) and a basic monthly plan (Plan ID 1) for the same customer with a valid start date sequence.</li>
  <li>The <code>WHERE EXTRACT(YEAR FROM prev.start_date) = 2020</code> condition filters the data to include only records with a start date in the year 2020.</li>
  <li>As a result, the query presents the count of downgrades from the pro monthly plan (Plan ID 2) to the basic monthly plan (Plan ID 1) during the year 2020 based on the specified conditions from the <code>subscriptions</code> table.</li>
</ul>
  </ol>

<h4><a name="c.challengepaymentquestion"></a>C. Challenge Payment Question💰</h4>
<ol>
  <li><h5>The Foodie-Fi team wants you to create a new payments table for the year 2020 that includes amounts paid by each customer in the subscriptions table with the following requirements:
<ul>
<li>monthly payments always occur on the same day of month as the original start_date of any monthly paid plan</li>
<li>upgrades from basic to monthly or pro plans are reduced by the current paid amount in that month and start immediately</li>
<li>upgrades from pro monthly to pro annual are paid at the end of the current billing period and also starts at the end of the month period</li>
<li>once a customer churns they will no longer make payments</li></ul></h5></li>

```sql
WITH all_plans AS (
  SELECT 
    s.customer_id,
    s.plan_id,
    p.plan_name,
    s.start_date AS plan_start_date,
    p.price,
    CASE 
      WHEN p.plan_name LIKE 'pro monthly%' THEN 
        DATE_TRUNC('month', s.start_date)::DATE
      ELSE 
        CASE 
          WHEN EXTRACT(MONTH FROM s.start_date) = 12 THEN s.start_date
          ELSE DATE_TRUNC('month', s.start_date + INTERVAL '1 month')::DATE
        END
    END AS payment_date
  FROM subscriptions s
  JOIN plans p ON s.plan_id = p.plan_id
  WHERE s.start_date >= '2020-01-01' AND s.start_date <= '2020-12-31'
)
, payments AS (
  SELECT 
    customer_id,
    plan_id,
    plan_name,
    payment_date,
    price AS amount,
    ROW_NUMBER() OVER (PARTITION BY customer_id, plan_id, plan_name, payment_date ORDER BY plan_start_date) AS payment_order
  FROM all_plans
)
-- Finalize the query
SELECT 
  customer_id,
  plan_id,
  plan_name,
  payment_date,
  amount,
  payment_order
FROM payments
WHERE payment_order = 1 OR (amount > 0 AND payment_order > 1)
ORDER BY customer_id, plan_id, payment_date, payment_order
LIMIT 20;
```
<h6>Answer:</h6>
  <img width="400" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/52ddd595-12c8-4bad-8a00-e3ef1e448a79">
  <ul>
  <li>The SQL query calculates customer payments for various subscription plans during the year 2020 based on data from the <code>subscriptions</code> and <code>plans</code> tables.</li>
  <li>The <code>all_plans</code> Common Table Expression (CTE) is defined to retrieve customer details, plan details, start dates, prices, and payment dates based on subscription data.</li>
  <li>Within the <code>all_plans</code> CTE, a conditional expression calculates the payment date based on the plan type (monthly or annual) and ensures that payments for annual plans are made in December.</li>
  <li>The <code>payments</code> CTE is defined to calculate individual payment records based on customer, plan, and payment date.</li>
  <li>Within the <code>payments</code> CTE, the <code>ROW_NUMBER()</code> function assigns a payment order to each record within the same customer, plan, plan name, and payment date partition.</li>
  <li>The main query selects the finalized customer payment details, including customer ID, plan ID, plan name, payment date, amount, and payment order.</li>
  <li>The <code>WHERE payment_order = 1 OR (amount > 0 AND payment_order > 1)</code> condition filters the data to include the first payment for each partition and subsequent payments with a positive amount.</li>
  <li>The query <code>ORDER BY customer_id, plan_id, payment_date, payment_order</code> arranges the results in ascending order based on customer ID, plan ID, payment date, and payment order.</li>
  <li>The <code>LIMIT 20</code> clause limits the results to the first 20 records.</li>
  <li>As a result, the query presents the customer payments for various subscription plans during the year 2020, including the customer ID, plan ID, plan name, payment date, amount, and payment order.</li>
</ul>
</ol>

  

