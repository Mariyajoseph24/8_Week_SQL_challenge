<h1>Case Study #6 - Clique Bait🦞🍢🦈</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/70ce587f-8e3b-40f6-bb01-4b1f8c81e77e">
<h1>Contents</h1>

<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#entityrelationshipdiagram">Entity Relationship Diagram</a></li>
  <li><a href="#casestudyquestionsandsolutions">Case Study Questions & Solutions</a></li>

<ul>
  <li><a href="#a.digitalanalysis">A. Digital Analysis</a></li>
  <li><a href="#b.productfunnelanalysis">B. Product Funnel Analysis</a></li>
  <li><a href="#c.campaignsanalysis">C. Campaigns Analysis</a></li>
</ul>
</ul>

<h1><a name="introduction">Introduction</a></h1>
<p>Meet Danny, the innovative mind behind Clique Bait, an unconventional online seafood store. With a background in digital data analytics, Danny's mission is to revolutionize the seafood industry. In this study, we analyze Clique Bait's user journey and propose creative solutions to calculate funnel fallout rates. By understanding where users drop off, we help optimize the online shopping experience, aligning with Danny's vision of merging data expertise with seafood excellence. Join us in uncovering insights that drive conversion and customer satisfaction.

*Note: The data and insights presented in this case study are for illustrative purposes only and do not reflect actual data associated with Clique Bait.*</p>

<h1><a name="entityrelationshipdiagram"></a>Entity Relationship Diagram</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/4f5a28db-79ac-4be4-9c35-909580740913">
<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>
------------------------------------------------------------------------------------------------------------------------------------------------------
<h4><a name="a.digitalanalysis"></a>A. Digital Analysis</h4>
<ol> 
  <li><h5>How many users are there?</h5></li>

  ```sql
SELECT COUNT (DISTINCT user_id) AS user_cnt
FROM users;
```
  <h6>Answer:</h6>
<img width="100" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/69aa003d-3866-4648-948a-b514576efd71">
<ul>
  <li>The SQL query retrieves the count of distinct <code>user_id</code> values from the <code>users</code> table.</li>
  <li>The <code>COUNT</code> function is used to calculate the number of distinct user IDs.</li>
  <li>The result is presented as <code>user_cnt</code> in the output.</li>
</ul>

  
  <li><h5>How many cookies does each user have on average?</h5></li>

  ```sql
SELECT ROUND(AVG(cookie_count)) AS average_cookies_per_user
FROM (
    SELECT user_id, COUNT(DISTINCT cookie_id) AS cookie_count
    FROM users
    GROUP BY user_id
) AS user_cookies;
```
   <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/0ceb8176-8975-4c23-b65e-c3b333d94077">
<ul>
  <li>The SQL query calculates the average number of cookies per user.</li>
  <li>It starts with an inner subquery that groups the data in the <code>users</code> table by <code>user_id</code>.</li>
  <li>Within the subquery, the <code>COUNT(DISTINCT cookie_id)</code> function calculates the number of distinct <code>cookie_id</code> values for each <code>user_id</code>.</li>
  <li>The result of the subquery includes the <code>user_id</code> and the corresponding count of distinct cookies.</li>
  <li>The outer query then calculates the average of the <code>cookie_count</code> column from the subquery using the <code>ROUND(AVG(cookie_count))</code> function.</li>
  <li>The average is presented as <code>average_cookies_per_user</code> in the output.</li>
</ul>


  <li><h5>What is the unique number of visits by all users per month?</h5></li>

  ```sql
SELECT EXTRACT(YEAR FROM event_time) AS year,
       EXTRACT(MONTH FROM event_time) AS month,
       COUNT(DISTINCT visit_id) AS unique_visits
FROM events
GROUP BY year, month
ORDER BY year, month;
```
   <h6>Answer:</h6>
<img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/1838845c-b4c7-4f0c-94dd-1ef62a99df66">
<ul>
  <li>The SQL query calculates the number of unique visits for each month and year from the <code>events</code> table.</li>
  <li>It uses the <code>EXTRACT</code> function to extract the <code>YEAR</code> and <code>MONTH</code> components from the <code>event_time</code> column.</li>
  <li>The <code>COUNT(DISTINCT visit_id)</code> function counts the distinct <code>visit_id</code> values for each combination of year and month.</li>
  <li>The results are grouped by the <code>year</code> and <code>month</code> columns.</li>
  <li>The <code>ORDER BY</code> clause sorts the results in ascending order based on the <code>year</code> and <code>month</code> values.</li>
  <li>The output includes columns for <code>year</code>, <code>month</code>, and <code>unique_visits</code> (the count of distinct visit IDs).</li>
