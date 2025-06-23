The second phase involved the creation of one fact table and 6 dim tables, which were inked using the following snowflake schema:

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

