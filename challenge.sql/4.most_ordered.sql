SELECT M.product_name,COUNT(S.product_id)AS most_ordered
FROM Sales S
JOIN menu M ON S.product_id=M.product_id
GROUP BY M.product_name
ORDER BY most_ordered DESC
LIMIT 1
