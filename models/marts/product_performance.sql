{{
    config(materialized = 'table')
}}

WITh total_revenue AS (
    SELECT
        SUM(gross_marketplace_value) AS total_revenue
    FROM {{ ref('stg_order_items') }}
)

SELECT
    vendor_product_id AS product_id
    ,COUNT(order_id) AS orders_containing
    ,SUM(quantity) AS units_sold 
    ,ROUND(SUM(gross_marketplace_value), 2) AS revenue
    ,ROUND(((SUM(gross_marketplace_value)/(SELECT total_revenue FROM total_revenue))), 2) AS share_of_total_revenue 
FROM 
    {{ ref('stg_order_items') }}
GROUP BY vendor_product_id