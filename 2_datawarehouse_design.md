The second phase involved the conceptualization of one fact table and 6 dim tables, which were inked using the following snowflake schema:

![schema](https://github.com/user-attachments/assets/67ee2e94-9573-474a-8281-bfcd813aad1e)

The fact table **fact_orders** contain the most **critical data fields that will form a good base for analysis regarding dollar value metrics per customer or per order.**

### 🧾 Fact Table: `fact_orders`

| **Column Name**            | **Description**                                                                                            |
| -------------------------- | ---------------------------------------------------------------------------------------------------------- |
| `order_id`                 | Primary key of the fact table.                                                                             |
| `customer_id`              | Foreign key to the dim_customers table                      |
| `customer_unique_id`       | Useful for calculating metrics like rice, freight, payment per customer.                      |
| `order_purchase_timestamp` | Timestamp of when the order was placed. Useful for time-based aggregation.                                |
| `order_delivered_customer_date` | Timestamp of when order was delivered. Useful for time-based aggregation |
| `order_status`             | Status of the order (e.g., delivered, canceled). Useful for calculating revenue based on delivered orders. |
| `total_price`              | Total value of the items in the order (excluding freight). Calculated in the preliminary data cleaning earlier.                                                |
| `total_freight_value`      | Total freight cost associated with the order. Calculated in the preliminary data cleaning earlier.                                                              |
| `total_payment_value`      | Total transaction value associated with the order.  Calculated in the preliminary data cleaning earlier.                                                            |

The dim tables, which are the **descriptive companions** to the fact table by providing context to the measurable facts are as follows:

### 🧾 Dimension Table: `dim_delivery_milestones`

| Column Name               | Description                                                                                          |
|---------------------------|------------------------------------------------------------------------------------------------------|
| `order_id`                | Primary key for this table and foreign key to the fact table                                                                        |
| `order_status`       | Status of the order|
| `order_purchase_timestamp` | Timestamp of when the order was placed
| `order_approved_at`       | Payment approval timestamp|
| `order_delivered_carrier_date`| Order posting timestamp                                                   |
| `order_delivered_customer_date`| Actual order delivery date                                 |
| `order_estimated_delivery_date ` | Estimated delivery date that was informed to customer                                                                |
| `invalid_carrier_delivery`     | Column to indicate whether order_delivered_carrier_date was made null becuase it was earlier than  order_purchase_timestamp in the raw data    

### 🧾 Dimension Table: `dim_order_details`
| Column Name                         | Description                                                                                           |
| ----------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `orderid_orderitemid_composite_key` | Primary key for this dim table                                                                        |
| `order_id`                          | Foreign key to the fact table                                                                         |
| `order_item_id`                     | Sequential number identifying number of items included in the same order                              |
| `product_id`                        | Foreign key to dim\_product\_details                                                                  |
| `product_category_name`             | Root category of product, in Portuguese                                                               |
| `product_category_name_english`     | Category name in English                                                                              |
| `seller_id`                         | Foreign key to dim\_sellers                                                                           |
| `shipping_limit_date`               | Shows the seller shipping limit date for handling the order over to the logistic partner              |
| `price`                             | Item price                                                                                            |
| `freight_value`                     | Item freight value item (if an order has more than one item the freight value is split between items) |

### 🧾 Dimension Table: `dim_customers`

| Column Name               | Description                                                                                          |
|---------------------------|------------------------------------------------------------------------------------------------------|
| `customer_id`                |	Primary key for this table and foreign key to the fact table. An customer id generated for every order.                                                                       |
| `customer_unique_id `       | Unique customer ID|
| `customer_zip_code_prefix`| First five digits of customer zip code                                                 |
| `customer_city` | Customer City |
| `customer_state  ` | Customer State|
| `geolocation_lat` | Latitude of the customer's location                                |
| `geolocation_lng`     | Longitude of the customer's location |

### 🧾 Dimension Table: `dim_sellers`

| **Column Name**          | **Description**                      |
| ------------------------ | ------------------------------------ |
| `seller_id`              | Primary key of this table            |
| `seller_zip_code_prefix` | First five digits of seller zip code |
| `seller_city`            | Seller city                          |
| `seller_state`           | Seller state                         |
| `geolocation_lat`        | Latitude of the seller's location    |
| `geolocation_lng`        | Longitude of the seller's location   |

### 🧾 Dimension Table: `dim_reviews`

| Column Name               | Description                                                                                          |
|---------------------------|------------------------------------------------------------------------------------------------------|
| `review_id`                | Primary key of this table                                                                       |
| `order_id `       | Foreign key to the fact table |
| `customer_id`       | Foreign key to dim_customers  |
| `review_score`| Score ranging from 1 to 5 given by the customer on a satisfaction survey                                                 |
| `review_comment_title ` | Comment title from the review left by the customer, in Portuguese. |
| `review_comment_message` | Comment message from the review left by the customer, in Portuguese |
| `review_creation_date` | Shows the date in which the satisfaction survey was sent to the customer.                                |
| `review_answer_timestamp`     | Shows satisfaction survey answer timestamp |

### 🧾 Dimension Table: `dim_payments`

| Column Name               | Description                                                                                          |
|---------------------------|------------------------------------------------------------------------------------------------------|
| `orderid_paymentseq_composite_key` | Primary key of this table                                 |
| `order_id`                | Foreign key to the fact table                                                                        |
| `customer_id` | Foreign key to dim_customer |
| `payment_sequential `       | A customer may pay an order with more than one payment method. If he does so, a sequence will be created to accommodate all payments|
| `payment_type`| Method of payment chosen by the customer                                                 |
| `payment_installments` | Number of installments chosen by the customer |
| `payment_value` | Transaction value|

### 🧾 Dimension Table: `dim_product_details`

| Column Name               | Description                                                                                          |
|---------------------------|------------------------------------------------------------------------------------------------------|
| `product_id`                | Primary key for this table and foreign key to dim_order_details                                                                        |
| `product_category_name` | Root category of product, in Portuguese |
| `product_category_name_english` | Category name in English
| `product_name_lenght`       | Number of characters extracted from the product name|
| `product_description_lenght`| Number of characters extracted from the product description.                                                 |
| `product_photos_qty` | Number of product published photos |
| `product_weight_g` | Product weight measured in grams|
| `product_length_cm` | Product length measured in centimeters                                 |
| `product_height_cm` | Product height measured in centimeters                                |
| `product_width_cm` | Product width measured in centimeters                                |

Additional new columns will be added to the tables when data transformation is performed in the next phase.