</ul>


  <li><h5>What is the number of events for each event type?</h5></li>

  ```sql
SELECT event_type, COUNT(*) AS event_count
FROM events
GROUP BY event_type
ORDER BY event_type;
```
   <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/f49bf803-80ec-47fc-bb87-f3246ab17039">
<ul>
  <li>The SQL query calculates the count of events for each event type from the <code>events</code> table.</li>
  <li>It retrieves the <code>event_type</code> column values.</li>
  <li>The <code>COUNT(*)</code> function counts the occurrences of each event type.</li>
  <li>The results are grouped by the <code>event_type</code> column.</li>
  <li>The <code>ORDER BY</code> clause sorts the results in ascending order based on the <code>event_type</code>.</li>
  <li>The output includes columns for <code>event_type</code> and <code>event_count</code> (the count of events for each type).</li>
</ul>


  <li><h5>What is the percentage of visits which have a purchase event?</h5></li>

  ```sql
SELECT (COUNT(DISTINCT CASE WHEN event_type = 3 THEN visit_id END) * 100.0 / COUNT(DISTINCT visit_id)) AS purchase_percentage
FROM events;
```
   <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/f87f3815-7fd2-4cf5-b107-a02bd785f3a8">
<ul>
  <li>The SQL query calculates the percentage of visits where the event type is equal to 3, indicating a purchase event.</li>
  <li>The <code>COUNT(DISTINCT CASE WHEN event_type = 3 THEN visit_id END)</code> counts the number of unique <code>visit_id</code>s where the <code>event_type</code> is 3 (purchase event).</li>
  <li>The <code>COUNT(DISTINCT visit_id)</code> counts the total number of unique <code>visit_id</code>s in the <code>events</code> table.</li>
  <li>The calculation <code>(purchase_count * 100.0 / total_visits)</code> computes the percentage of purchase events among all visits.</li>
  <li>The output is a single column named <code>purchase_percentage</code> which represents the calculated percentage.</li>
</ul>


  <li><h5>What is the percentage of visits which view the checkout page but do not have a purchase event?</h5></li>

  ```sql
WITH CTE AS (
    SELECT 
        visit_id,
        MAX(CASE WHEN event_type = 1 AND page_id = 12 THEN 1 ELSE 0 END) AS checkout_viewed,
        MAX(CASE WHEN event_type = 3 THEN 1 ELSE 0 END) AS purchase_made
    FROM events
    GROUP BY visit_id
)

SELECT 
    ROUND(100 * (1 - (SUM(purchase_made)::numeric / SUM(checkout_viewed))), 2) AS percentagewithout_purchase
FROM CTE;
```
   <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/99ede866-1163-4874-954f-0f0094117b77">
<ul>
  <li>The SQL query uses a Common Table Expression (CTE) named <code>CTE</code> to calculate specific event indicators for each <code>visit_id</code>.</li>
  <li>The CTE calculates two indicators for each visit: <code>checkout_viewed</code> and <code>purchase_made</code>.</li>
  <li>The <code>checkout_viewed</code> indicator is calculated using the <code>MAX</code> function along with a <code>CASE</code> statement to identify visits where <code>event_type</code> is 1 (page view) and <code>page_id</code> is 12 (indicating a checkout page view).</li>
  <li>The <code>purchase_made</code> indicator is calculated similarly for visits where <code>event_type</code> is 3 (purchase event).</li>
  <li>The <code>GROUP BY visit_id</code> groups the results by <code>visit_id</code>.</li>
  <li>The main query calculates the percentage of visits without a purchase by subtracting the sum of <code>purchase_made</code> from the sum of <code>checkout_viewed</code>.</li>
  <li>The expression <code>(1 - (SUM(purchase_made) / SUM(checkout_viewed)))</code> calculates the ratio of visits without a purchase.</li>
  <li>The query then multiplies the ratio by 100, rounds the result to two decimal places using the <code>ROUND</code> function, and presents it as <code>percentagewithout_purchase</code>.</li>
</ul>


  <li><h5>What are the top 3 pages by number of views?</h5></li>

  ```sql
SELECT page_id, COUNT(*) AS page_views
FROM events
WHERE event_type = 1
GROUP BY page_id
ORDER BY page_views DESC
LIMIT 3;
```
   <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/bbe58a56-0884-4cb7-ab8b-44d70ce27fd7">
