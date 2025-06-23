-- models/dim_delivery_milestones.sql

SELECT DISTINCT  
    order_id,
    order_status,
    order_purchase_timestamp, 
    order_approved_at,     
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,
    DATE_DIFF(order_delivered_carrier_date , order_purchase_timestamp, DAY) AS days_taken_to_ship,
    DATE_DIFF(order_delivered_customer_date , order_purchase_timestamp, DAY) AS days_taken_to_deliver,
    DATE_DIFF(order_delivered_customer_date, order_delivered_carrier_date, DAY) AS days_taken_to_deliver_after_shipping,
    DATE_DIFF(date(order_delivered_customer_date), order_estimated_delivery_date, DAY ) AS difference_in_day_btw_act_and_est_delivery,
    invalid_carrier_delivery,  
    CASE
        WHEN DATE_DIFF(date(order_delivered_customer_date), order_estimated_delivery_date, DAY ) > 0 THEN 'Y'
        ELSE 'N'
    END AS is_delivery_later_than_estimated

FROM {{ source('brazil_ecommerce', 'olist_orders_dataset_cleaned') }} 
ORDER BY order_id
