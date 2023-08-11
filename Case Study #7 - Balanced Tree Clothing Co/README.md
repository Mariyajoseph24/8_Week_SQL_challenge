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

<h4><a name="b.transactionanalysis"></a>B. Transaction Analysis</h4>
<ol>
  <li><h5>How many unique transactions were there?</h5></li>

  ```sql
SELECT COUNT(DISTINCT txn_id) AS unique_transactions
FROM balanced_tree.sales;
```
  <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/cc690163-b821-44fc-9ef9-8a746836528d">
  <ul>
  <li>The SQL query calculates the number of unique transactions in the <code>balanced_tree.sales</code> table.</li>
  <li>It uses the <code>COUNT(DISTINCT txn_id)</code> aggregation function to count the distinct values of the <code>txn_id</code> column, which represents unique transactions.</li>
  <li>The result of the query provides the count of unique transactions present in the sales dataset.</li>
</ul>

  
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
  <ul>
  <li>The SQL query calculates the average number of unique products per transaction in the <code>balanced_tree.sales</code> table.</li>
  <li>It uses a subquery to calculate the count of distinct <code>prod_id</code> values for each <code>txn_id</code>, which represents the unique products in each transaction.</li>
  <li>The outer query then calculates the average of the counts obtained from the subquery, providing the average number of unique products per transaction.</li>
  <li>The result of the query gives insight into the average diversity of products bought per transaction.</li>
</ul>

  
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
  <ul>
  <li>The SQL query calculates the 25th, 50th (median), and 75th percentiles of revenue per transaction in the <code>balanced_tree.sales</code> table.</li>
  <li>It uses a common table expression (CTE) named <code>revenue_cte</code> to calculate the total revenue for each <code>txn_id</code> by summing the product of <code>price</code> and <code>qty</code>.</li>
  <li>The main query then applies the <code>PERCENTILE_CONT</code> function to calculate the desired percentiles (<code>0.25</code>, <code>0.5</code>, and <code>0.75</code>) of the calculated revenue values.</li>
  <li>The results provide insights into the distribution of revenue across transactions, with the median being the 50th percentile.</li>
</ul>

  
  <li><h5>What is the average discount value per transaction?</h5></li>

  ```sql
SELECT 
  ROUND(SUM(qty * price * discount/100) / COUNT(DISTINCT txn_id)) AS avg_discount
FROM balanced_tree.sales;
```
  <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/87f9c13a-d1ff-44cd-8daf-f492264723fd">
  <ul>
  <li>The SQL query calculates the average discount per transaction in the <code>balanced_tree.sales</code> table.</li>
  <li>It calculates the total discount amount for each transaction by multiplying the <code>qty</code>, <code>price</code>, and <code>discount</code> columns and then dividing by 100.</li>
  <li>The main query uses the <code>SUM</code> function to calculate the sum of all the calculated discount amounts and then divides it by the total number of distinct <code>txn_id</code> values using the <code>COUNT</code> function.</li>
  <li>The result is the average discount per transaction, rounded using the <code>ROUND</code> function.</li>
</ul>

  
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
  <ul>
  <li>The SQL query categorizes transactions into two groups based on the <code>member</code> column: 'Member' and 'Non-Member'.</li>
  <li>The <code>CASE</code> statement is used to transform the 't' and 'f' values in the <code>member</code> column into more meaningful labels.</li>
  <li>The <code>COUNT</code> function calculates the number of transactions for each member status category.</li>
  <li>The main query calculates the percentage of transactions for each member status category out of the total number of transactions in the <code>balanced_tree.sales</code> table.</li>
  <li>The subquery <code>(SELECT COUNT(txn_id) FROM balanced_tree.sales)</code> calculates the total number of transactions in the table.</li>
  <li>The result is the member status ('Member' or 'Non-Member'), the transaction count for each category, and the percentage of transactions represented by each category, rounded to two decimal places using the <code>ROUND</code> function.</li>
