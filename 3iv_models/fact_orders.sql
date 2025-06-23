SELECT DISTINCT  
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_status,
    round(i.total_price,2) AS total_price,
    round(i.total_freight_value,2) AS total_freight_value,
    round(p.total_payment_value,2) AS total_payment_value  

FROM {{ source('brazil_ecommerce', 'olist_orders_dataset_cleaned') }} AS o
LEFT JOIN `rinniedsai.brazil_ecommerce.olist_customers_dataset` AS c
    ON o.customer_id = c.customer_id
LEFT JOIN `rinniedsai.brazil_ecommerce.olist_order_items_dataset_cleaned` AS i
    ON o.order_id = i.order_id
LEFT JOIN `rinniedsai.brazil_ecommerce.olist_order_payments_dataset_cleaned` AS p
    ON o.order_id = p.order_id
ORDER BY o.order_idER BY o.order_id
