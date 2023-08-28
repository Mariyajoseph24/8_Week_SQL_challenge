WITH CTE AS
(SELECT S.customer_id,DENSE_RANK() OVER(PARTITION BY S.customer_id ORDER BY S.order_date)AS rn,M.product_name
FROM sales S
JOIN menu M ON S.product_id=M.product_id)

SELECT customer_id,product_name
FROM CTE
WHERE rn=1



