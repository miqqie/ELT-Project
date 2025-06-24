-- models/dim_payments.sql

SELECT DISTINCT  
    
    op.orderid_paymentseq_composite_key,
    op.order_id ,
    cu.customer_id,
    op.payment_sequential,
    op.payment_type,
    op.payment_installments,
    op.payment_value,
    max(op.payment_sequential) over (partition by op.order_id) as number_of_installments_per_order,
    sum(op.payment_value) over (partition by op.order_id, op.payment_type ) as payment_per_payment_type_per_order
    
    
FROM {{ source('brazil_ecommerce', 'olist_order_payments_dataset_cleaned') }} AS op
LEFT JOIN `rinniedsai.brazil_ecommerce.olist_orders_dataset_cleaned` AS cu
    ON op.order_id = cu.customer_id
ORDER BY orderid_paymentseq_composite_key
