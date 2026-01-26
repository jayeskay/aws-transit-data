with

import_green_taxi as (

    select * from {{ source('nyc_tlc', 'green_tripdata_201909') }}

),

final as (

    select
        -- ids
        "VendorID" as vendor_id,
        "RatecodeID" as rate_code_id,
        "PULocationID" as pickup_location_id,
        "DOLocationID" as dropoff_location_id,

        -- strings
        'green' as taxi_type,

        -- numerics
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

        -- booleans
        coalesce(store_and_fwd_flag = 'Y', false) as is_store_and_forward,

        -- dates
        -- (none)

        -- timestamps
        lpep_pickup_datetime::timestamp as pickup_at,
        lpep_dropoff_datetime::timestamp as dropoff_at

    from
        import_green_taxi

)

select * from final
