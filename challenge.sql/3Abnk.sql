SELECT r.region_name, COUNT(cn.customer_id) AS customers_per_region
FROM regions r
LEFT JOIN customer_nodes cn ON r.region_id = cn.region_id
GROUP BY r.region_name
ORDER BY customers_per_region DESC;
