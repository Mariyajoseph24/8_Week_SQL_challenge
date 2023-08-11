<h1>Case Study #4 - Data Bank🏦</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/867ebe85-c6d4-4b54-8ae4-c0f172ff9511">
<h1>Contents</h1>

<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#entityrelationshipdiagram">Entity Relationship Diagram</a></li>
  <li><a href="#casestudyquestionsandsolutions">Case Study Questions & Solutions</a></li>

<ul>
  <li><a href="#a.customernodesexploration">A. Customer Nodes Exploration</a></li>
  <li><a href="#b.customertransactions">B. Customer Transactions</a></li>

  </ul>
  
  
</ul>
<h1><a name="introduction">Introduction</a></h1>
<p>Welcome to an enthralling journey into the world of finance, innovation, and data convergence. In this captivating case study project, we immerse ourselves in the realm of Neo-Banks, the trailblazing digital financial entities revolutionizing the industry landscape by eliminating physical branches. Our focus zooms in on an ingenious visionary named Danny, whose aspirations transcend the ordinary, leading to the inception of a remarkable initiative – "Data Bank."<br>

Within the fabric of this narrative lies a compelling fusion of Neo-Banking, cryptocurrency, and cutting-edge data management. The birth of Data Bank signifies a paradigm shift where the contours of digital banking intertwine seamlessly with the frontiers of secure distributed data storage.<br>

The essence of Data Bank mirrors that of traditional digital banks, albeit with an unprecedented twist. Not confined merely to financial transactions, this avant-garde establishment boasts the accolade of harboring the world's most impregnable distributed data storage platform. As we delve deeper, a unique interplay emerges – customers' cloud data storage allotments are intricately tied to their financial standing. Yet, the intricacies of this symbiotic relationship beckon us to explore further.<br>

Our protagonist, Data Bank, has set its sights on twin goals: expanding its customer base and, concurrently, gaining insights to navigate the data storage landscape. It is in this intricate tapestry of aspirations that we invite you, the analytical trailblazers, to join hands with the Data Bank team.<br>

This case study project is an expedition into the realms of metric calculation, growth strategy formulation, and incisive data-driven insights. As collaborators in this journey, we wield the tools of analysis to forecast and shape future developments. The canvas before us is one of intricate calculation, strategic expansion, and data-driven foresight. Embark on this expedition as we decipher the chronicles of Data Bank's evolution, where innovation intersects with pragmatism, and where data illuminates the path forward.</p>

<h1><a name="entityrelationshipdiagram"></a>Entity Relationship Diagram</h1>
<img width="500" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/7680ae3b-6426-4753-8ca8-e38e183a9649">
<h1><a name="casestudyquestionsandsolutions"></a>Case Study Questions & Solutions</h1>

<h4><a name="a.customernodesexploration"></a>A. Customer Nodes Exploration👥</h4>
<ol> 
  <li><h5>How many unique nodes are there on the Data Bank system?</h5></li>

  ```sql
SELECT COUNT(DISTINCT node_id) AS unique_nodes_count
FROM customer_nodes;
```
  <h6>Answer:</h6>
<img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/4f307419-c5ca-4671-b9b9-0b1774af66a2">
<ul>
  <li>The SQL query calculates the count of distinct node IDs in the <code>customer_nodes</code> table, representing unique nodes.</li>
  <li>The <code>COUNT(DISTINCT node_id)</code> function calculates the count of distinct values in the <code>node_id</code> column of the <code>customer_nodes</code> table.</li>
  <li>As a result, the query presents the count of unique node IDs in the <code>customer_nodes</code> table.</li>
</ul>

  
  <li><h5>What is the number of nodes per region?</h5></li>

  ```sql
SELECT r.region_name, COUNT(DISTINCT cn.node_id) AS nodes_per_region
FROM regions r
LEFT JOIN customer_nodes cn ON r.region_id = cn.region_id
GROUP BY r.region_name
ORDER BY nodes_per_region DESC;
```
  <h6>Answer:</h6>
