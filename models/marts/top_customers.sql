{{
    config(materialized = 'table')
}}

WITH latest_order AS (
    SELECT
        c.customer_id
        ,MAX(o.order_date) AS last_order_date
    FROM 
        {{ ref('stg_customers') }} c
    INNER JOIN 
        {{ ref('stg_orders') }} o 
    ON 
        c.customer_id = o.customer_id 
    GROUP BY 
        c.customer_id
)
SELECT 
    c.customer_id
    ,lo.last_order_date
    ,lifetime_orders AS orders
    ,lifetime_gross_merchandise_value AS revenue
FROM 
    {{ ref('stg_customers') }} c
INNER JOIN 
    latest_order lo
ON 
    c.customer_id = lo.customer_id
ORDER BY 
    c.lifetime_gross_merchandise_value desc
LIMIT 5