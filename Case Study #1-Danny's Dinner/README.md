
<h1>Case Study #1 - Danny's Diner👨🏻‍🍳</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/c69d49a0-ffd6-4cf1-b66f-1d1eb14f8549">
<h1>Contents</h1>
<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#problemstatement">Problem Statement</a></li>
  <li><a href="#entityrelationshipdiagram">Entity Relationship Diagram</a></li>
  <li><a href="#casestudyquestionsandsolutions">Case Study Questions & Solutions</a></li>
  <li><a href="#bonusquestionsandsolutions">Bonus Questions & Solutions</a></li>
  <li><a href="#keyinsights">Key Insights</a></li>
</ul>

<h1><a name="introduction">Introduction</a></h1>
<p>In early 2021, Danny follows his passion for Japanese food and opens "Danny's Diner," a charming restaurant offering sushi, curry, and ramen. However, lacking data analysis expertise, the restaurant struggles to leverage the basic data collected during its initial months to make informed business decisions. Danny's Diner seeks assistance in using this data effectively to keep the restaurant thriving.</p>

<h1><a name="problemstatement">Problem Statement</a></h1>
<p>Danny aims to utilize customer data to gain valuable insights into their visiting patterns, spending habits, and favorite menu items. By establishing a deeper connection with his customers, he can provide a more personalized experience for his loyal patrons.

He plans to use these insights to make informed decisions about expanding the existing customer loyalty program. Additionally, Danny seeks assistance in generating basic datasets for his team to inspect the data conveniently, without requiring SQL expertise.

Due to privacy concerns, he has shared a sample of his overall customer data, hoping it will be sufficient for you to create fully functional SQL queries to address his questions.

The case study revolves around three key datasets:

- Sales
- Menu
- Members</p>

<h1><a name="entityrelationshipdiagram">Entity Relationship Diagram</a></h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/4bc1a02f-6fac-47f5-82c7-d9be65de1700">


<h1><a name="casestudyquestionsandsolutions">Case Study Questions & Solutions</a></h1>

<ol>

  <li><h5>What is the total amount each customer spent at the restaurant?</h5></li>
	
```sql
SELECT S.customer_id, SUM(M.price) AS total_amnt
FROM sales S
JOIN menu M ON S.product_id = M.product_id
GROUP BY S.customer_id
ORDER BY customer_id
```

<h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/15c40926-3faf-43a6-91de-5e01f12955fc">
<ul>
  <li>The SQL query retrieves the <code>customer_id</code> and calculates the total amount spent (<code>total_amnt</code>) by each customer at the restaurant.</li>
  <li>It combines data from the <code>sales</code> and <code>menu</code> tables based on matching <code>product_id</code>.</li>
  <li>The results are grouped by <code>customer_id</code>.</li>
  <li>The query then calculates the total sum of <code>price</code> for each group of sales records with the same <code>customer_id</code>.</li>
  <li>Finally, the results are sorted in ascending order based on the <code>customer_id</code>.</li>
</ul>



  <li><h5>How many days has each customer visited the restaurant?</h5></li>

```sql
SELECT customer_id, COUNT(DISTINCT order_date) AS No_Days
FROM sales
GROUP BY customer_id
```
<h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/8e92fa69-0d80-4713-899d-001ee361f30f">
<ul>
  <li>The SQL query selects the <code>customer_id</code> and counts the number of distinct order dates (<code>No_Days</code>) for each customer.</li>
  <li>It retrieves data from the <code>sales</code> table.</li>
  <li>The results are grouped by <code>customer_id</code>.</li>
  <li>The <code>COUNT(DISTINCT order_date)</code> function calculates the number of unique order dates for each customer.</li>
  <li>Finally, the query presents the total number of unique order dates as <code>No_Days</code> for each customer.</li>
</ul>



  <li><h5>What was the first item from the menu purchased by each customer?</h5></li>

```sql
WITH CTE AS
(SELECT S.customer_id,DENSE_RANK() OVER(PARTITION BY S.customer_id ORDER BY S.order_date)AS rn,M.product_name
FROM sales S
JOIN menu M ON S.product_id=M.product_id)

SELECT customer_id,product_name
FROM CTE
WHERE rn=1
```