<img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/46faabc1-a5ac-4602-bb3d-7d05309b85f9">
<ul>
  <li>The SQL query retrieves the count of distinct nodes per region from the <code>regions</code> and <code>customer_nodes</code> tables.</li>
  <li>The <code>SELECT</code> statement selects the <code>region_name</code> and the count of distinct <code>node_id</code> values for each region.</li>
  <li>The <code>LEFT JOIN</code> clause joins the <code>regions</code> table with the <code>customer_nodes</code> table using the <code>region_id</code> as the common column.</li>
  <li>The <code>GROUP BY r.region_name</code> clause groups the results by <code>region_name</code> to calculate the count of distinct nodes for each region.</li>
  <li>The <code>ORDER BY nodes_per_region DESC</code> clause orders the results in descending order based on the count of nodes per region.</li>
  <li>As a result, the query presents the region names and the corresponding count of distinct nodes per region, ordered by the count of nodes in descending order.</li>
</ul>


  <li><h5>How many customers are allocated to each region?</h5></li>

  ```sql
SELECT r.region_name, COUNT(cn.customer_id) AS customers_per_region
FROM regions r
LEFT JOIN customer_nodes cn ON r.region_id = cn.region_id
GROUP BY r.region_name
ORDER BY customers_per_region DESC;
```
  <h6>Answer:</h6>
<img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/c923bb35-38f7-47f3-90b3-449c77ec9119">
<ul>
  <li>The SQL query retrieves the count of customers per region from the <code>regions</code> and <code>customer_nodes</code> tables.</li>
  <li>The <code>SELECT</code> statement selects the <code>region_name</code> and the count of distinct <code>customer_id</code> values for each region.</li>
  <li>The <code>LEFT JOIN</code> clause joins the <code>regions</code> table with the <code>customer_nodes</code> table using the <code>region_id</code> as the common column.</li>
  <li>The <code>GROUP BY r.region_name</code> clause groups the results by <code>region_name</code> to calculate the count of customers for each region.</li>
  <li>The <code>ORDER BY customers_per_region DESC</code> clause orders the results in descending order based on the count of customers per region.</li>
  <li>As a result, the query presents the region names and the corresponding count of customers per region, ordered by customer count in descending order.</li>
</ul>


  <li><h5>How many days on average are customers reallocated to a different node?</h5></li>

  ```sql
WITH CTE AS
(SELECT customer_id, 
    node_id,
    end_date - start_date AS node_dys
FROM customer_nodes
WHERE end_date != '9999-12-31'
  GROUP BY customer_id, node_id, start_date, end_date),
  
CTE2 AS
(
  SELECT customer_id,node_id,
    SUM(node_dys) AS total_node
  FROM CTE
  GROUP BY customer_id, node_id)
  
SELECT ROUND(AVG(total_node)) AS avg_n
FROM CTE2;
```
  <h6>Answer:</h6>
<img width="100" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/19421d2b-c6ba-4b2c-8a0d-5ba5b829bd7c">
<ul>
  <li>The SQL query calculates the average total number of days that each customer-node combination was active, based on data from the <code>customer_nodes</code> table.</li>
  <li>The <code>CTE</code> (Common Table Expression) named <code>CTE</code> is defined to calculate the number of days each customer-node combination was active. It calculates the difference between the <code>end_date</code> and <code>start_date</code> columns and renames it as <code>node_dys</code>. The <code>WHERE end_date != '9999-12-31'</code> condition filters out records with the default end date.</li>
  <li>The <code>CTE2</code> is defined to calculate the total number of days each customer-node combination was active. It sums the <code>node_dys</code> values for each customer-node combination using the <code>SUM(node_dys)</code> function.</li>
  <li>The main query calculates the rounded average of the <code>total_node</code> values using the <code>AVG(total_node)</code> function and renames it as <code>avg_n</code>.</li>
  <li>As a result, the query presents the rounded average total number of days that each customer-node combination was active, based on the data from the <code>CTE2</code> and <code>customer_nodes</code> tables.</li>
