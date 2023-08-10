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
  <img width="350" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/d60c9df0-fb38-4e1d-9c92-e7dc7f614919">
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
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/d8304f68-b375-4d7e-b3bf-53031339443b">
  <ul>
  <li>The SQL query calculates the average number of unique products per transaction from the <code>balanced_tree.sales</code> table.</li>
  <li>It achieves this by first creating a subquery that groups the sales data by <code>txn_id</code> and calculates the count of distinct <code>prod_id</code> values for each transaction.</li>
  <li>The outer query then calculates the average of the unique product counts calculated by the subquery using the <code>AVG</code> function.</li>
  <li>The result of the query will provide the average number of unique products per transaction across all transactions in the <code>sales</code> table.</li>
</ul>

  
  <li><h5>What was the total discount amount for all products?</h5></li>

  ```sql
SELECT SUM((price * qty) - (price * qty * (discount / 100))) AS total_discount_amount
FROM balanced_tree.sales;

```
  <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/df7e06f7-f44f-4f60-b77a-b62f74aebf26">
 <ul>
  <li>The SQL query calculates the total discount amount for all sales transactions in the <code>balanced_tree.sales</code> table.</li>
  <li>It achieves this by summing up the discounted amounts for each transaction. The discounted amount for a transaction is calculated as <code>(price * qty) - (price * qty * (discount / 100))</code>.</li>
  <li>Within the formula, <code>price * qty</code> calculates the total price for the transaction before discount, and <code>price * qty * (discount / 100)</code> calculates the discounted amount based on the discount percentage for that transaction.</li>
  <li>The <code>SUM</code> function then aggregates the calculated discounted amounts across all transactions to yield the total discount amount.</li>
  <li>The result of the query provides the total amount saved due to discounts across all sales transactions in the dataset.</li>
</ul>

</ol>
-----------------------------------------------------------------------------------------------------------------------------------------------------
<h4><a name="b.transactionanalysis"></a>A. Transaction Analysis</h4>
<ol>
  <li><h5>How many unique transactions were there?</h5></li>

  ```sql
SELECT COUNT(DISTINCT txn_id) AS unique_transactions
FROM balanced_tree.sales;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/cc690163-b821-44fc-9ef9-8a746836528d">
  
  <li><h5>What is the average unique products purchased in each transaction?</h5></li>

  ```sql
SELECT AVG(avg_unique_products) AS average_unique_products_per_transaction
FROM (
    SELECT txn_id, COUNT(DISTINCT prod_id) AS avg_unique_products
    FROM balanced_tree.sales
    GROUP BY txn_id
) AS unique_products_per_transaction;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/5091ab29-59c4-41aa-9e65-1e9a00de8cae">
  
  <li><h5>What are the 25th, 50th and 75th percentile values for the revenue per transaction?</h5></li>

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
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/2671ea54-3d0f-4ca0-89e0-5abee6c095a7">
  
  <li><h5>What is the average discount value per transaction?</h5></li>

  ```sql
SELECT 
  ROUND(SUM(qty * price * discount/100) / COUNT(DISTINCT txn_id)) AS avg_discount
FROM balanced_tree.sales;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/87f9c13a-d1ff-44cd-8daf-f492264723fd">
  
  <li><h5>What is the percentage split of all transactions for members vs non-members?</h5></li>

  ```sql
SELECT
  CASE
    WHEN member = 't' THEN 'Member'
    WHEN member = 'f' THEN 'Non-Member'
  END AS member_status,
  COUNT(txn_id) AS transaction_count,
  ROUND(100 * COUNT(txn_id) / (SELECT COUNT(txn_id) FROM balanced_tree.sales), 2) AS percentage
FROM balanced_tree.sales
GROUP BY member_status;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/d000e86d-54d4-45d7-af99-d771436f6a77">
  
  <li><h5>What is the average revenue for member transactions and non-member transactions?</h5></li>

  ```sql
SELECT
  CASE
    WHEN member = 't' THEN 'Member'
    WHEN member = 'f' THEN 'Non-Member'
  END AS member_status,
  ROUND(AVG(price * qty), 2) AS avg_revenue
FROM balanced_tree.sales
GROUP BY member_status;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/8a07e238-20f9-4f5a-b392-fb217eb8e3df">

