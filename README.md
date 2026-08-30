# sql-data-warehouse-project
# SQL Data Warehouse Project #

A modern SQL-based Data Warehouse project designed to consolidate, clean, transform, and analyze data from multiple source systems.

## Project Overview ##

The goal of this project is to build a centralized data warehouse that transforms raw data into clean, structured, and analysis-ready information.

The project follows a layered architecture:

Bronze Layer – Stores raw data from source systems.
Silver Layer – Cleans, standardizes, and transforms the raw data.
Gold Layer – Contains business-ready data models optimized for analytics and reporting.
*Technologies Used*
SQL
SQL Server / PostgreSQL
Git & GitHub
DBeaver / SSMS / pgAdmin
Power BI (if applicable)


## ETL / ELT Process ##
1. Extract

Raw data is collected from different source systems such as:

CSV files
Transactional databases
External data sources
2. Transform

The raw data is cleaned and transformed using SQL operations such as:

Removing duplicate records
Handling missing values
Standardizing data types
Cleaning inconsistent values
Creating calculated fields
Applying business rules
Validating data quality
3. Load

The transformed data is loaded into the appropriate data warehouse tables for analytical use.

## Bronze Layer ##

The Bronze Layer stores data in its raw form.

Characteristics
Raw source data
Minimal transformation
Preserves source-system structure
Acts as the foundation for downstream processing

Example:

SELECT *
FROM bronze.sales;

##Silver Layer##

The Silver Layer contains cleaned and standardized data.

Typical transformations include:

Data cleansing
Deduplication
NULL handling
Data type conversion
Standardization
Business-rule implementation

Example:

SELECT
    customer_id,
    TRIM(customer_name) AS customer_name,
    LOWER(email) AS email
FROM bronze.customers
WHERE customer_id IS NOT NULL;

## Gold Layer ##

The Gold Layer contains business-ready data optimized for reporting and analytics.

The data is modeled using a Star Schema consisting of fact and dimension tables.


## Author##

## Sanjeev Yadav##

GitHub:SanjeevYadav31
LinkedIn: 
### License ###

This project is licensed under the MIT License. See the LICENSE file for details.
