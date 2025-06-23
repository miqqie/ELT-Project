WITH category_list AS (
    SELECT
        od.order_id,
        ARRAY_TO_STRING(
            ARRAY_AGG(DISTINCT t.string_field_1 ORDER BY t.string_field_1),
            ', '
        ) AS product_category_names_english_list
    FROM {{ source('brazil_ecommerce', 'olist_order_items_dataset_cleaned') }} od
    LEFT JOIN `rinniedsai.brazil_ecommerce.olist_products_dataset` p
        ON od.product_id = p.product_id
    LEFT JOIN `rinniedsai.brazil_ecommerce.product_category_name_translation` t
        ON p.product_category_name = t.string_field_0
    GROUP BY od.order_id
),

order_item_details AS (
    SELECT
        od.orderid_orderitemid_composite_key,
        od.order_id,
        od.order_item_id,
        od.product_id,
        p.product_category_name,
        t.string_field_1 AS product_category_name_english,
        od.seller_id,
        od.shipping_limit_date,
        od.price,
        od.freight_value,
        od.total_price AS total_price_per_order,
        od.total_freight_value AS total_freight_value_per_order,

        -- Window functions to derive order-level metrics
        MAX(od.order_item_id) OVER (PARTITION BY od.order_id) AS number_of_items_in_order,
        COUNT(DISTINCT od.product_id) OVER (PARTITION BY od.order_id) AS number_of_distinct_products_in_order,
        COUNT(DISTINCT od.seller_id) OVER (PARTITION BY od.order_id) AS number_of_distinct_sellers_in_order,
        COUNT(DISTINCT t.string_field_1) OVER (PARTITION BY od.order_id) AS number_of_distinct_pdt_cat_in_order
    FROM {{ source('brazil_ecommerce', 'olist_order_items_dataset_cleaned') }} od
    LEFT JOIN `rinniedsai.brazil_ecommerce.olist_products_dataset` p
        ON od.product_id = p.product_id
    LEFT JOIN `rinniedsai.brazil_ecommerce.product_category_name_translation` t
        ON p.product_category_name = t.string_field_0
)

SELECT DISTINCT
    oid.orderid_orderitemid_composite_key,
    oid.order_id,
    oid.order_item_id,
    oid.number_of_items_in_order,
    oid.number_of_distinct_products_in_order,
    oid.number_of_distinct_sellers_in_order,
    oid.number_of_distinct_pdt_cat_in_order,
    oid.product_id,
    oid.product_category_name,
    oid.product_category_name_english,
    oid.seller_id,
    oid.shipping_limit_date,
    oid.price,
    oid.freight_value,
    oid.total_price_per_order,
    oid.total_freight_value_per_order,
    cl.product_category_names_english_list
FROM order_item_details oid
LEFT JOIN category_list cl
    ON oid.order_id = cl.order_id
ORDER BY oid.orderid_orderitemid_composite_key
