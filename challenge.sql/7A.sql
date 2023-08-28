SELECT
    im.*,
    im.month_year AS interest_metrics_month_year,
    map.created_at AS interest_map_created_at
FROM
    interest_metrics AS im
LEFT JOIN
    interest_map AS map
ON
    im.interest_id = map.id::varchar
WHERE
    im.month_year < map.created_at
ORDER BY
    im.interest_id, im.month_year;