<h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/09694137-3bf0-48a0-8cc6-f9fff7f631d7)">
<ul>
  <li>The SQL query uses a Common Table Expression (CTE) named <code>CTE</code> to generate a temporary result set.</li>
  <li>Within the CTE, it selects the <code>customer_id</code>, assigns a dense rank to each row based on the order date for each customer, and retrieves the corresponding <code>product_name</code> from the <code>menu</code> table.</li>
  <li>The <code>sales</code> table is joined with the <code>menu</code> table on matching <code>product_id</code>.</li>
  <li>The DENSE_RANK() function assigns a rank to each row within the partition of each <code>customer_id</code> based on the <code>order_date</code> in ascending order.</li>
  <li>Each <code>customer_id</code> has its own partition and separate ranks based on the order dates of their purchases.</li>
  <li>Next, the main query selects the <code>customer_id</code> and corresponding <code>product_name</code> from the CTE.</li>
  <li>It filters the results and only includes rows where the rank <code>rn</code> is equal to 1, which means the earliest purchase for each <code>customer_id</code>.</li>
  <li>As a result, the query returns the first purchased product for each customer.</li>
</ul>


  <li><h5>What is the most purchased item on the menu and how many times was it purchased by all customers?</h5></li>

```sql
SELECT M.product_name,COUNT(S.product_id)AS most_ordered
FROM Sales S
JOIN menu M ON S.product_id=M.product_id
GROUP BY M.product_name
ORDER BY most_ordered DESC
LIMIT 1
```

<h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/ceb3fa1b-d1f1-4c88-b3f1-6e642a5e8c70)">
<ul>
  <li>The SQL query selects the <code>product_name</code> from the <code>menu</code> table and counts the number of times each product was ordered (<code>most_ordered</code>).</li>
  <li>It retrieves data from the <code>Sales</code> table and joins it with the <code>menu</code> table based on matching <code>product_id</code>.</li>
  <li>The results are grouped by <code>product_name</code>.</li>
  <li>The <code>COUNT(S.product_id)</code> function calculates the number of occurrences of each <code>product_id</code> in the <code>Sales</code> table.</li>
  <li>The query then presents the <code>product_name</code> and its corresponding count as <code>most_ordered</code> for each product.</li>
  <li>Next, the results are sorted in descending order based on the <code>most_ordered</code> column, so the most ordered product appears first.</li>
  <li>The <code>LIMIT 1</code> clause is used to restrict the result to only one row, effectively showing the most ordered product.</li>
</ul>



  <li><h5>Which item was the most popular for each customer?</h5></li>

```sql
WITH CTE AS
(SELECT S.customer_id,M.product_name,COUNT(M.product_id)AS order_count,DENSE_RANK() OVER(PARTITION BY S.customer_id ORDER BY COUNT(S.product_id)DESC) AS rnk
FROM sales S
JOIN menu M ON S.product_id=M.product_id
GROUP BY S.customer_id,M.product_name)

SELECT customer_id,product_name,order_count
FROM CTE
WHERE rnk=1
```

<h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/9b194b28-afed-43b7-bfbc-d396c80877c0">
<ul>
  <li>The SQL query uses a Common Table Expression (CTE) named <code>CTE</code> to generate a temporary result set.</li>
  <li>Within the CTE, it selects the <code>customer_id</code>, <code>product_name</code>, and counts the number of times each product was ordered (<code>order_count</code>) for each customer.</li>
  <li>It retrieves data from the <code>sales</code> table and joins it with the <code>menu</code> table based on matching <code>product_id</code>.</li>
  <li>The results are grouped by <code>customer_id</code> and <code>product_name</code> to get the count of orders for each product of each customer.</li>
  <li>The <code>COUNT(M.product_id)</code> function calculates the number of occurrences of each <code>product_id</code> in the <code>menu</code> table.</li>
  <li>The DENSE_RANK() function assigns a rank to each row within the partition of each <code>customer_id</code> based on the order count of products in descending order.</li>
  <li>Each <code>customer_id</code> has its own partition and separate ranks based on the number of product orders.</li>
  <li>Next, the main query selects the <code>customer_id</code>, <code>product_name</code>, and <code>order_count</code> from the CTE.</li>
  <li>It filters the results and only includes rows where the rank <code>rnk</code> is equal to 1, which means the most ordered product for each <code>customer_id</code>.</li>
  <li>As a result, the query returns the customer's ID, the most ordered product, and the number of times it was ordered by that customer.</li>
