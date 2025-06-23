![Flowchart_1drawio.drawio.png](attachment:fd8248b8-2ad1-46c7-9d63-8f0f3ce6f6e5.png)

The first phase of the project involved the **ingestion of the Olist Kaggle dataset into Bigquery** , which was done using the following steps:
>  a) Create and Set Directory to Work In 
> <br> b) Set Up and Download Kaggle Token 
> <br> c) Configure Kaggle and Google Cloud
> <br> d) Set Up Key for Service Account in Google Cloud Storage 
> <br> e) Grant Storage Bucket Creation and Read Permission 
> <br> f) Create the Google Storage Bucket 
> <br> g) Download the Kaggle Dataset and Unzip Zipped Folder
> <br> h) Do some Data Cleaning and Validation
> <br> i) Upload the CSV Files to the Google Storage Bucket
> <br> j) Load the Files from Google Storage to BigQuery
> <br> k) Check that Number of Rows Tally Between BIgquery Tables and Local CSV Files
