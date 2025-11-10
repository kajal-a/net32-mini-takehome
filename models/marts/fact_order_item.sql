{{
    config(
        materialized = 'incremental'
        ,unique_key = 'order_item_id'
        ,incremental_strategy = 'delete+insert'
    )
}}

SELECT
    oi.order_line_item_id AS order_item_id
    ,o.order_id
    ,o.order_date
    ,c.customer_id
    ,oi.quantity
    ,oi.gross_marketplace_value
FROM 
    {{ ref('stg_order_items') }} AS oi 
INNER JOIN 
    {{ ref('stg_orders') }} AS o
ON 
    oi.order_id = o.order_id
INNER JOIN 
    {{ ref('stg_customers') }} AS c
ON 
    o.customer_id = c.customer_id
{% if is_incremental() %}
WHERE o.order_date >= (select max(order_date) from {{ this }}) 
{% endif %}