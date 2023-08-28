SELECT
    im.*,
    map.interest_name AS mapped_interest_name,
    map.interest_summary AS mapped_interest_summary,
    map.created_at AS mapped_created_at,
    map.last_modified AS mapped_last_modified
FROM interest_metrics AS im
LEFT JOIN interest_map AS map ON im.interest_id::VARCHAR = map.id::VARCHAR
WHERE im.interest_id = '21246';
