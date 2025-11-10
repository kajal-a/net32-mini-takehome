{{
    config(materialized = 'table')
}}

SELECT 
    order_date
    ,COUNT(order_id) AS orders
    ,COUNT(order_item_id) AS order_items
    ,ROUND(SUM(gross_marketplace_value),2) AS daily_revenue
    ,ROUND(AVG(daily_revenue) OVER (ORDER BY order_date ROWS BETWEEN 7 PRECEDING AND CURRENT ROW),2) AS rev_7d_avg 
FROM 
    {{ ref('fact_order_item') }}
GROUP BY order_date