</ul>


  <li><h5>Which item was purchased first by the customer after they became a member?</h5></li>

  ```sql
  SELECT DISTINCT ON (s.customer_id)
       s.customer_id,
       m.product_name
FROM sales s
JOIN members mbr ON s.customer_id = mbr.customer_id
JOIN menu m ON s.product_id = m.product_id
WHERE s.order_date > mbr.join_date
ORDER BY s.customer_id;
```

<h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/ca782906-d2a5-4f85-ae09-879818790462">
<ul>
  <li>The SQL query retrieves distinct rows for each unique <code>customer_id</code> with their corresponding <code>product_name</code> from the <code>sales</code> and <code>menu</code> tables.</li>
  <li>It filters the data based on the condition that the <code>order_date</code> in the <code>sales</code> table is greater than the <code>join_date</code> of the customer in the <code>members</code> table.</li>
  <li>The <code>sales</code> table is aliased as <code>s</code>, the <code>members</code> table is aliased as <code>mbr</code>, and the <code>menu</code> table is aliased as <code>m</code>.</li>
  <li>The query performs inner joins between <code>sales</code> and <code>members</code> tables on matching <code>customer_id</code> and between <code>sales</code> and <code>menu</code> tables on matching <code>product_id</code>.</li>
  <li>Only rows that meet the join condition and the <code>order_date > join_date</code> condition are considered in the result set.</li>
  <li>The query selects the <code>customer_id</code> and corresponding <code>product_name</code> for each customer who has placed an order after their <code>join_date</code>.</li>
  <li>The results are sorted in ascending order based on the <code>customer_id</code>.</li>
  <li>The <code>DISTINCT ON (s.customer_id)</code> clause ensures that only the first occurrence of each <code>customer_id</code> is included in the result set.</li>
  <li>As a result, the query returns a unique list of <code>customer_id</code> along with the first <code>product_name</code> they ordered after joining as a member.</li>
</ul>


  <li><h5>Which item was purchased just before the customer became a member?</h5></li>

  ```sql
SELECT DISTINCT ON (s.customer_id)
		s.customer_id,
       m.product_name
FROM sales s
JOIN members mbr ON s.customer_id = mbr.customer_id
JOIN menu m ON s.product_id = m.product_id
WHERE s.order_date < mbr.join_date
ORDER BY s.customer_id;
```

<h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/76aef691-9fed-4b92-9ead-721187fbf711">
<ul>
  <li>The SQL query retrieves distinct rows for each unique <code>customer_id</code> with their corresponding <code>product_name</code> from the <code>sales</code> and <code>menu</code> tables.</li>
  <li>It filters the data based on the condition that the <code>order_date</code> in the <code>sales</code> table is less than the <code>join_date</code> of the customer in the <code>members</code> table.</li>
  <li>The <code>sales</code> table is aliased as <code>s</code>, the <code>members</code> table is aliased as <code>mbr</code>, and the <code>menu</code> table is aliased as <code>m</code>.</li>
  <li>The query performs inner joins between <code>sales</code> and <code>members</code> tables on matching <code>customer_id</code> and between <code>sales</code> and <code>menu</code> tables on matching <code>product_id</code>.</li>
  <li>Only rows that meet the join condition and the <code>order_date < join_date</code> condition are considered in the result set.</li>
  <li>The query selects the <code>customer_id</code> and corresponding <code>product_name</code> for each customer who has placed an order before their <code>join_date</code>.</li>
  <li>The results are sorted in ascending order based on the <code>customer_id</code>.</li>
  <li>The <code>DISTINCT ON (s.customer_id)</code> clause ensures that only the first occurrence of each <code>customer_id</code> is included in the result set.</li>
  <li>As a result, the query returns a unique list of <code>customer_id</code> along with the first <code>product_name</code> they ordered before joining as a member.</li>
</ul>


  <li><h5>What is the total items and amount spent for each member before they became a member?</h5></li>

  ```sql
SELECT S.customer_id,
	COUNT(S.product_id) AS total_item,
	SUM(M.price) AS total_amont
FROM sales S
JOIN menu M ON S.product_id=M.product_id
JOIN members ME ON S.customer_id=ME.customer_id
WHERE S.order_date<ME.join_date
GROUP BY S.customer_id
ORDER BY S.customer_id
```

