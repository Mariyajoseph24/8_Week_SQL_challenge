<h1>Case Study #7 - Balanced Tree Clothing Co.👚🧶</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/250dfd81-8ec9-4cb9-9485-f2906223fe46">
<h1>Contents</h1>

<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#entityrelationshipdiagram">Entity Relationship Diagram</a></li>
  <li><a href="#casestudyquestionsandsolutions">Case Study Questions & Solutions</a></li>

<ul>
  <li><a href="#a.highlevelsalesanalysis">A. High Level Sales Analysis</a></li>
  <li><a href="#b.transactionanalysis">B. Transaction Analysis</a></li>
  <li><a href="#c.productanalysis">C. Product Analysis</a></li>

  </ul>

</ul>
<h1><a name="introduction">Introduction</a></h1>
<p>In this case study, we delve into the operations of Balanced Tree Clothing Company, a leading fashion enterprise renowned for curating a meticulously tailored selection of apparel and lifestyle gear designed for contemporary explorers. At the helm is Danny, the visionary CEO, who has enlisted our expertise in scrutinizing their sales accomplishments and creating a fundamental financial synopsis destined to be disseminated across the organization. This analysis offers valuable insights into their business strategies and performance metrics.</p>

<h1><a name="entityrelationshipdiagram"></a>Entity Relationship Diagram</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/79a8e787-9d67-466c-bdb7-9579ec6eb5ee">
<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>
--------------------------------------------------------------------------------------------------------------------------------------------------
<h4><a name="a.highlevelsalesanalysis"></a>A. High Level Sales Analysis</h4>
<ol> 
  <li><h5>What was the total quantity sold for all products?</h5></li>

  ```sql
SELECT COUNT(DISTINCT txn_id) AS unique_transactions
FROM balanced_tree.sales;
```
  <h6>Answer:</h6>
  <img width="150" alt="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/d60c9df0-fb38-4e1d-9c92-e7dc7f614919">
  <ul>
  <li>The SQL query calculates the count of unique transactions from the <code>balanced_tree.sales</code> table.</li>
  <li>The <code>SELECT</code> statement includes the <code>COUNT(DISTINCT txn_id)</code> function to count distinct transaction IDs.</li>
  <li>The result of the query will be the total number of unique transactions present in the <code>sales</code> table.</li>
</ul>

  
  <li><h5>What is the total generated revenue for all products before discounts?</h5></li>

  ```sql
SELECT AVG(avg_unique_products) AS average_unique_products_per_transaction
FROM (
    SELECT txn_id, COUNT(DISTINCT prod_id) AS avg_unique_products
    FROM balanced_tree.sales
    GROUP BY txn_id
) AS unique_products_per_transaction;
```
  <h6>Answer:</h6>
  <img width="150" alt="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/d8304f68-b375-4d7e-b3bf-53031339443b">
  <ul>
  <li>The SQL query calculates the average number of unique products per transaction from the <code>balanced_tree.sales</code> table.</li>
  <li>It achieves this by first creating a subquery that groups the sales data by <code>txn_id</code> and calculates the count of distinct <code>prod_id</code> values for each transaction.</li>
  <li>The outer query then calculates the average of the unique product counts calculated by the subquery using the <code>AVG</code> function.</li>
  <li>The result of the query will provide the average number of unique products per transaction across all transactions in the <code>sales</code> table.</li>
</ul>

  
  <li><h5>What was the total discount amount for all products?</h5></li>

  ```sql
SELECT
  PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY revenue) AS percentile_25th,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY revenue) AS percentile_50th,
  PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY revenue) AS percentile_75th
FROM (
  SELECT
    txn_id,
    SUM(price * qty) AS revenue
  FROM balanced_tree.sales
  GROUP BY txn_id
) AS revenue_cte;
```
  <h6>Answer:</h6>
  <img width="150" alt="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/df7e06f7-f44f-4f60-b77a-b62f74aebf26">
  <ul>
  <li>The SQL query calculates the 25th, 50th (median), and 75th percentiles of revenue per transaction from the <code>balanced_tree.sales</code> table.</li>
  <li>It does this by first creating a subquery named <code>revenue_cte</code>. This subquery groups the sales data by <code>txn_id</code> and calculates the sum of revenue for each transaction using the formula <code>price * qty</code>.</li>
  <li>The main query then uses the <code>PERCENTILE_CONT</code> function to calculate the specified percentiles (25th, 50th, and 75th) of revenue by ordering the aggregated revenue values within the subquery.</li>
  <li>The calculated percentiles are given the aliases <code>percentile_25th</code>, <code>percentile_50th</code> (median), and <code>percentile_75th</code> respectively.</li>
  <li>The result of the query will provide the specified percentiles of revenue per transaction from the sales data.</li>
</ul>
</ol>
-----------------------------------------------------------------------------------------------------------------------------------------------------