</ul>


  <li><h5>What is the median, 80th and 95th percentile for this same reallocation days metric for each region?</h5></li>

  ```sql
WITH date_diff_cte AS (
    SELECT
        cn.region_id,
        end_date - start_date AS node_dys
    FROM
        customer_nodes cn
    WHERE
        end_date != '9999-12-31'
)
SELECT
    r.region_name,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY node_dys) AS median,
    PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY node_dys) AS percentile_80,
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY node_dys) AS percentile_95
FROM
    date_diff_cte d
JOIN
    regions r ON d.region_id = r.region_id
GROUP BY
    r.region_name;
```
  <h6>Answer:</h6>
<img width="300" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/e427f376-a3bb-4a95-8426-9f3c29253d85">
<ul>
  <li>The SQL query calculates statistical percentiles of node active durations for each region based on data from the <code>customer_nodes</code> and <code>regions</code> tables.</li>
  <li>The <code>WITH</code> clause defines a Common Table Expression (CTE) named <code>date_diff_cte</code> that calculates the difference in days between <code>end_date</code> and <code>start_date</code> for each active node. The condition <code>end_date != '9999-12-31'</code> filters out records with the default end date.</li>
  <li>The main query selects the <code>region_name</code> column from the <code>regions</code> table and calculates the statistical percentiles within groups of node active durations for each region.</li>
  <li>The <code>PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY node_dys)</code> calculates the median, <code>PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY node_dys)</code> calculates the 80th percentile, and <code>PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY node_dys)</code> calculates the 95th percentile of node active durations for each region.</li>
  <li>The <code>JOIN</code> clause joins the <code>date_diff_cte</code> CTE with the <code>regions</code> table using the <code>region_id</code> as the common column.</li>
  <li>The <code>GROUP BY r.region_name</code> groups the results by <code>region_name</code> to present the statistical percentiles of node active durations for each region.</li>
  <li>As a result, the query presents the region names along with the median, 80th percentile, and 95th percentile of node active durations, calculated using data from the <code>date_diff_cte</code> CTE and the <code>regions</code> table.</li>
</ul>
</ol>

<h4><a name="b.customertransactions"></a>B. Customer Transactions💸</h4>
<ol>
  <li><h5>What is the unique count and total amount for each transaction type?</h5></li>
  
  ```sql
  SELECT
  txn_type AS transaction_type, 
  COUNT(customer_id) AS tn_cnt, 
  SUM(txn_amount) AS ttl_amnt
FROM customer_transactions
GROUP BY txn_type;
```

  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/37083c14-2d5f-4348-b57f-c6e966e1e2f0">
  <ul>
  <li>The SQL query calculates transaction statistics based on data from the <code>customer_transactions</code> table.</li>
  <li>The <code>SELECT</code> statement selects three columns: <code>txn_type</code> as <code>transaction_type</code>, <code>COUNT(customer_id)</code> as <code>tn_cnt</code> (transaction count), and <code>SUM(txn_amount)</code> as <code>ttl_amnt</code> (total amount).</li>
  <li>The <code>GROUP BY txn_type</code> clause groups the results by <code>txn_type</code> to calculate statistics for each transaction type.</li>
  <li>The <code>COUNT(customer_id)</code> calculates the count of transactions for each transaction type.</li>
  <li>The <code>SUM(txn_amount)</code> calculates the total amount of transactions for each transaction type.</li>
  <li>As a result, the query presents the transaction types, the count of transactions, and the total transaction amount for each transaction type.</li>
