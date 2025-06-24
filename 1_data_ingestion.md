The first phase of the project involved the **ingestion of the Olist Kaggle dataset into BigQuery**, which was done using the following steps:

### a) Create and Set Directory to Work In
- Installed/imported the necessary packages (e.g. `pandas`).
- Created directories to store files locally.
- Set useful options for `pandas`, e.g.:
  - `pd.set_option('display.max_colwidth', None)` to ensure full column content is visible.

### b) Set Up and Download Kaggle Token
- Generated a Kaggle API token (`kaggle.json`) under *Settings* in Kaggle.
- Downloaded the token to the local working directory.

### c) Configure Kaggle and Google Cloud
- Installed/imported required packages for:
  - Downloading from Kaggle (`kaggle`)
  - Uploading to Google Cloud (`google-cloud-storage`, `google-cloud-bigquery`)
- Configured credentials and environment variables for both platforms.

### d) Set Up Key for Google Cloud Service Account
- Created a Google Cloud service account key.
- Downloaded the key JSON file to the local directory.

### e) Grant Storage Bucket Creation and Read Permissions
- Added the necessary permissions to allow:
  - Creation of a Google Cloud Storage bucket.
  - Read access for BigQuery ingestion.

### f) Create the Google Storage Bucket
   - the storage was created using the json file downloaded earlier in d)
     
### g) Download the Kaggle Dataset and Unzip Zipped Folder
   - the zipped file was downloaded via the Kaggle token created in b) and unzipped into the specified local directory
### h) Do some Data Cleaning and Validation
   - the following data cleaning/checks were done to the csv files:

| CSV File                          | Validation / Cleaning Step                                                                                                                             |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **All CSVs**                      | - Trim all string data                                                                                                                                  |
|                                   | - Drop exact duplicate rows (across all columns)                                                                                                       |
|                                   | - Ensure first column contains unique, non-null values (assumed to be primary key)                                                                     |
|                                   | - Convert columns with names containing `"date"`, `"timestamp"`, or `"approved at"` to `datetime`                                                     |
|                                   | - Ensure datetime values fall between **2016 and 2018**, inclusive                                                                                      |
|                                   | - If there are 2+ datetime columns, ensure the **first one contains the earliest date**                                                                |
|                                   | - Ensure all columns with `"price"` or `"value"` in the name are **non-negative**                                                                      |
| `olist_order_reviews_dataset.csv` | - Enclose freeform text in `review_comment_title` and `review_comment_message` columns with double quotes                                               |
| `olist_geolocation_dataset.csv`   | - Validate that `latitude` and `longitude` values fall within Brazil's geographical bounds                                                             |
| `olist_orders_dataset.csv`        | - `delivery_date` must not be earlier than `shipped_date`                                                                                              |
|                                   | - If `order_status` is `"delivered"`, `delivery_date` must **not be null**                                                                            |


Summary Table of the Data Cleanings and Checks 
  | File Name                          | No. of Duplicate Rows | Old Number of Rows | New Number of Rows | Number of Columns Converted to DateTime | Columns Converted to DateTime                                                                 | Assumed Primary Key (First Column) | Primary Key Test: First Column with Nulls | Primary Key Test: First Column with Duplicates | Earliest Date Check Fail Count | Earliest Date Failed Columns                    | Order Delivered Customer Date Earlier Than Shipped Fail Count | Order Delivered Customer Date Null Fail Count | Geolocation Check Fail Count | Negative Value Test |
