The first phase of the project involved the **ingestion of the Olist Kaggle dataset into Bigquery** , which was done using the following steps:
>  a) Create and Set Directory to Work In 
> <br> b) Set Up and Download Kaggle Token - the necessary packages were installed or imported, and the respective 
> <br> c) Configure Kaggle and Google Cloud
> <br> d) Set Up Key for Service Account in Google Cloud Storage - the service account Key for Google was created and downloaded into the local directory
> <br> e) Grant Storage Bucket Creation and Read Permission 
> <br> f) Create the Google Storage Bucket 
> <br> g) Download the Kaggle Dataset and Unzip Zipped Folder
> <br> h) Do some Data Cleaning and Validation
> <br> i) Upload the CSV Files to the Google Storage Bucket
> <br> j) Load the Files from Google Storage to BigQuery
> <br> k) Check that Number of Rows Tally Between Bigquery Tables and Local CSV Files