</ul>

  
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
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/8a07e238-20f9-4f5a-b392-fb217eb8e3df">
  <ul>
  <li>The SQL query categorizes transactions into two groups based on the <code>member</code> column: 'Member' and 'Non-Member'.</li>
  <li>The <code>CASE</code> statement is used to transform the 't' and 'f' values in the <code>member</code> column into more meaningful labels.</li>
  <li>The <code>ROUND</code> function calculates the average revenue for each member status category by multiplying the <code>price</code> and <code>qty</code> columns and then rounding the result to two decimal places.</li>
  <li>The <code>GROUP BY</code> clause groups the results by the transformed member status.</li>
  <li>The result displays the member status ('Member' or 'Non-Member') and the average revenue for each category.</li>
</ul>
</ol>

<h4><a name="c.productanalysis"></a>C. Product Analysis</h4>
<ol>
  <li><h5>What are the top 3 products by total revenue before discount?</h5></li>

  ```sql
SELECT
  pd.product_id,
  pd.product_name,
  SUM(s.price * s.qty) AS total_revenue_before_discount
FROM balanced_tree.product_details pd
JOIN balanced_tree.sales s ON pd.product_id = s.prod_id
GROUP BY pd.product_id, pd.product_name
ORDER BY total_revenue_before_discount DESC
LIMIT 3;
```
  <h6>Answer:</h6>
  <img width="350" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/39878e7a-2ac0-4556-902e-59150c27d466">
  <ul>
  <li>The SQL query retrieves product-specific information along with the total revenue generated from sales before any discounts.</li>
  <li>The <code>balanced_tree.product_details</code> table is joined with the <code>balanced_tree.sales</code> table using the <code>product_id</code> and <code>prod_id</code> columns.</li>
  <li>The <code>SUM</code> function calculates the total revenue for each product by multiplying the <code>price</code> and <code>qty</code> columns from the sales table.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>product_id</code> and <code>product_name</code>.</li>
  <li>The <code>ORDER BY</code> clause arranges the results in descending order of total revenue before discount.</li>
  <li>The <code>LIMIT</code> clause limits the output to the top 3 products with the highest total revenue before discount.</li>
  <li>The result displays the product ID, product name, and total revenue generated from sales for the top 3 products.</li>
</ul>

  
  <li><h5>What is the total quantity, revenue and discount for each segment?</h5></li>

  ```sql
SELECT
  pd.segment_name,
  SUM(s.qty) AS total_quantity,
  SUM(s.price * s.qty) AS total_revenue,
  SUM(s.qty * s.price * s.discount / 100) AS total_discount
FROM balanced_tree.product_details pd
JOIN balanced_tree.sales s ON pd.product_id = s.prod_id
GROUP BY pd.segment_name
ORDER BY total_revenue DESC;
```
  <h6>Answer:</h6>
  <img width="350" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/69bff982-0bdc-4627-85cc-1859a2cdd4b3">
  <ul>
  <li>The SQL query retrieves information about product segments, along with aggregated data on total quantity sold, total revenue generated, and total discounts applied.</li>
  <li>The <code>balanced_tree.product_details</code> table is joined with the <code>balanced_tree.sales</code> table using the <code>product_id</code> and <code>prod_id</code> columns.</li>
  <li>The <code>SUM</code> function calculates the total quantity sold (<code>qty</code>), total revenue generated by multiplying <code>price</code> and <code>qty</code>, and total discount amount by considering <code>qty</code>, <code>price</code>, and <code>discount</code> columns from the sales table.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>segment_name</code> from the <code>product_details</code> table.</li>
  <li>The <code>ORDER BY</code> clause arranges the results in descending order of total revenue.</li>
  <li>The result displays the product segment name, total quantity sold, total revenue generated, and total discount amount for each segment.</li>
