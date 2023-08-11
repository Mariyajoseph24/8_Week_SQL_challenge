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

<h4><a name="b.productfunnelanalysis"></a>B. Product Funnel Analysis</h4>
<ol>
  <p></ul>Using a single SQL query - create a new output table which has the following details:<br>
<ul>
<li>How many times was each product viewed?</li>
<li>How many times was each product added to cart?</li>
<li>How many times was each product added to a cart but not purchased (abandoned)?</li>
<li>How many times was each product purchased?</li></ul><br>

```sql
WITH ProdView AS (
    SELECT 
        e.visit_id,
        ph.product_id,
        ph.page_name AS product_name,
        ph.product_category,
        COUNT(CASE WHEN e.event_type = 1 THEN 1 ELSE NULL END) AS views
    FROM events AS e
    JOIN page_hierarchy AS ph ON e.page_id = ph.page_id
    WHERE product_id IS NOT NULL
    GROUP BY e.visit_id, ph.product_id, ph.page_name, ph.product_category
),
ProdCart AS (
    SELECT 
        e.visit_id,
        ph.product_id,
        COUNT(CASE WHEN e.event_type = 2 THEN 1 ELSE NULL END) AS cart_adds
    FROM events AS e
    JOIN page_hierarchy AS ph ON e.page_id = ph.page_id
    WHERE product_id IS NOT NULL
    GROUP BY e.visit_id, ph.product_id
),
PurchaseEvents AS (
    SELECT DISTINCT visit_id
    FROM events
    WHERE event_type = 3
),
ProductStats AS (
    SELECT 
        pvc.visit_id, 
        pvc.product_id, 
        pvc.product_name, 
        pvc.product_category, 
        pvc.views, 
        pcc.cart_adds,
        CASE WHEN pe.visit_id IS NOT NULL THEN 1 ELSE 0 END AS purchases
    FROM ProdView AS pvc
    JOIN ProdCart AS pcc ON pvc.visit_id = pcc.visit_id AND pvc.product_id = pcc.product_id
    LEFT JOIN PurchaseEvents AS pe ON pvc.visit_id = pe.visit_id
)
SELECT 
    product_name, 
    product_category, 
    SUM(views) AS total_views,
    SUM(cart_adds) AS total_cart_adds, 
    SUM(CASE WHEN cart_adds > 0 AND purchases = 0 THEN 1 ELSE 0 END) AS abandoned,
    SUM(CASE WHEN cart_adds = 1 AND purchases = 1 THEN 1 ELSE 0 END) AS purchases
FROM ProductStats
GROUP BY product_name, product_category
ORDER BY product_name;
```

<h6>Answer:</h6>
  <img width="400" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/ccb568c0-56a8-4f42-8b9c-40d34700e85f">

  <ul>
  <li>The SQL query involves multiple Common Table Expressions (CTEs) to analyze product interactions and purchases.</li>
  <li>The first CTE named <code>ProdView</code> calculates the number of views for each product by joining the <code>events</code> and <code>page_hierarchy</code> tables on the <code>page_id</code> column.</li>
  <li>The <code>WHERE product_id IS NOT NULL</code> clause filters out rows with null product IDs.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>visit_id</code>, <code>product_id</code>, <code>product_name</code>, and <code>product_category</code>.</li>
  <li>The second CTE named <code>ProdCart</code> calculates the number of cart additions for each product in a similar manner to the first CTE.</li>
  <li>The third CTE named <code>PurchaseEvents</code> identifies distinct visit IDs with purchase events (event_type = 3).</li>
  <li>The fourth CTE named <code>ProductStats</code> combines data from the previous CTEs to calculate aggregated statistics for each product.</li>
  <li>The main query selects <code>product_name</code>, <code>product_category</code>, and aggregates the <code>views</code>, <code>cart_adds</code>, and <code>purchases</code> based on different conditions.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>product_name</code> and <code>product_category</code>.</li>
  <li>The <code>ORDER BY product_name</code> clause sorts the results alphabetically by product name.</li>
</ul>

  
Additionally, create another table which further aggregates the data for the above points but this time for each product category instead of individual products <br>

