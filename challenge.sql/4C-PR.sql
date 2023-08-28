WITH orders AS (
    SELECT
    row_number() OVER() AS id
    , C.*
    , pn.pizza_name
       , CASE
            WHEN LENGTH(C.exclusions) = 0 THEN null
            ELSE string_to_array(C.exclusions,',')::int[]
        END exclusion
       , CASE
            WHEN LENGTH(C.extras) = 0 THEN null
            ELSE string_to_array(C.extras,',')::int[]
        END extra
FROM  customer_orders_tempp C
JOIN pizza_names pn
USING(pizza_id)
ORDER BY id, order_id
),

results AS (SELECT
    id
    , order_id
    , pizza_name
    , (
        SELECT 
            string_agg(topping_name, ', ')
        from pizza_toppings pt
        where pt.topping_id IN (SELECT unnest(exclusion) FROM orders o WHERE o.id = orders.id)
    ) exclusions
    , (
        SELECT 
            string_agg(topping_name, ', ')
        from pizza_toppings pt
        where pt.topping_id IN (SELECT unnest(extra) FROM orders o WHERE o.id = orders.id)
    ) extras
    , order_time
FROM orders)

SELECT
    id
    , pizza_name || CASE
        WHEN exclusions IS NULL THEN ''
        ELSE ' - Exclude ' || exclusions
        END || CASE
        WHEN extras IS NULL THEN ''
        ELSE ' - Extras ' || extras
        END order_items
FROM results; 
