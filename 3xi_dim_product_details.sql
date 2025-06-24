SELECT DISTINCT 
    
    p.product_id,
    p.product_category_name,
    t.string_field_1 AS product_category_name_english,
    p.product_name_lenght AS product_name_length,
    p.product_description_lenght AS product_description_length,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
        
FROM {{ source('brazil_ecommerce', 'olist_products_dataset') }} as p
LEFT JOIN `rinniedsai.brazil_ecommerce.product_category_name_translation` as t
  ON p.product_category_name = t.string_field_0
ORDER BY p.product_id