<ul>
  <li>The SQL query retrieves page views by counting the occurrences of each <code>page_id</code> with <code>event_type</code> equal to 1 (indicating a page view).</li>
  <li>The <code>WHERE event_type = 1</code> clause filters the results to include only events of type 1 (page view).</li>
  <li>The <code>GROUP BY page_id</code> groups the results by unique <code>page_id</code>.</li>
  <li>The <code>ORDER BY page_views DESC</code> clause sorts the results in descending order based on the count of page views.</li>
  <li>The <code>LIMIT 3</code> limits the output to the top 3 <code>page_id</code> entries with the highest page views.</li>
</ul>


  <li><h5>What is the number of views and cart adds for each product category?</h5></li>

  ```sql
SELECT ph.product_category,
       SUM(CASE WHEN e.event_type = 1 THEN 1 ELSE 0 END) AS num_views,
       SUM(CASE WHEN e.event_type = 2 THEN 1 ELSE 0 END) AS num_cart_adds
FROM page_hierarchy ph
LEFT JOIN events e ON ph.page_id = e.page_id
GROUP BY ph.product_category
ORDER BY ph.product_category;
```
   <h6>Answer:</h6>
<img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/9685c222-fcc6-4d6d-bf49-5ae12d642df6">
<ul>
  <li>The SQL query retrieves statistics for product categories from the <code>page_hierarchy</code> and <code>events</code> tables.</li>
  <li>The <code>LEFT JOIN</code> operation combines data from the <code>page_hierarchy</code> and <code>events</code> tables using the common <code>page_id</code> column.</li>
  <li>The <code>SUM(CASE WHEN e.event_type = 1 THEN 1 ELSE 0 END)</code> expression calculates the total number of page views (event_type = 1) for each product category.</li>
  <li>The <code>SUM(CASE WHEN e.event_type = 2 THEN 1 ELSE 0 END)</code> expression calculates the total number of cart additions (event_type = 2) for each product category.</li>
  <li>The <code>GROUP BY ph.product_category</code> clause groups the results by unique product categories from the <code>page_hierarchy</code> table.</li>
  <li>The <code>ORDER BY ph.product_category</code> clause sorts the results in ascending order based on the product category.</li>
</ul>


  <li><h5>What are the top 3 products by purchases?</h5></li>
  
  ```sql
  SELECT ph.page_name AS product_name, 
       SUM(CASE WHEN e.event_type = 3 THEN 1 ELSE 0 END) AS num_purchases
FROM page_hierarchy ph
LEFT JOIN events e ON ph.page_id = e.page_id
WHERE ph.page_name IS NOT NULL
GROUP BY ph.page_name
ORDER BY num_purchases DESC
LIMIT 3;
```
<ul>
  <li>The SQL query retrieves statistics for product purchases from the <code>page_hierarchy</code> and <code>events</code> tables.</li>
  <li>The <code>LEFT JOIN</code> operation combines data from the <code>page_hierarchy</code> and <code>events</code> tables using the common <code>page_id</code> column.</li>
  <li>The <code>WHERE ph.page_name IS NOT NULL</code> clause filters out rows where the <code>page_name</code> in the <code>page_hierarchy</code> table is not null.</li>
  <li>The <code>SUM(CASE WHEN e.event_type = 3 THEN 1 ELSE 0 END)</code> expression calculates the total number of purchases (event_type = 3) for each product name.</li>
  <li>The <code>GROUP BY ph.page_name</code> clause groups the results by unique product names from the <code>page_hierarchy</code> table.</li>
  <li>The <code>ORDER BY num_purchases DESC</code> clause sorts the results in descending order based on the number of purchases.</li>
  <li>The <code>LIMIT 3</code> clause limits the output to the top 3 products with the highest number of purchases.</li>
</ul>
</ol>
----------------------------------------------------------------------------------------------------------------------------------------------------
<h4><a name="b.productfunnelanalysis"></a>B. Product Funnel Analysis</h4>
<ol>
  <p></ul>Using a single SQL query - create a new output table which has the following details:<br>
<ul>
<li>How many times was each product viewed?</li>
<li>How many times was each product added to cart?</li>
<li>How many times was each product added to a cart but not purchased (abandoned)?</li>
<li>How many times was each product purchased?</li></ul><br>
Additionally, create another table which further aggregates the data for the above points but this time for each product category instead of individual products.<br>

Use your 2 new output tables - answer the following questions:<br></p>
  <li><h5>Which product had the most views, cart adds and purchases?</h5></li>
  <li><h5>Which product was most likely to be abandoned?</h5></li>
  <li><h5></h5>Which product had the highest view to purchase percentage?</li>
  <li><h5>What is the average conversion rate from view to cart add?</h5></li>
  <li><h5>What is the average conversion rate from cart add to purchase?</h5></li>
   




