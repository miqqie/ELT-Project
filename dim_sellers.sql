-- models/dim_sellers.sql

SELECT DISTINCT  -- If you're selecting rows and want only unique combinations of all columns
    s.seller_id, 
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,
    g.geolocation_lat AS seller_latitude,
    g.geolocation_lng AS seller_longitude

FROM {{ source('brazil_ecommerce', 'olist_sellers_dataset') }} AS s
LEFT JOIN `rinniedsai.brazil_ecommerce.olist_geolocation_dataset_cleaned` AS g
    ON s.seller_zip_code_prefix = g.geolocation_zip_code_prefix
ORDER BY seller_id