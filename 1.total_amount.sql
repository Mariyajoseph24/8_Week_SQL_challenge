SELECT S.customer_id,SUM(M.price) AS total_amnt
FROM sales S
JOIN menu M ON S.product_id=M.product_id
GROUP BY S.customer_id
ORDER BY customer_id