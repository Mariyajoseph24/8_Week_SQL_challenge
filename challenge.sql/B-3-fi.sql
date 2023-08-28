SELECT
    p.plan_name,
	p.plan_id,
    COUNT(*) AS event_count
FROM
    subscriptions s
JOIN
    plans p ON s.plan_id = p.plan_id
WHERE
    s.start_date > '2020-12-31' -- Filter for start dates after 2020
GROUP BY
    p.plan_name, p.plan_id
ORDER BY
    p.plan_name, p.plan_id;
