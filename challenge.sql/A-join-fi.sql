SELECT
    s.customer_id,
    p.plan_name,
    s.start_date
FROM
    subscriptions s
JOIN
    plans p ON s.plan_id = p.plan_id
ORDER BY
    s.customer_id, s.start_date;
--//Certainly. Here's a brief description of each customer's onboarding journey based on the provided sample data:

1. Customer 1:
   - Started with a trial plan on 2020-08-01.
   - Upgraded to the basic monthly plan on 2020-08-08.

2. Customer 2:
   - Started with a trial plan on 2020-09-20.
   - Upgraded to the pro annual plan on 2020-09-27.

3. Customer 11:
   - Started with a trial plan on 2020-11-19.
   - Downgraded to the churn plan on 2020-11-26.

4. Customer 13:
   - Started with a trial plan on 2020-12-15.
   - Upgraded to the basic monthly plan on 2020-12-22.
   - Upgraded to the pro monthly plan on 2021-03-29.

5. Customer 15:
   - Started with a trial plan on 2020-03-17.
   - Upgraded to the pro monthly plan on 2020-03-24.
   - Downgraded to the churn plan on 2020-04-29.

6. Customer 16:
   - Started with a trial plan on 2020-05-31.
   - Upgraded to the basic monthly plan on 2020-06-07.
   - Upgraded to the pro annual plan on 2020-10-21.

7. Customer 18:
   - Started with a trial plan on 2020-07-06.
   - Upgraded to the pro monthly plan on 2020-07-13.

8. Customer 19:
   - Started with a trial plan on 2020-06-22.
   - Upgraded to the pro monthly plan on 2020-06-29.
   - Upgraded to the pro annual plan on 2020-08-29.

I'll be ready to assist with more questions or queries related to the case study whenever you're ready.//
