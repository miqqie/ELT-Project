SELECT DISTINCT
    r.review_id, 
    r.order_id,
    o.customer_id, 
    r.review_score,
    r.review_comment_title,
    r.review_comment_message,
    r.review_creation_date,
    r.review_answer_timestamp,
    DATE_DIFF(r.review_answer_timestamp, r.review_creation_date, DAY) AS days_taken_to_write_review

FROM {{ source('brazil_ecommerce', 'olist_order_reviews_dataset_cleaned') }} AS r
LEFT JOIN `rinniedsai.brazil_ecommerce.olist_orders_dataset_cleaned` AS o
    ON r.order_id = o.order_id
ORDER BY r.review_id