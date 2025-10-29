with

green_taxi as (
    select
        *
    from
        {{ source('nyc_tlc', 'green_tripdata_201909') }}
),

final as (
    select
        "VendorID" as vendor_id,
        lpep_pickup_datetime::timestamp as pickup_datetime,
        lpep_dropoff_datetime::timestamp as dropoff_datetime,
        "RatecodeID" as rate_code_id,
        "PULocationID" as pickup_location_id,
        "DOLocationID" as dropoff_location_id,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        ehail_fee,
        improvement_surcharge,
        total_amount,
        payment_type,
        trip_type,
        congestion_surcharge,
        coalesce(store_and_fwd_flag = 'Y', false) as store_and_fwd
    from
        green_taxi
)

select
    *
from
    final
