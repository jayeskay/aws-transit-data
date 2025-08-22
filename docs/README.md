# NYC TLC Data

## Objective

This project analyzes taxi data from the New York City Taxi & Limousine Commission ("NYC TLC"). Namely, the goal is to understand the volume and duration of trips for the past few years.

## Technology

The following tools are used for this project:

- AWS
    - IAM
    - S3
    - EC2
- Terraform (IaC)
- Airflow
- dbt
- Snowflake

## Processs

### Generation

Data is maintained by the NYC TLC and publicly available on its [website](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page).

### Ingestion

This raw data will be called either via corresponding download URL or AWS CLI to interface with S3 files.

The ingestion process is handled by Airflow hosted on EC2, which will have clearly delineated tasks:

- extract.py
- transform.py
- load.py

### Storage

Datasets are uploaded as partitioned .parquet files to S3:

- Green Taxi Data: *green/rides_[YYYYMM].parquet*
- Yellow Taxi Data: *yellow/rides_[YYYYMM].parquet*

### Transformation

The only transformation performed within Airflow is that of standardizing columns to snake case.

Additional transformations are done in dbt.

For coal consumption (see *dbt/nyc_tlc/models/stage/stg__green.sql*):

```sql
select
    *,
    'green' as source
from
    raw.green_taxi_trips
where
    dropoff_location is not null
```

### Destination

Raw data staged in S3 is pulled into the `raw` schema in Redshift, where it will then be housed in a staging model before reaching the final model.

dbt models result in the creation of tables or views housed in Redshift, as follows:

- `stage`
    - stg__green
    - stg__yellow
- `final`
    - nyc_taxi_rides

## Analysis

The average trip distance and cost across both green and yellow rides is calculated in the final model, as is the cost (in USD) per kilometer.
