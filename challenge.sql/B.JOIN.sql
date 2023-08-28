WITH customer_member_status AS (
  SELECT
    s.customer_id,
    s.order_date,
    m.product_name,
    m.price,
    CASE
      WHEN mbr.join_date <= s.order_date THEN 'Y'
      ELSE 'N'
    END AS member
  FROM sales s
  INNER JOIN menu m ON s.product_id = m.product_id
  LEFT JOIN members mbr ON s.customer_id = mbr.customer_id
)
SELECT
  customer_id,
  order_date,
  product_name,
  price,
  member
FROM customer_member_status
ORDER BY
  customer_id,
  member DESC,
  order_date;