</ul>

  
  <li><h5>What is the total quantity, revenue and discount for each segment?</h5></li>

  ```sql
WITH top_selling_products AS (
  SELECT
    pd.segment_id,
    pd.segment_name,
    pd.product_id,
    pd.product_name,
    SUM(s.qty) AS total_quantity,
    ROW_NUMBER() OVER (PARTITION BY pd.segment_id ORDER BY SUM(s.qty) DESC) AS rank
  FROM balanced_tree.product_details pd
  JOIN balanced_tree.sales s ON pd.product_id = s.prod_id
  GROUP BY pd.segment_id, pd.segment_name, pd.product_id, pd.product_name
)
SELECT
  segment_id,
  segment_name,
  product_id,
  product_name,
  total_quantity
FROM top_selling_products
WHERE rank = 1;
```
  <h6>Answer:</h6>
  <img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/252751a7-9870-4e24-8596-e9f31c939c79">
  <ul>
  <li>The SQL query calculates and presents information about the top-selling products within each product segment.</li>
  <li>The query starts by creating a Common Table Expression (CTE) named <code>top_selling_products</code>.</li>
  <li>The <code>balanced_tree.product_details</code> table is joined with the <code>balanced_tree.sales</code> table using the <code>product_id</code> and <code>prod_id</code> columns.</li>
  <li>The <code>SUM</code> function calculates the total quantity sold (<code>qty</code>) for each product within a segment.</li>
  <li>The <code>ROW_NUMBER()</code> window function is used with the <code>OVER</code> clause to assign a rank to each product within its corresponding segment based on total quantity sold. The <code>PARTITION BY</code> clause ensures that the ranking is done separately for each segment.</li>
  <li>The main query selects columns <code>segment_id</code>, <code>segment_name</code>, <code>product_id</code>, <code>product_name</code>, and <code>total_quantity</code> from the <code>top_selling_products</code> CTE.</li>
  <li>The <code>WHERE</code> clause filters the results to include only rows with a rank of 1, representing the top-selling product within each segment.</li>
  <li>The result displays the segment ID, segment name, product ID, product name, and total quantity sold for the top-selling product within each segment.</li>
</ul>

  
  <li><h5>What is the total quantity, revenue and discount for each category?</h5></li>

  ```sql
SELECT
  pd.category_id,
  pd.category_name,
  SUM(s.qty) AS total_quantity,
  SUM(s.qty * s.price) AS total_revenue,
  SUM(s.qty * s.price * s.discount / 100) AS total_discount
FROM balanced_tree.product_details pd
JOIN balanced_tree.sales s ON pd.product_id = s.prod_id
GROUP BY pd.category_id, pd.category_name;
```
  <h6>Answer:</h6>
  <img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/1e8f3e66-fc2f-4683-9e7c-d2647c4d7aa5">
  <ul>
  <li>The SQL query calculates and presents aggregated information about product categories based on sales data.</li>
  <li>The query starts by selecting the <code>category_id</code> and <code>category_name</code> columns from the <code>balanced_tree.product_details</code> table.</li>
  <li>The <code>SUM</code> function is used to calculate the total quantity sold (<code>qty</code>) and the total revenue earned (<code>qty * price</code>) for each product category.</li>
  <li>The formula <code>qty * price * discount / 100</code> is used to calculate the total discount amount for each product category, and the result is summed using the <code>SUM</code> function.</li>
  <li>The <code>JOIN</code> clause connects the <code>balanced_tree.product_details</code> table with the <code>balanced_tree.sales</code> table using the <code>product_id</code> and <code>prod_id</code> columns.</li>
  <li>The <code>GROUP BY</code> clause groups the results by <code>category_id</code> and <code>category_name</code>.</li>
  <li>The query calculates the total quantity, total revenue, and total discount for each product category.</li>
  <li>The <code>ORDER BY</code> clause sorts the results by total revenue in descending order.</li>
  <li>The query presents the results, including the <code>category_id</code>, <code>category_name</code>, total quantity sold, total revenue earned, and total discount amount for each product category.</li>
