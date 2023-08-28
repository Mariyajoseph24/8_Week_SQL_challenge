SELECT to_char(registration_date::date, 'ww')::int AS weeks
	  , COUNT(runner_id)AS signed_runner_week
FROM runners
GROUP BY 1
ORDER BY 1;