```sql
WITH ProductPageEvents AS (
    SELECT 
        e.visit_id,
        ph.product_id,
        ph.page_name AS product_name,
        ph.product_category,
        COUNT(CASE WHEN e.event_type = 1 THEN 1 ELSE NULL END) AS page_view,
        COUNT(CASE WHEN e.event_type = 2 THEN 1 ELSE NULL END) AS cart_add
    FROM events AS e
    JOIN page_hierarchy AS ph ON e.page_id = ph.page_id
    WHERE product_id IS NOT NULL
    GROUP BY e.visit_id, ph.product_id, ph.page_name, ph.product_category
),
PurchaseEvents AS (
    SELECT DISTINCT visit_id
    FROM events
    WHERE event_type = 3
),
CombinedTable AS (
    SELECT 
        ppe.visit_id, 
        ppe.product_id, 
        ppe.product_name, 
        ppe.product_category, 
        ppe.page_view, 
        ppe.cart_add,
        CASE WHEN pe.visit_id IS NOT NULL THEN 1 ELSE 0 END AS purchase
    FROM ProductPageEvents AS ppe
    LEFT JOIN PurchaseEvents AS pe ON ppe.visit_id = pe.visit_id
),
ProductInfo AS (
    SELECT 
        product_name, 
        product_category, 
        SUM(page_view) AS views,
        SUM(cart_add) AS cart_adds, 
        SUM(CASE WHEN cart_add = 1 AND purchase = 0 THEN 1 ELSE 0 END) AS abandoned,
        SUM(CASE WHEN cart_add = 1 AND purchase = 1 THEN 1 ELSE 0 END) AS purchases
    FROM CombinedTable
    GROUP BY product_id, product_name, product_category
),
CategoryStats AS (
    SELECT
        product_category,
        SUM(views) AS total_category_views,
        SUM(cart_adds) AS total_category_cart_adds,
        SUM(abandoned) AS total_category_abandoned,
        SUM(purchases) AS total_category_purchases
    FROM ProductInfo
    GROUP BY product_category
)


SELECT
    product_category,
    total_category_views,
    total_category_cart_adds,
    total_category_abandoned,
    total_category_purchases
FROM CategoryStats;
```
<h6>Answer:</h6>
  <img width="400" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/37df02b4-cf70-4f0a-b2e4-d36d250dd606">
  <ul>
  <li>The SQL query analyzes product page events, purchases, and statistics based on different categories.</li>
  <li>The first CTE named <code>ProductPageEvents</code> calculates page views and cart additions for each product by joining the <code>events</code> and <code>page_hierarchy</code> tables on the <code>page_id</code> column.</li>
  <li>The <code>WHERE product_id IS NOT NULL</code> clause filters out rows with null product IDs.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>visit_id</code>, <code>product_id</code>, <code>product_name</code>, and <code>product_category</code>.</li>
  <li>The second CTE named <code>PurchaseEvents</code> identifies distinct visit IDs with purchase events (event_type = 3).</li>
  <li>The third CTE named <code>CombinedTable</code> combines data from the previous CTEs and determines if a visit resulted in a purchase.</li>
  <li>The fourth CTE named <code>ProductInfo</code> aggregates statistics for each product, including views, cart additions, abandoned carts, and successful purchases.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>product_id</code>, <code>product_name</code>, and <code>product_category</code>.</li>
  <li>The fifth CTE named <code>CategoryStats</code> aggregates category-level statistics based on the <code>product_category</code>.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>product_category</code>.</li>
  <li>The main query selects <code>product_category</code> and the aggregated statistics for total category views, cart additions, abandoned carts, and purchases.</li>