</ul>

  
  <li><h5>What is the top selling product for each category?</h5></li>

  ```sql
WITH top_selling_cte AS (
  SELECT 
    pd.category_id,
    pd.category_name,
    pd.product_id,
    pd.product_name,
    SUM(s.qty) AS total_quantity,
    RANK() OVER (
      PARTITION BY pd.category_id 
      ORDER BY SUM(s.qty) DESC) AS ranking
  FROM balanced_tree.product_details pd
  JOIN balanced_tree.sales s ON pd.product_id = s.prod_id
  GROUP BY 
    pd.category_id, pd.category_name, pd.product_id, pd.product_name
)

SELECT 
  category_id,
  category_name, 
  product_id,
  product_name,
  total_quantity
FROM top_selling_cte
WHERE ranking = 1;
```
  <h6>Answer:</h6>
  <img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/0b773687-a43d-474c-a678-bcfb8a5ea6b8">
  <ul>
  <li>The SQL query aims to identify the top-selling products within each product category based on sales data.</li>
  <li>The query starts by creating a Common Table Expression (CTE) named <code>top_selling_cte</code>.</li>
  <li>Within the CTE, the query selects relevant columns such as <code>category_id</code>, <code>category_name</code>, <code>product_id</code>, and <code>product_name</code> from the <code>balanced_tree.product_details</code> table.</li>
  <li>The <code>SUM</code> function calculates the total quantity sold (<code>qty</code>) for each product and is grouped by <code>category_id</code>, <code>category_name</code>, <code>product_id</code>, and <code>product_name</code>.</li>
  <li>The <code>RANK()</code> window function assigns a ranking to products within each product category, ordering them by total quantity sold in descending order.</li>
  <li>The <code>PARTITION BY</code> clause divides the data into partitions based on <code>category_id</code>, ensuring that ranking is done within each category.</li>
  <li>The main query selects columns from the CTE, including <code>category_id</code>, <code>category_name</code>, <code>product_id</code>, <code>product_name</code>, and <code>total_quantity</code>.</li>
  <li>The <code>WHERE</code> clause filters the results to include only rows where the product has the highest ranking (ranking = 1) within its category.</li>
  <li>The query presents the top-selling products within each product category, displaying the <code>category_id</code>, <code>category_name</code>, <code>product_id</code>, <code>product_name</code>, and total quantity sold for each product.</li>
</ul>

  
  <li><h5>What is the percentage split of revenue by product for each segment?</h5></li>

  ```sql
WITH segment_revenue AS (
  SELECT 
    p.segment_id,
    p.segment_name,
    s.prod_id,
    p.product_name,
    SUM(s.price * s.qty) AS total_revenue
  FROM balanced_tree.sales s
  JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
  GROUP BY 
    p.segment_id, p.segment_name, s.prod_id, p.product_name
)

SELECT 
  sr.segment_id,
  sr.segment_name,
  sr.prod_id,
  sr.product_name,
  sr.total_revenue,
  ROUND(100 * sr.total_revenue / SUM(sr.total_revenue) OVER (PARTITION BY sr.segment_id), 2) AS revenue_percentage
FROM segment_revenue sr;
```
  <h6>Answer:</h6>
  <img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/bd54b95f-87e0-4f0d-bf47-01764452f2ec">
  <ul>
  <li>The SQL query calculates the revenue distribution percentage of each product within its corresponding segment based on sales data.</li>
  <li>The query begins by defining a Common Table Expression (CTE) named <code>segment_revenue</code>.</li>
  <li>Within the CTE, the query selects columns such as <code>segment_id</code>, <code>segment_name</code>, <code>prod_id</code>, <code>product_name</code>, and the total revenue (<code>total_revenue</code>) for each product.</li>
  <li>The <code>SUM</code> function calculates the total revenue by multiplying the price and quantity for each product, and the results are grouped by <code>segment_id</code>, <code>segment_name</code>, <code>prod_id</code>, and <code>product_name</code>.</li>
  <li>The main query selects columns from the <code>segment_revenue</code> CTE, including <code>segment_id</code>, <code>segment_name</code>, <code>prod_id</code>, <code>product_name</code>, and <code>total_revenue</code>.</li>
  <li>The <code>ROUND</code> function is used to calculate the revenue percentage of each product within its segment.</li>
  <li>The percentage is calculated as the total revenue of the product divided by the total revenue of all products within the same segment, then multiplied by 100.</li>
  <li>The <code>SUM(total_revenue)</code> is calculated over a window partitioned by <code>segment_id</code>, ensuring that the percentage is calculated for each segment separately.</li>
  <li>The calculated revenue percentage is displayed as <code>revenue_percentage</code>.</li>
  <li>The query presents the segment-wise revenue distribution for each product, showing the <code>segment_id</code>, <code>segment_name</code>, <code>prod_id</code>, <code>product_name</code>, total revenue, and the revenue percentage.</li>
