{{
    config(materialized='view')
}}

SELECT 
    CUSTOMER_ID::VARCHAR AS customer_id
    ,IS_DENTAL::BOOLEAN AS is_dental
    ,FIRST_ORDER_AT::TIMESTAMP AS first_order_at --Duckdb does not support an explicit timestamp_ntz, however this datatype does not include associated time zones 
    ,LIFETIME_GROSS_MERCHANDISE_VALUE::FLOAT AS lifetime_gross_merchandise_value
    ,LIFETIME_ORDERS::INTEGER AS lifetime_orders
FROM {{ ref('seed_customer') }}