</ul>

  
Use your 2 new output tables - answer the following questions:<br></p>
  <li><h5>Which product had the most views, cart adds and purchases?</h5></li>

  ```sql
WITH ProductPageEvents AS (
    SELECT 
        e.visit_id,
        ph.product_id,
        ph.page_name AS product_name,
        ph.product_category,
        COUNT(CASE WHEN e.event_type = 1 THEN 1 ELSE NULL END) AS page_view,
        COUNT(CASE WHEN e.event_type = 2 THEN 1 ELSE NULL END) AS cart_add
    FROM events AS e
    JOIN page_hierarchy AS ph ON e.page_id = ph.page_id
    WHERE product_id IS NOT NULL
    GROUP BY e.visit_id, ph.product_id, ph.page_name, ph.product_category
),
PurchaseEvents AS (
    SELECT DISTINCT visit_id
    FROM events
    WHERE event_type = 3
),
CombinedTable AS (
    SELECT 
        ppe.visit_id, 
        ppe.product_id, 
        ppe.product_name, 
        ppe.product_category, 
        ppe.page_view, 
        ppe.cart_add,
        CASE WHEN pe.visit_id IS NOT NULL THEN 1 ELSE 0 END AS purchase
    FROM ProductPageEvents AS ppe
    LEFT JOIN PurchaseEvents AS pe ON ppe.visit_id = pe.visit_id
),
ProductInfo AS (
    SELECT 
        product_name, 
        product_category, 
        SUM(page_view) AS views,
        SUM(cart_add) AS cart_adds, 
        SUM(CASE WHEN cart_add = 1 AND purchase = 0 THEN 1 ELSE 0 END) AS abandoned,
        SUM(CASE WHEN cart_add = 1 AND purchase = 1 THEN 1 ELSE 0 END) AS purchases
    FROM CombinedTable
    GROUP BY product_id, product_name, product_category
)

SELECT
    product_name,
    MAX(views) AS most_views,
    MAX(cart_adds) AS most_cart_adds,
    MAX(purchases) AS most_purchases
FROM ProductInfo
GROUP BY product_name
ORDER BY most_views DESC, most_cart_adds DESC, most_purchases DESC
LIMIT 1;
```
  <h6>Answer:</h6>
  <img width="350" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/f7d5e7ff-cb17-4208-ba55-8fb8bba20dd0">
  <ul>
  <li>The SQL query focuses on analyzing product page events, purchases, and statistics to find the most viewed, most cart-added, and most purchased product.</li>
  <li>The first CTE named <code>ProductPageEvents</code> calculates page views and cart additions for each product by joining the <code>events</code> and <code>page_hierarchy</code> tables on the <code>page_id</code> column.</li>
  <li>The <code>WHERE product_id IS NOT NULL</code> clause filters out rows with null product IDs.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>visit_id</code>, <code>product_id</code>, <code>product_name</code>, and <code>product_category</code>.</li>
  <li>The second CTE named <code>PurchaseEvents</code> identifies distinct visit IDs with purchase events (event_type = 3).</li>
  <li>The third CTE named <code>CombinedTable</code> combines data from the previous CTEs and determines if a visit resulted in a purchase.</li>
  <li>The fourth CTE named <code>ProductInfo</code> aggregates statistics for each product, including views, cart additions, abandoned carts, and successful purchases.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>product_id</code>, <code>product_name</code>, and <code>product_category</code>.</li>
  <li>The main query selects <code>product_name</code> and aggregates the maximum views, cart additions, and purchases for each product.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>product_name</code>.</li>
  <li>The <code>ORDER BY</code> clause orders the results based on most views, most cart additions, and most purchases in descending order.</li>
  <li>The <code>LIMIT 1</code> clause restricts the output to only the top product with the most views, cart additions, and purchases.</li>