</ul>

  
  <li><h5>What is the percentage split of revenue by segment for each category?</h5></li>

  ```sql
WITH category_segment_revenue AS (
  SELECT 
    p.category_id,
    p.category_name,
    p.segment_id,
    p.segment_name,
    SUM(s.price * s.qty) AS total_revenue
  FROM balanced_tree.sales s
  JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
  GROUP BY 
    p.category_id, p.category_name, p.segment_id, p.segment_name
)

SELECT 
  csr.category_id,
  csr.category_name,
  csr.segment_id,
  csr.segment_name,
  csr.total_revenue,
  ROUND(100 * csr.total_revenue / SUM(csr.total_revenue) OVER (PARTITION BY csr.category_id), 2) AS revenue_percentage
FROM category_segment_revenue csr;
```
  <h6>Answer:</h6>
  <img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/a63327f5-9ef1-421b-bd34-02f2b66d4c55">
  <ul>
  <li>The SQL query calculates the revenue distribution percentage of each segment within its corresponding category based on sales data.</li>
  <li>The query begins by defining a Common Table Expression (CTE) named <code>category_segment_revenue</code>.</li>
  <li>Within the CTE, the query selects columns such as <code>category_id</code>, <code>category_name</code>, <code>segment_id</code>, <code>segment_name</code>, and the total revenue (<code>total_revenue</code>) for each segment within its category.</li>
  <li>The <code>SUM</code> function calculates the total revenue by multiplying the price and quantity for each sale, and the results are grouped by <code>category_id</code>, <code>category_name</code>, <code>segment_id</code>, and <code>segment_name</code>.</li>
  <li>The main query selects columns from the <code>category_segment_revenue</code> CTE, including <code>category_id</code>, <code>category_name</code>, <code>segment_id</code>, <code>segment_name</code>, and <code>total_revenue</code>.</li>
  <li>The <code>ROUND</code> function is used to calculate the revenue percentage of each segment within its category.</li>
  <li>The percentage is calculated as the total revenue of the segment divided by the total revenue of all segments within the same category, then multiplied by 100.</li>
  <li>The <code>SUM(total_revenue)</code> is calculated over a window partitioned by <code>category_id</code>, ensuring that the percentage is calculated for each category separately.</li>
  <li>The calculated revenue percentage is displayed as <code>revenue_percentage</code>.</li>
  <li>The query presents the category-wise revenue distribution for each segment, showing the <code>category_id</code>, <code>category_name</code>, <code>segment_id</code>, <code>segment_name</code>, total revenue, and the revenue percentage.</li>
</ul>

  
  <li><h5>What is the percentage split of total revenue by category?</h5></li>

  ```sql
WITH category_revenue AS (
  SELECT 
    p.category_id,
    p.category_name,
    SUM(s.price * s.qty) AS total_revenue
  FROM balanced_tree.sales s
  JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
  GROUP BY 
    p.category_id, p.category_name
)

SELECT 
  cr.category_id,
  cr.category_name,
  cr.total_revenue,
  ROUND(100 * cr.total_revenue / SUM(cr.total_revenue) OVER (), 2) AS revenue_percentage
FROM category_revenue cr;
```
  <h6>Answer:</h6>
  <img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/5d77fb91-fd64-4e31-9c49-14cd69e5fa28">
  <ul>
  <li>The SQL query calculates the revenue distribution percentage for each category based on sales data and product details.</li>
  <li>The query begins by defining a Common Table Expression (CTE) named <code>category_revenue</code>.</li>
  <li>Within the CTE, the query selects columns such as <code>category_id</code>, <code>category_name</code>, and the total revenue (<code>total_revenue</code>) for each category.</li>
  <li>The <code>SUM</code> function calculates the total revenue by multiplying the price and quantity for each sale, and the results are grouped by <code>category_id</code> and <code>category_name</code>.</li>
  <li>The main query selects columns from the <code>category_revenue</code> CTE, including <code>category_id</code>, <code>category_name</code>, and <code>total_revenue</code>.</li>
  <li>The <code>ROUND</code> function is used to calculate the revenue percentage of each category.</li>
  <li>The percentage is calculated as the total revenue of the category divided by the overall total revenue, then multiplied by 100.</li>
  <li>The <code>SUM(total_revenue)</code> is calculated over the entire result set using the <code>OVER ()</code> clause, ensuring that the percentage is calculated based on the total revenue across all categories.</li>
  <li>The calculated revenue percentage is displayed as <code>revenue_percentage</code>.</li>
  <li>The query presents the revenue distribution for each category, showing the <code>category_id</code>, <code>category_name</code>, total revenue, and the revenue percentage.</li>
</ul>
</ol>
  

