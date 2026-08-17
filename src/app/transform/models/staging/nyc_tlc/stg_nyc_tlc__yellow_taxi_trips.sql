with

source as (

    select * from {{ source('nyc_tlc', 'yellow_tripdata_201909') }}

),

renamed as (

    select

        ---------- ids
        "VendorID" as vendor_id,
        "RatecodeID" as rate_code_id,
        "PULocationID" as pickup_location_id,
        "DOLocationID" as dropoff_location_id,

        ---------- strings
        'yellow' as taxi_type,

        ---------- numerics
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        airport_fee,
        improvement_surcharge,
        total_amount,
        payment_type,
        null as trip_type,
        congestion_surcharge,

        ---------- booleans
        coalesce(store_and_fwd_flag = 'Y', false) as is_store_and_forward,

        ---------- dates
        -- (none)

        ---------- timestamps
        tpep_pickup_datetime::timestamp as pickup_at,
        tpep_dropoff_datetime::timestamp as dropoff_at

    from
        source

)

select * from renamed
