{{
    config(materialized='view')
}}

SELECT
    ORDER_ID::VARCHAR AS order_id
    ,CUSTOMER_ID::VARCHAR AS customer_id
    ,ORDER_TS::TIMESTAMP AS order_ts
    ,ORDER_DATE::DATE AS order_date
    -- ,order_status::VARCHAR AS order_status 
FROM {{ ref('seed_orders' )}}