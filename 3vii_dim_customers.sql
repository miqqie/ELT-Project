-- models/dim_customers.sql

SELECT DISTINCT  
    c.customer_id, 
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state,
    g.geolocation_lat AS customer_latitude,
    g.geolocation_lng AS customer_longitude

FROM {{ source('brazil_ecommerce', 'olist_customers_dataset') }} AS c
LEFT JOIN `rinniedsai.brazil_ecommerce.olist_geolocation_dataset_cleaned` AS g
    ON c.customer_zip_code_prefix = g.geolocation_zip_code_prefix
ORDER BY customer_id
