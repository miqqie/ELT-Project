### Data Validation 

After running **dbt run** to create the eight SQL tables successfully, **dbt_utils and dbt_expectations were installed**. And the next step was to update the **schema.yml** to define the relationship between and to perform validation checks.

The relationship definition and validation checks are grouped into these following categories:

1) Defining the **primary keys** and ensuring that they are **unique and non-null**,
2) Defining the **foreign keys**,
3) Checks that certain data fields are **at least of/below a certain value** (dbt_utils),
4) Checks that **relationships (e.g. =, >=) between certain columns hold** (dbt_utils),
5) Checks that values are **not null based on certain conditions** (dbt_expectations)

In total, there were a **total of 37 tests**. 

Please refer to 4i_schema.yml for the full code.

**dbt test** was run and a total of 1 tests failed. The test that failed was:

1. Sum of total price and total freight value should equate to total payment value of the order when delivery status is "delivered" (569)

![Screenshot 2025-06-22 221443](https://github.com/user-attachments/assets/6b9a5340-456b-4565-a6bf-4d7e59adcf93)

But given the relatively small number out of about 99000 orders, these rows can be dropped during the data analysis section.

The full set of tests can be found in 4ii_schema.yml
