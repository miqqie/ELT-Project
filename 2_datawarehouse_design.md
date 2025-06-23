The second phase involved the creation of one fact table and 6 dim tables, which were inked using the following snowflake schema:

![schema](https://github.com/user-attachments/assets/67ee2e94-9573-474a-8281-bfcd813aad1e)

The fact table **fact_orders" contain e most **critical data fields that will form a good base for analysis regarding dollar value metrics per customer or per order.**

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