<h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/4806449e-5d44-47eb-8a4b-6d75c226a5c0">
<ul>
  <li>The SQL query retrieves the <code>customer_id</code> along with the total count of items ordered (<code>total_item</code>) and the total amount spent (<code>total_amont</code>) by each customer.</li>
  <li>It retrieves data from the <code>sales</code> table and joins it with the <code>menu</code> table based on matching <code>product_id</code>.</li>
  <li>It also joins the <code>sales</code> table with the <code>members</code> table based on matching <code>customer_id</code>.</li>
  <li>The results are filtered based on the condition that the <code>order_date</code> in the <code>sales</code> table is less than the <code>join_date</code> of the customer in the <code>members</code> table.</li>
  <li>The <code>COUNT(S.product_id)</code> function calculates the number of occurrences of each <code>product_id</code> in the <code>sales</code> table, giving the total number of items ordered by each customer.</li>
  <li>The <code>SUM(M.price)</code> function calculates the sum of the <code>price</code> from the <code>menu</code> table, providing the total amount spent by each customer.</li>
  <li>Results are grouped by <code>customer_id</code> to get the totals for each customer.</li>
  <li>The query then presents the <code>customer_id</code>, <code>total_item</code>, and <code>total_amont</code> for each customer who placed orders before joining as a member.</li>
  <li>Finally, the results are sorted in ascending order based on the <code>customer_id</code>.</li>
</ul>


  <li><h5>If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?</h5></li>

  ```sql
SELECT s.customer_id,
       SUM(CASE
               WHEN m.product_name = 'sushi' THEN price * 2
               ELSE price
           END) * 10 AS total_points
FROM sales s
JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id
ORDER BY s.customer_id;
```

<h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/fce539f7-78cd-47fd-9aac-bee87e6974ee">
<ul>
  <li>The SQL query retrieves the <code>customer_id</code> and calculates the total points (<code>total_points</code>) earned by each customer based on their purchases from the <code>sales</code> and <code>menu</code> tables.</li>
  <li>It retrieves data from the <code>sales</code> table and joins it with the <code>menu</code> table based on matching <code>product_id</code>.</li>
  <li>The query uses a <code>CASE</code> statement to differentiate between 'sushi' and other products.</li>
  <li>If the product name is 'sushi', the price is multiplied by 2 to give double points.</li>
  <li>Otherwise, the regular price is considered.</li>
  <li>The <code>SUM</code> function calculates the total points for each customer by adding up the points earned from their purchases.</li>
  <li>The total points are then multiplied by 10 to give a scaled value.</li>
  <li>Results are grouped by <code>customer_id</code> to get the total points for each customer.</li>
  <li>The query then presents the <code>customer_id</code> and the scaled <code>total_points</code> for each customer based on their purchases.</li>
  <li>Finally, the results are sorted in ascending order based on the <code>customer_id</code>.</li>
</ul>


  <li><h5>In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?</h5></li>

  ```sql
WITH dates_cte AS (
  SELECT 
    customer_id, 
    join_date, 
    join_date + INTERVAL '6 days' AS valid_date, 
    DATE_TRUNC('month', '2021-01-31'::DATE) + INTERVAL '1 month' - INTERVAL '1 day' AS last_date
  FROM members
)

SELECT 
  s.customer_id, 
  SUM(CASE
    WHEN m.product_name = 'sushi' OR (s.order_date BETWEEN dates.join_date AND dates.valid_date) THEN 2 * 10 * m.price
    ELSE 10 * m.price END) AS points
FROM sales s
INNER JOIN dates_cte AS dates
  ON s.customer_id = dates.customer_id
  AND dates.join_date <= s.order_date
  AND s.order_date <= dates.last_date
INNER JOIN menu m
  ON s.product_id = m.product_id
GROUP BY s.customer_id
ORDER BY s.customer_id;
```

