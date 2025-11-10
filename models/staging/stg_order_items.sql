{{
    config(materialized='view')
}}

SELECT
    ORDER_ID::VARCHAR AS order_id
    ,ORDER_LINE_ITEM_ID::VARCHAR AS order_line_item_id
    ,VENDOR_ID::VARCHAR AS vendor_id
    ,VENDOR_PRODUCT_ID::VARCHAR AS vendor_product_id
    ,QUANTITY::INTEGER AS quantity
    ,GROSS_MARKETPLACE_VALUE::FLOAT AS gross_marketplace_value
FROM {{ ref('seed_order_items') }}