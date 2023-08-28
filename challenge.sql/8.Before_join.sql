SELECT S.customer_id,
	COUNT(S.product_id) AS total_item,
	SUM(M.price) AS total_amont
FROM sales S
JOIN menu M ON S.product_id=M.product_id
JOIN members ME ON S.customer_id=ME.customer_id
WHERE S.order_date<ME.join_date
GROUP BY S.customer_id
ORDER BY S.customer_id