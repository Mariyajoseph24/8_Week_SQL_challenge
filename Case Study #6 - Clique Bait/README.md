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
<h4><a name="a.digitaldnalysis"></a>2. Digital Analysis</h4>
<ol> 
  <li><h5>How many users are there?</h5></li>

  ```sql
SELECT COUNT (DISTINCT user_id) AS user_cnt
FROM users;
```
  <h6>Answer:</h6>
<img width="100" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/69aa003d-3866-4648-948a-b514576efd71">
  
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

  <li><h5>What is the number of events for each event type?</h5></li>

  ```sql
SELECT event_type, COUNT(*) AS event_count
FROM events
GROUP BY event_type
ORDER BY event_type;
```
   <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/f49bf803-80ec-47fc-bb87-f3246ab17039">

  <li><h5>What is the percentage of visits which have a purchase event?</h5></li>

  ```sql
SELECT (COUNT(DISTINCT CASE WHEN event_type = 3 THEN visit_id END) * 100.0 / COUNT(DISTINCT visit_id)) AS purchase_percentage
FROM events;
```
   <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/f87f3815-7fd2-4cf5-b107-a02bd785f3a8">

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
   