</ul>

  
  <li><h5>What is the average total historical deposit counts and amounts for all customers?</h5></li>

  ```sql
WITH CTE AS (
  SELECT 
    customer_id, 
    COUNT(customer_id) AS cnt, 
    AVG(txn_amount) AS avg_amnt
  FROM customer_transactions
  WHERE txn_type = 'deposit'
  GROUP BY customer_id
)

SELECT 
  ROUND(AVG(cnt)) AS count_avgcnt, 
  ROUND(AVG(avg_amnt)) AS amt_avgcnt
FROM CTE;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/c5c51199-03b7-4b4a-98c4-e1468f19b7ba">
  <ul>
  <li>The SQL query calculates average statistics based on deposit transactions for each customer using data from the <code>customer_transactions</code> table.</li>
  <li>The <code>WITH</code> clause defines a Common Table Expression (CTE) named <code>CTE</code> that calculates the count of deposit transactions and the average transaction amount for each customer. The condition <code>txn_type = 'deposit'</code> filters the transactions to consider only deposits.</li>
  <li>The <code>GROUP BY customer_id</code> clause groups the results by <code>customer_id</code> to calculate statistics for each customer.</li>
  <li>The main query calculates the rounded average count of deposit transactions and the rounded average of average transaction amounts using the <code>AVG(cnt)</code> and <code>AVG(avg_amnt)</code> functions from the <code>CTE</code>.</li>
  <li>As a result, the query presents the rounded average count of deposit transactions and the rounded average of average transaction amounts for all customers.</li>
</ul>

  
  <li><h5>For each month - how many Data Bank customers make more than 1 deposit and either 1 purchase or 1 withdrawal in a single month?</h5></li>

  ```sql
WITH monthly_transactions AS (
  SELECT 
    customer_id, 
    DATE_TRUNC('month', txn_date) AS transaction_month,
    SUM(CASE WHEN txn_type = 'deposit' THEN 0 ELSE 1 END) AS deposit_count,
    SUM(CASE WHEN txn_type = 'withdrawal' THEN 0 ELSE 1 END) AS purchase_count,
	SUM(CASE WHEN txn_type = 'withdrawal' THEN 1 ELSE 0 END) AS withdrawal_count
  FROM customer_transactions
  GROUP BY customer_id,  DATE_TRUNC('month', txn_date)
)

SELECT
  transaction_month AS mth,
  COUNT(DISTINCT customer_id) AS customer_count
FROM monthly_transactions
WHERE deposit_count > 1 
  AND (purchase_count >= 1 OR withdrawal_count >= 1)
GROUP BY transaction_month
ORDER BY transaction_month;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/77b52eee-048e-48ee-961b-007d1889b868">
  <ul>
  <li>The SQL query analyzes monthly transaction patterns for customers based on data from the <code>customer_transactions</code> table.</li>
  <li>The <code>WITH</code> clause defines a Common Table Expression (CTE) named <code>monthly_transactions</code> that aggregates transactions for each customer per month. It calculates the count of deposit transactions, purchase transactions, and withdrawal transactions for each customer in each month using conditional aggregations.</li>
  <li>The <code>GROUP BY customer_id, DATE_TRUNC('month', txn_date)</code> clause groups the results by <code>customer_id</code> and the truncated <code>transaction_month</code> to calculate statistics for each customer in each month.</li>
  <li>The main query selects the <code>transaction_month</code> column as <code>mth</code> and calculates the count of distinct customers with the specified conditions using the <code>COUNT(DISTINCT customer_id)</code> function.</li>
  <li>The <code>WHERE</code> clause filters the results to consider only months with more than one deposit transaction and at least one purchase or withdrawal transaction.</li>
  <li>The <code>GROUP BY transaction_month</code> clause groups the results by <code>transaction_month</code> to analyze monthly patterns.</li>
  <li>The <code>ORDER BY transaction_month</code> sorts the results by the <code>transaction_month</code> in ascending order.</li>
  <li>As a result, the query presents the months along with the count of distinct customers who meet the specified transaction conditions for each month.</li>