|------------------------------------|-----------------------|--------------------|--------------------|----------------------------------------|-------------------------------------------------------------------------------------------------|-----------------------------------|-------------------------------------------|-----------------------------------------------------|--------------------------------|-------------------------------------------------|---------------------------------------------------------|---------------------------------------------------|----------------------------|-------------------|
| `olist_orders_dataset.csv`         | 0                     | 99,441             | 99,441             | 5                                      | `order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date` | `order_id`                        | 0                                         | 0                                                   | 166                            | `order_delivered_carrier_date`                    | 23                                                      | 8                                                     | 0                          | 0                 |
| `olist_sellers_dataset.csv`        | 0                     | 3,095              | 3,095              | 0                                      |                                                                                                 | `seller_id`                       | 0                                         | 0                                                   | 0                              |                                                 | 0                                                      | 0                                                     | 0                          | 0                 |
| `olist_order_reviews_dataset.csv`  | 0                     | 99,224             | 99,224             | 2                                      | `review_creation_date, review_answer_timestamp`                                                | `review_id`                       | 0                                         | 814                                                 | 0                              |                                                 | 0                                                      | 0                                                     | 0                          | 0                 |
| `olist_order_payments_dataset.csv` | 0                     | 103,886            | 103,886            | 0                                      |                                                                                                 | `order_id`                        | 0                                         | 4,446                                               | 0                              |                                                 | 0                                                      | 0                                                     | 0                          | 0                 |
| `olist_geolocation_dataset.csv`    | 261,831               | 1,000,163          | 738,332            | 0                                      |                                                                                                 | `geolocation_zip_code_prefix`     | 0                                         | 719,317                                             | 0                              |                                                 | 0                                                      | 27                                                    | 0                          | 0                 |
| `olist_products_dataset.csv`       | 0                     | 32,951             | 32,951             | 0                                      |                                                                                                 | `product_id`                      | 0                                         | 0                                                   | 0                              |                                                 | 0                                                      | 0                                                     | 0                          | 0                 |
| `olist_customers_dataset.csv`      | 0                     | 99,441             | 99,441             | 0                                      |                                                                                                 | `customer_id`                     | 0                                         | 0                                                   | 0                              |                                                 | 0                                                      | 0                                                     | 0                          | 0                 |
| `olist_order_items_dataset.csv`    | 0                     | 112,650            | 112,650            | 1                                      | `shipping_limit_date`                                                                         | `order_id`                        | 0                                         | 13,984                                              | 0                              |                                                 | 0                                                      | 0                                                     | 0                          | 0                 |
| `product_category_name_translation.csv` | 0                  | 71                 | 71                 | 0                                      |                                                                                                 | `product_category_name`           | 0                                         | 0                                                   | 0                              |                                                 | 0                                                      | 0                                                     | 0                          | 0                 |



 - further checks were done on csv files that failed the above tests
   
### i) Upload the CSV Files to the Google Storage Bucket
  - after the files were successfully cleaned, they were uploaded to Google Storage
    
### j) Load the Files from Google Storage to BigQuery
  - last but not least, the files were loaded into Bigquery

### k) Check that Number of Rows Tally Between Bigquery Tables and Local CSV Files
   - this was to ensure all the data have been uploaded successfully onto Bigquery
   - based on this check, all rows from all csv files were loaded successfully

| CSV File                                  | Local Row Count | BigQuery Table                          | BigQuery Row Count | Status   |
|-------------------------------------------|------------------|------------------------------------------|---------------------|----------|
| olist_order_items_dataset_cleaned.csv     | 112,650          | olist_order_items_dataset_cleaned       | 112,650             | ✅ Match |
| olist_sellers_dataset.csv                 | 3,095            | olist_sellers_dataset                   | 3,095               | ✅ Match |
| olist_products_dataset.csv                | 32,951           | olist_products_dataset                  | 32,951              | ✅ Match |
| olist_customers_dataset.csv               | 99,441           | olist_customers_dataset                 | 99,441              | ✅ Match |
| olist_order_payments_dataset_cleaned.csv  | 103,886          | olist_order_payments_dataset_cleaned    | 103,886             | ✅ Match |
| olist_geolocation_dataset_cleaned.csv     | 19,011           | olist_geolocation_dataset_cleaned       | 19,011              | ✅ Match |
| olist_orders_dataset_cleaned.csv          | 99,441           | olist_orders_dataset_cleaned            | 99,441              | ✅ Match |
| product_category_name_translation.csv     | 71               | product_category_name_translation       | 71                  | ✅ Match |
| olist_order_reviews_dataset_cleaned.csv   | 98,110           | olist_order_reviews_dataset_cleaned     | 98,110              | ✅ Match |

For the full code and explanation, please refer to 1i_data_ingestion.ipynb