</ul>

  
  <li><h5>Which product was most likely to be abandoned?</h5></li>

  ```sql
WITH ProductPageEvents AS (
    SELECT 
        e.visit_id,
        ph.product_id,
        ph.page_name AS product_name,
        ph.product_category,
        COUNT(CASE WHEN e.event_type = 1 THEN 1 ELSE NULL END) AS page_view,
        COUNT(CASE WHEN e.event_type = 2 THEN 1 ELSE NULL END) AS cart_add
    FROM events AS e
    JOIN page_hierarchy AS ph ON e.page_id = ph.page_id
    WHERE product_id IS NOT NULL
    GROUP BY e.visit_id, ph.product_id, ph.page_name, ph.product_category
),
PurchaseEvents AS (
    SELECT DISTINCT visit_id
    FROM events
    WHERE event_type = 3
),
CombinedTable AS (
    SELECT 
        ppe.visit_id, 
        ppe.product_id, 
        ppe.product_name, 
        ppe.product_category, 
        ppe.page_view, 
        ppe.cart_add,
        CASE WHEN pe.visit_id IS NOT NULL THEN 1 ELSE 0 END AS purchase
    FROM ProductPageEvents AS ppe
    LEFT JOIN PurchaseEvents AS pe ON ppe.visit_id = pe.visit_id
),
ProductInfo AS (
    SELECT 
        product_name, 
        product_category, 
        SUM(page_view) AS views,
        SUM(cart_add) AS cart_adds, 
        SUM(CASE WHEN cart_add = 1 AND purchase = 0 THEN 1 ELSE 0 END) AS abandoned,
        SUM(CASE WHEN cart_add = 1 AND purchase = 1 THEN 1 ELSE 0 END) AS purchases
    FROM CombinedTable
    GROUP BY product_id, product_name, product_category
)

SELECT
    product_name,
    MAX(abandoned_percentage) AS most_likely_abandoned
FROM (
    SELECT
        product_name,
        (CAST(abandoned AS decimal) / CAST(cart_adds AS decimal)) * 100 AS abandoned_percentage
    FROM ProductInfo
) AS AbandonedPercentage
GROUP BY product_name
ORDER BY most_likely_abandoned DESC
LIMIT 1;
```
  <h6>Answer:</h6>
  <img width="350" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/09844e65-dca0-4fb8-8c8c-101987d00915">
  <ul>
  <li>The SQL query aims to identify the product with the highest likelihood of abandoned cart based on statistics.</li>
  <li>The first CTE named <code>ProductPageEvents</code> calculates page views and cart additions for each product by joining the <code>events</code> and <code>page_hierarchy</code> tables on the <code>page_id</code> column.</li>
  <li>The <code>WHERE product_id IS NOT NULL</code> clause filters out rows with null product IDs.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>visit_id</code>, <code>product_id</code>, <code>product_name</code>, and <code>product_category</code>.</li>
  <li>The second CTE named <code>PurchaseEvents</code> identifies distinct visit IDs with purchase events (event_type = 3).</li>
  <li>The third CTE named <code>CombinedTable</code> combines data from the previous CTEs and determines if a visit resulted in a purchase.</li>
  <li>The fourth CTE named <code>ProductInfo</code> aggregates statistics for each product, including page views, cart additions, abandoned carts, and successful purchases.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>product_id</code>, <code>product_name</code>, and <code>product_category</code>.</li>
  <li>The main query selects <code>product_name</code> and calculates the percentage of abandoned carts for each product using the formula <code>(abandoned / cart_adds) * 100</code>.</li>
  <li>The calculated abandoned percentage and product name are included in the derived table <code>AbandonedPercentage</code>.</li>
  <li>The outer query selects the product name and maximum abandoned percentage for each product.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>product_name</code>.</li>
  <li>The <code>ORDER BY</code> clause orders the results based on the most likely abandoned percentage in descending order.</li>
  <li>The <code>LIMIT 1</code> clause restricts the output to only the top product with the highest likelihood of abandoned cart.</li>