</ul>

  
  <li><h5>What is the closing balance for each customer at the end of the month?</h5></li>

  ```sql
WITH customer_monthly_balances AS (
  SELECT
    customer_id,
    DATE_TRUNC('month', txn_date) AS transaction_month,
    SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE 0 END) -
    SUM(CASE WHEN txn_type IN ('purchase', 'withdrawal') THEN txn_amount ELSE 0 END) AS closing_balance
  FROM customer_transactions
  GROUP BY customer_id, transaction_month
)

SELECT
  customer_id,
  transaction_month,
  closing_balance
FROM customer_monthly_balances
ORDER BY customer_id, transaction_month;
```
  <h6>Answer:</h6>
  <img width="250" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/f186a8cc-c39c-450f-8ff7-a22ab1af9a1e">
  <ul>
  <li>The SQL query calculates monthly closing balances for customers based on data from the <code>customer_transactions</code> table.</li>
  <li>The <code>WITH</code> clause defines a Common Table Expression (CTE) named <code>customer_monthly_balances</code> that aggregates transactions for each customer per month. It calculates the closing balance by subtracting the sum of purchase and withdrawal amounts from the sum of deposit amounts for each customer in each month.</li>
  <li>The <code>GROUP BY customer_id, DATE_TRUNC('month', txn_date)</code> clause groups the results by <code>customer_id</code> and the truncated <code>transaction_month</code> to calculate the closing balance for each customer in each month.</li>
  <li>The main query selects the <code>customer_id</code>, <code>transaction_month</code>, and <code>closing_balance</code> columns from the <code>customer_monthly_balances</code> CTE.</li>
  <li>The <code>ORDER BY customer_id, transaction_month</code> sorts the results by <code>customer_id</code> and <code>transaction_month</code> in ascending order.</li>
  <li>As a result, the query presents the customer IDs, transaction months, and closing balances for each customer based on monthly transaction data.</li>
</ul>

  
  <li><h5>What is the percentage of customers who increase their closing balance by more than 5%?</h5></li>

  ```sql
WITH customer_monthly_balances AS (
  SELECT
    customer_id,
    DATE_TRUNC('month', txn_date) AS transaction_month,
    SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE 0 END) -
    SUM(CASE WHEN txn_type IN ('purchase', 'withdrawal') THEN txn_amount ELSE 0 END) AS closing_balance
  FROM customer_transactions
  GROUP BY customer_id, transaction_month
)
SELECT
  ROUND(
    (COUNT(*) FILTER (WHERE closing_balance_increase > 5) * 100.0) / COUNT(*),
    2
  ) AS percentage_increase
FROM (
  SELECT
    customer_id,
    transaction_month,
    closing_balance,
    LAG(closing_balance) OVER (PARTITION BY customer_id ORDER BY transaction_month) AS prev_balance,
    (closing_balance - LAG(closing_balance) OVER (PARTITION BY customer_id ORDER BY transaction_month)) * 100.0 / NULLIF(LAG(closing_balance) OVER (PARTITION BY customer_id ORDER BY transaction_month), 0) AS closing_balance_increase
  FROM customer_monthly_balances
) AS balance_changes;
```
  <h6>Answer:</h6>
  <img width="150" alt="Coding" src="https://github.com/Mariyajoseph24/8_Week_SQL_challenge/assets/91487663/8d50573d-cad8-422e-8898-582213158273">
  <ul>
  <li>The SQL query calculates the percentage increase in closing balances for customers based on monthly transaction data from the <code>customer_transactions</code> table.</li>
  <li>The <code>WITH</code> clause defines a Common Table Expression (CTE) named <code>customer_monthly_balances</code> that aggregates transactions for each customer per month and calculates the closing balance difference.</li>
  <li>The main query calculates the percentage increase by using a series of calculations and filters on the results from the <code>customer_monthly_balances</code> CTE.</li>
  <li>Within the main query, the <code>LAG</code> window function is used to retrieve the previous month's closing balance for each customer.</li>
  <li>The calculated <code>closing_balance_increase</code> represents the percentage increase in closing balance for each month, considering the previous month's balance.</li>
  <li>The <code>FILTER</code> condition filters the results to consider only rows where <code>closing_balance_increase</code> is greater than 5%.</li>
  <li>The main query then calculates the percentage of customers with a closing balance increase greater than 5% by dividing the count of such customers by the total count of customers and multiplying by 100.</li>
  <li>The <code>ROUND</code> function is used to round the percentage to two decimal places.</li>
  <li>As a result, the query presents the percentage increase in closing balances for customers with an increase greater than 5% based on monthly transaction data.</li>
</ul>
</ol>