<h6>Answer:</h6>
<img width="200" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/9add2e0b-cea7-4822-b025-18a9c78e339c">
</ol>
<ul>
  <li>The SQL query starts by creating a Common Table Expression (CTE) named <code>dates_cte</code>.</li>
  <li>Within the CTE, it selects <code>customer_id</code>, <code>join_date</code>, <code>join_date + INTERVAL '6 days'</code> as <code>valid_date</code>, and the last day of the month for the date '2021-01-31' as <code>last_date</code>.</li>
  <li>The CTE is used to generate date ranges for each customer, from their <code>join_date</code> to 6 days later, and the last day of the month for January 2021.</li>
  <li>Next, the main query selects the <code>customer_id</code> and calculates the total points (<code>points</code>) earned by each customer based on their purchases from the <code>sales</code> and <code>menu</code> tables.</li>
  <li>It retrieves data from the <code>sales</code> table and joins it with the <code>dates_cte</code> CTE using a combination of <code>JOIN</code> and <code>ON</code> clauses.</li>
  <li>The query uses a <code>CASE</code> statement to differentiate between 'sushi' purchases and other products.</li>
  <li>If the product name is 'sushi' or the order date falls within the range of <code>join_date</code> to <code>valid_date</code>, the points are calculated as 2 times 10 times the price of the product.</li>
  <li>Otherwise, for other products, the points are calculated as 10 times the price of the product.</li>
  <li>The <code>SUM</code> function calculates the total points for each customer by adding up the points earned from their purchases.</li>
  <li>Results are grouped by <code>customer_id</code> to get the total points for each customer.</li>
  <li>The query then presents the <code>customer_id</code> and the calculated <code>points</code> for each customer based on their purchases.</li>
  <li>Finally, the results are sorted in ascending order based on the <code>customer_id</code>.</li>
</ul>


<h1><a name="bonusquestionsandsolutions">Bonus Questions & Solutions</a></h1>
<h5>Join All The Things</h5>

```sql
WITH customer_member_status AS (
  SELECT
    s.customer_id,
    s.order_date,
    m.product_name,
    m.price,
    CASE
      WHEN mbr.join_date <= s.order_date THEN 'Y'
      ELSE 'N'
    END AS member
  FROM sales s
  INNER JOIN menu m ON s.product_id = m.product_id
  LEFT JOIN members mbr ON s.customer_id = mbr.customer_id
)
SELECT
  customer_id,
  order_date,
  product_name,
  price,
  member
FROM customer_member_status
ORDER BY
  customer_id,
  member DESC,
  order_date;
```

<h6>Answer:</h6>
<img width="450" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/0229b715-8e39-4489-b2ee-dad0e90f28ae">
<ul>
  <li>The SQL query starts by creating a Common Table Expression (CTE) named <code>customer_member_status</code>.</li>
  <li>Within the CTE, it selects <code>customer_id</code>, <code>order_date</code>, <code>product_name</code>, <code>price</code>, and uses a <code>CASE</code> statement to determine whether the customer is a member ('Y') or not ('N') based on their join date in the <code>members</code> table.</li>
  <li>The <code>sales</code> table is aliased as <code>s</code>, the <code>menu</code> table as <code>m</code>, and the <code>members</code> table as <code>mbr</code>.</li>
  <li>The query performs inner joins between <code>sales</code> and <code>menu</code> tables on matching <code>product_id</code> and left join between <code>sales</code> and <code>members</code> tables on matching <code>customer_id</code>.</li>
  <li>For each row, the <code>CASE</code> statement checks if the <code>join_date</code> from the <code>members</code> table is less than or equal to the <code>order_date</code> from the <code>sales</code> table.</li>
  <li>If true, it assigns 'Y' (member) to the <code>member</code> column, otherwise 'N' (non-member).</li>
  <li>Next, the main query selects the <code>customer_id</code>, <code>order_date</code>, <code>product_name</code>, <code>price</code>, and <code>member</code> from the <code>customer_member_status</code> CTE.</li>
  <li>Results are ordered first by <code>customer_id</code> in ascending order, then by <code>member</code> in descending order (so members appear first), and finally by <code>order_date</code> in ascending order.</li>
  <li>The query presents the final results with the selected columns for each customer, showing whether they are a member or not for each order and sorted accordingly.</li>
</ul>


<h5>Rank All The Things</h5>
<p>Danny needs additional information about the ranking of customer products. However, he specifically requires null ranking values for non-member purchases, as he is not interested in ranking customers who are not yet part of the loyalty program.</p>

```sql
WITH customers_data AS (
    SELECT 
        sales.customer_id, 
        sales.order_date,  
        menu.product_name, 
        menu.price,
        CASE
            WHEN members.join_date > sales.order_date THEN 'N'
            WHEN members.join_date <= sales.order_date THEN 'Y'
            ELSE 'N' 
        END AS member_status
    FROM sales
    LEFT JOIN members ON sales.customer_id = members.customer_id
    INNER JOIN menu ON sales.product_id = menu.product_id
)

SELECT 
    customer_id,
    order_date, 
    product_name, 
    price,
    member_status AS member,
    CASE
        WHEN member_status = 'N' THEN NULL
        ELSE RANK() OVER (PARTITION BY customer_id, member_status ORDER BY order_date)
    END AS ranking
FROM customers_data;
```

