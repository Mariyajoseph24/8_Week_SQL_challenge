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