</ul>

  
  <li><h5></h5>Which product had the highest view to purchase percentage?</li>

  ```sql
WITH ProductPageEvents AS (
    SELECT 
        e.visit_id,
        ph.product_id,
        ph.page_name AS product_name,
        ph.product_category,
        COUNT(CASE WHEN e.event_type = 1 THEN 1 ELSE NULL END) AS page_view,
        COUNT(CASE WHEN e.event_type = 2 THEN 1 ELSE NULL END) AS cart_add
    FROM events AS e
    JOIN page_hierarchy AS ph ON e.page_id = ph.page_id
    WHERE product_id IS NOT NULL
    GROUP BY e.visit_id, ph.product_id, ph.page_name, ph.product_category
),
PurchaseEvents AS (
    SELECT DISTINCT visit_id
    FROM events
    WHERE event_type = 3
),
CombinedTable AS (
    SELECT 
        ppe.visit_id, 
        ppe.product_id, 
        ppe.product_name, 
        ppe.product_category, 
        ppe.page_view, 
        ppe.cart_add,
        CASE WHEN pe.visit_id IS NOT NULL THEN 1 ELSE 0 END AS purchase
    FROM ProductPageEvents AS ppe
    LEFT JOIN PurchaseEvents AS pe ON ppe.visit_id = pe.visit_id
),
ProductInfo AS (
    SELECT 
        product_name, 
        product_category, 
        SUM(page_view) AS views,
        SUM(cart_add) AS cart_adds, 
        SUM(CASE WHEN cart_add = 1 AND purchase = 0 THEN 1 ELSE 0 END) AS abandoned,
        SUM(CASE WHEN cart_add = 1 AND purchase = 1 THEN 1 ELSE 0 END) AS purchases
    FROM CombinedTable
    GROUP BY product_id, product_name, product_category
),
ViewToPurchase AS (
    SELECT
        product_name,
        (CAST(views AS decimal) / CAST(purchases AS decimal)) * 100 AS view_to_purchase_percentage
    FROM ProductInfo
)

SELECT
    product_name
FROM ViewToPurchase
ORDER BY view_to_purchase_percentage DESC
LIMIT 1;
```
  <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/079f599f-58c6-4ee8-b97c-9d12028822f2">
  <ul>
  <li>The SQL query aims to identify the product with the highest view-to-purchase conversion rate based on statistics.</li>
  <li>The first CTE named <code>ProductPageEvents</code> calculates page views and cart additions for each product by joining the <code>events</code> and <code>page_hierarchy</code> tables on the <code>page_id</code> column.</li>
  <li>The <code>WHERE product_id IS NOT NULL</code> clause filters out rows with null product IDs.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>visit_id</code>, <code>product_id</code>, <code>product_name</code>, and <code>product_category</code>.</li>
  <li>The second CTE named <code>PurchaseEvents</code> identifies distinct visit IDs with purchase events (event_type = 3).</li>
  <li>The third CTE named <code>CombinedTable</code> combines data from the previous CTEs and determines if a visit resulted in a purchase.</li>
  <li>The fourth CTE named <code>ProductInfo</code> aggregates statistics for each product, including page views, cart additions, abandoned carts, and successful purchases.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>product_id</code>, <code>product_name</code>, and <code>product_category</code>.</li>
  <li>The fifth CTE named <code>ViewToPurchase</code> calculates the view-to-purchase conversion percentage for each product using the formula <code>(views / purchases) * 100</code>.</li>
  <li>The calculated view-to-purchase percentage and product name are included in the derived table <code>ViewToPurchase</code>.</li>
  <li>The main query selects the product name with the highest view-to-purchase percentage based on the <code>view_to_purchase_percentage</code> column.</li>
  <li>The <code>ORDER BY</code> clause orders the results based on the view-to-purchase percentage in descending order.</li>
  <li>The <code>LIMIT 1</code> clause restricts the output to only the top product with the highest view-to-purchase conversion rate.</li>
</ul>

  
  <li><h5>What is the average conversion rate from view to cart add?</h5></li>

  ```sql
WITH ProductPageEvents AS (
    SELECT 
        e.visit_id,
        ph.product_id,
        ph.page_name AS product_name,
        ph.product_category,
        COUNT(CASE WHEN e.event_type = 1 THEN 1 ELSE NULL END) AS page_view,
        COUNT(CASE WHEN e.event_type = 2 THEN 1 ELSE NULL END) AS cart_add
    FROM events AS e
    JOIN page_hierarchy AS ph ON e.page_id = ph.page_id
    WHERE product_id IS NOT NULL
    GROUP BY e.visit_id, ph.product_id, ph.page_name, ph.product_category
),
ProductStats AS (
    SELECT
        product_name,
        SUM(page_view) AS views,
        SUM(cart_add) AS cart_adds
    FROM ProductPageEvents
    GROUP BY product_name
)

SELECT
    AVG((CAST(cart_adds AS decimal) / CAST(views AS decimal)) * 100) AS average_conversion_rate
FROM ProductStats;
```
  <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/b53c7604-6257-4fa3-b93b-db52b5165bf6">
  <ul>
  <li>The SQL query calculates the average conversion rate for products based on their page views and cart additions.</li>
  <li>The first CTE named <code>ProductPageEvents</code> calculates page views and cart additions for each product by joining the <code>events</code> and <code>page_hierarchy</code> tables on the <code>page_id</code> column.</li>
  <li>The <code>WHERE product_id IS NOT NULL</code> clause filters out rows with null product IDs.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>visit_id</code>, <code>product_id</code>, <code>product_name</code>, and <code>product_category</code>.</li>
  <li>The second CTE named <code>ProductStats</code> aggregates page views and cart additions for each product from the <code>ProductPageEvents</code> CTE.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>product_name</code>.</li>
  <li>The main query calculates the average conversion rate using the formula <code>(cart_adds / views) * 100</code> for each product and then calculates the average of these conversion rates using the <code>AVG</code> function.</li>
  <li>The result is displayed as <code>average_conversion_rate</code>.</li>