<h6>Answer:</h6>
<img width="450" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/5bd2409e-1758-4ea6-87a1-549345b41e84">

<ul>
  <li>The SQL query starts by creating a Common Table Expression (CTE) named <code>customers_data</code>.</li>
  <li>Within the CTE, it selects <code>customer_id</code>, <code>order_date</code>, <code>product_name</code>, <code>price</code>, and uses a <code>CASE</code> statement to determine the <code>member_status</code> based on whether the <code>join_date</code> in the <code>members</code> table is greater, equal, or less than the <code>order_date</code> in the <code>sales</code> table.</li>
  <li>The <code>sales</code> table is aliased as <code>sales</code>, the <code>members</code> table as <code>members</code>, and the <code>menu</code> table as <code>menu</code>.</li>
  <li>The query performs left join between <code>sales</code> and <code>members</code> tables on matching <code>customer_id</code> and inner join between <code>sales</code> and <code>menu</code> tables on matching <code>product_id</code>.</li>
  <li>For each row, the <code>CASE</code> statement checks the <code>join_date</code> from the <code>members</code> table and compares it to the <code>order_date</code> from the <code>sales</code> table, assigning 'Y' if the <code>join_date</code> is less than or equal to the <code>order_date</code> (customer is a member) and 'N' otherwise (non-member).</li>
  <li>Next, the main query selects the <code>customer_id</code>, <code>order_date</code>, <code>product_name</code>, <code>price</code>, and <code>member_status</code> from the <code>customers_data</code> CTE.</li>
  <li>It also uses a <code>CASE</code> statement to calculate the <code>ranking</code> for each customer's orders if they are a member ('Y'). The <code>RANK()</code> function is used with <code>PARTITION BY</code> to partition the ranking within each customer and their membership status and ordered by <code>order_date</code>.</li>
  <li>If the customer is not a member ('N'), the <code>ranking</code> is set to <code>NULL</code>.</li>
  <li>Results are presented with the selected columns and <code>ranking</code> for each customer's orders, showing whether they are a member or not and the order of their orders.</li>
</ul>


  <h1><a name="keyinsights">Key Insights</a></h1>

  <ul>
    <li>Customer Spending: The total amount spent by each customer at Danny's Diner varies widely. Some customers have spent significantly more than others, indicating potential high-value customers or loyal patrons.</li>
    <li>Customer Visits: The number of days each customer visited the restaurant also varies, showing different patterns of customer engagement. Some customers visit frequently, while others may visit less often.</li>
    <li>First Purchases: Understanding the first items purchased by each customer can help Danny identify popular entry items and potentially attract new customers.</li>
    <li>Most Popular Item: The most purchased item on the menu is valuable information for Danny. He can use this insight to optimize inventory management and capitalize on the popularity of the item.</li>
    <li>Personalized Recommendations: Knowing the most popular item for each customer allows Danny to make personalized menu suggestions, enhancing the dining experience for his customers.</li>
    <li>Customer Loyalty: The data about purchases before and after joining the loyalty program helps Danny evaluate the effectiveness of the loyalty program and its impact on customer behavior.</li>
    <li>Bonus Points for New Members: By offering 2x points to new members during their first week, Danny incentivizes more spending, encouraging members to engage more actively with the program.</li>
    <li>Member Points: The points earned by each member can be used to assess their loyalty and potentially offer targeted rewards and promotions.</li>
    <li>Data Visualization: Creating visualizations based on the data and insights can further aid Danny in understanding trends and making data-driven decisions.</li>
    <li>Customer Segmentation: By analyzing customer spending habits, Danny can segment his customer base and tailor marketing strategies accordingly.</li>
    <li>Expanding Membership: Danny can use the insights from this data to refine his loyalty program and attract new members, leveraging the success of the program.</li>
    <li>Inventory Management: Knowing the most popular and least popular items can help Danny optimize his inventory, reduce wastage, and maximize profits.</li>
    <li>Menu Optimization: Danny can use the data to evaluate the performance of different menu items and consider introducing new dishes based on customer preferences.</li>
    <li>Customer Engagement: Analyzing customer behavior can help Danny understand what keeps customers coming back and help him create more engaging experiences.</li>
    <li>Long-Term Growth: By leveraging data analysis, Danny can make informed decisions that contribute to the long-term growth and success of Danny's Diner.</li>
  </ul>








