The first phase of the project involved the **ingestion of the Olist Kaggle dataset into Bigquery** , which was done using the following steps:
>  a) Create and Set Directory to Work In
   - the necessary packages were installed or imported (e.g. Pandas)
   - the respective directories to store files were also created
   - certain options for Pandas were also set (e.g. pd.set_option('display.max_colwidth', None) which allows the viewing of all columns without the df being truncated)
> <br> b) Set Up and Download Kaggle Token
   - a token (kaggle.json) was created under "Settings" in Kaggle and then downloaded into the local directory
> <br> c) Configure Kaggle and Google Cloud
   - the necessary packaged were installed or imported for the downloading of data from Kaggle and oploading to Google Storage/Biquery (e.g Kaggle, google-cloud-bigquery google-cloud-storage)
   - Kaggle and Google Cloud configurations were set
> <br> d) Set Up Key for Service Account in Google Cloud Storage -
   - the service account Key for Google was created and downloaded into the local directory
> <br> e) Grant Storage Bucket Creation and Read Permission
   - required permissions were added to allow for the creation of a cloud storage bucket for which the data will be stored and read access. 
> <br> f) Create the Google Storage Bucket 
> <br> g) Download the Kaggle Dataset and Unzip Zipped Folder
> <br> h) Do some Data Cleaning and Validation
> <br> i) Upload the CSV Files to the Google Storage Bucket
> <br> j) Load the Files from Google Storage to BigQuery
> <br> k) Check that Number of Rows Tally Between Bigquery Tables and Local CSV Files

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
