After creating the schema, we will be implementing this using DBT (Data Build Tool), which is an open-source framework for transforming and modeling data within a data warehouse. The main steps are as follows:

> 1. Initiate a DBT project using **dbt init**. This will create the necessary directory structure, configuration files, and sample models for the project.
> 2. Check the **dbt_project_yml** is referencing to the correct dataset in BigQuery.
> 3. Create a **profiles.yml** which store the configuration settings for your database connections, which includes connection details like:
  <br> a. Database type (e.g., Snowflake, Postgres, BigQuery, etc.)
> <br> b. Credentials (username etc.)
> <br> c. Host, port, schema, and database details
> <br> d. Target configurations (e.g., development, production environments)
> <br> e. Connection parameters specific to the data warehouse
> 4. Under the models subfolder, create a **sources.yml** that will contain all the names and locations of the raw tables in BigQuery referenced in the fact and dim tables.
> 5. Run **dbt_debug** to test the connection to the raw tables
> 6. Create sql to make the fact and dim tables

Besides the original data fields, various new data fields were created to facilitate data analysis later.

a) fact_orders
<br> fact_orders was created by joining data fields from 4 raw tables

b) dim_delivery_milestones
<br> 4 new fields calculating the difference in the number of days between important delivery milestones were also created. In addition, a binary variable ("Y"/"N") was also created for easy identification of later-than-expected deliveries.

c) dim_order_details
<br> Besides obtaining the original data fields by joining the raw tables, we also created a few new data fields that sum **certain data by order** (e.g. number of items per order). 

d) dim_customers
<br> The dim table was created by joining data from 2 raw tables to facilitate geo-location analysis.

e) dim_sellers
<br> The dim table was created by joining data from 2 raw tables to facilitate geo-location analysis.

f) dim_reviews
<br> The dim table was created by joining data from 2 raw tables. One new data field to calculate the difference in the number of days between the 2 review-related date columns was added.

g) dim_payments
<br> The dim table was created by joining data from 2 raw tables. Two new data fields were created to facilitate analysis per order.

h) dim_product_details
<br> The dim table was created by joining data from 2 raw tables.

Please refer to the respective sql tables for more information.
