SELECT DISTINCT ON (s.customer_id)
		s.customer_id,
       m.product_name
FROM sales s
JOIN members mbr ON s.customer_id = mbr.customer_id
JOIN menu m ON s.product_id = m.product_id
WHERE s.order_date < mbr.join_date
ORDER BY s.customer_id;