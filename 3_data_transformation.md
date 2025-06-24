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
i) dim_delivery_milestones
4 new fields calculating the difference in the number of days between important delivery milestones were also created. In addition, a binary variable ("Y"/"N") was also created for easy identification of later-than-expected deliveries.
