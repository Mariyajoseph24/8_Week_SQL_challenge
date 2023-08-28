WITH CTE AS
(SELECT S.customer_id,M.product_name,COUNT(M.product_id)AS order_count,DENSE_RANK() OVER(PARTITION BY S.customer_id ORDER BY COUNT(S.product_id)DESC) AS rnk
FROM sales S
JOIN menu M ON S.product_id=M.product_id
GROUP BY S.customer_id,M.product_name)

SELECT customer_id,product_name,order_count
FROM CTE
WHERE rnk=1