</ul>
</ol>

<h4><a name="c.campaignsanalysis"></a>C. Campaigns Analysis</h4>
<ol> 
  <li><h5>Generate a table that has 1 single row for every unique visit_id record and has the following columns:
<ul>
<li>user_id</li>
<li>visit_id</li>
<li>visit_start_time: the earliest event_time for each visit</li>
<li>page_views: count of page views for each visit</li>
<li>cart_adds: count of product cart add events for each visit</li>
<li>purchase: 1/0 flag if a purchase event exists for each visit</li>
<li>campaign_name: map the visit to a campaign if the visit_start_time falls between the start_date and end_date</li>
<li>impression: count of ad impressions for each visit</li>
<li>click: count of ad clicks for each visit</li>
<li>(Optional column) cart_products: a comma separated text value with products added to the cart sorted by the order they were added to the cart (hint: use the sequence_number)</li></ul></h5></li>

  ```sql
SELECT
    u.user_id,
    e.visit_id,
    MIN(e.event_time) AS visit_start_time,
    SUM(CASE WHEN e.event_type = 1 THEN 1 ELSE 0 END) AS page_views,
    SUM(CASE WHEN e.event_type = 2 THEN 1 ELSE 0 END) AS cart_adds,
    MAX(CASE WHEN e.event_type = 3 THEN 1 ELSE 0 END) AS purchase,
    ci.campaign_name,
    SUM(CASE WHEN e.event_type = 4 THEN 1 ELSE 0 END) AS impression,
    SUM(CASE WHEN e.event_type = 5 THEN 1 ELSE 0 END) AS click,
    STRING_AGG(
        CASE WHEN e.event_type = 2 THEN ph.page_name END,
        ', ' 
        ORDER BY e.sequence_number
    ) AS cart_products
FROM users u
INNER JOIN events e ON u.cookie_id = e.cookie_id
LEFT JOIN campaign_identifier ci ON e.event_time BETWEEN ci.start_date AND ci.end_date
LEFT JOIN page_hierarchy ph ON e.page_id = ph.page_id
GROUP BY u.user_id, e.visit_id, ci.campaign_name;

```
 <h6>Answer:</h6>
<img width="800" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/d62c0ac7-3738-4066-99ee-7435c208d7ae">
<ul>
  <li>The SQL query retrieves user-related data along with various event metrics from the <code>events</code> table.</li>
  <li>The <code>SELECT</code> statement selects columns such as <code>user_id</code>, <code>visit_id</code>, and more.</li>
  <li>The <code>MIN(e.event_time)</code> function is used to find the minimum event time for each visit, serving as the visit start time.</li>
  <li>The <code>SUM(CASE WHEN e.event_type = 1 THEN 1 ELSE 0 END)</code> aggregates the count of page views using a conditional statement.</li>
  <li>The <code>SUM(CASE WHEN e.event_type = 2 THEN 1 ELSE 0 END)</code> aggregates the count of cart additions using a similar conditional statement.</li>
  <li>The <code>MAX(CASE WHEN e.event_type = 3 THEN 1 ELSE 0 END)</code> identifies if a purchase event occurred during the visit.</li>
  <li>The <code>LEFT JOIN</code> clauses join the <code>campaign_identifier</code> and <code>page_hierarchy</code> tables based on event time and page ID respectively.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>user_id</code>, <code>visit_id</code>, and <code>campaign_name</code>.</li>
  <li>The <code>STRING_AGG</code> function concatenates page names for cart products using a comma separator.</li>
  <li>The result of the query provides insights into user behavior during visits, including metrics like page views, cart additions, purchases, campaign associations, and more.</li>
</ul>
</ol>


  
  




