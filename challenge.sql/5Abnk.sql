WITH date_diff_cte AS (
    SELECT
        cn.region_id,
        end_date - start_date AS node_dys
    FROM
        customer_nodes cn
    WHERE
        end_date != '9999-12-31'
)
SELECT
    r.region_name,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY node_dys) AS median,
    PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY node_dys) AS percentile_80,
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY node_dys) AS percentile_95
FROM
    date_diff_cte d
JOIN
    regions r ON d.region_id = r.region_id
GROUP BY
    r.region_name;
