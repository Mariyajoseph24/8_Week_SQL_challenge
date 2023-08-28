SELECT r.region_name, COUNT(cn.node_id) AS nodes_per_region
FROM regions r
LEFT JOIN customer_nodes cn ON r.region_id = cn.region_id
GROUP BY r.region_name
ORDER BY nodes_per_region DESC;
