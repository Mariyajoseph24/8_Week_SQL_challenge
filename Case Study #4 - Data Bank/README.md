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
  <li><a href="#c.dataallocationchallenge">C. Data Allocation Challenge</a></li>
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
--------------------------------------------------------------------------------------------------------------------------------------------------------------
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
