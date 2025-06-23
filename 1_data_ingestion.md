The first phase of the project involved the **ingestion of the Olist Kaggle dataset into Bigquery** , which was done using the following steps:
>  a) Create and Set Directory to Work In
   - the necessary packages were installed or imported (e.g. Pandas)
   - the respective directories to store files were also created
   - certain options for Pandas were also set (e.g. pd.set_option('display.max_colwidth', None) which allows the viewing of all columns without the df being truncated)
> <br> b) Set Up and Download Kaggle Token
   - a token (kaggle.json) was created under "Settings" in Kaggle and then downloaded into the local directory
> <br> c) Configure Kaggle and Google Cloud
> <br> d) Set Up Key for Service Account in Google Cloud Storage - the service account Key for Google was created and downloaded into the local directory
> <br> e) Grant Storage Bucket Creation and Read Permission 
> <br> f) Create the Google Storage Bucket 
> <br> g) Download the Kaggle Dataset and Unzip Zipped Folder
> <br> h) Do some Data Cleaning and Validation
> <br> i) Upload the CSV Files to the Google Storage Bucket
> <br> j) Load the Files from Google Storage to BigQuery
> <br> k) Check that Number of Rows Tally Between Bigquery Tables and Local CSV Files
