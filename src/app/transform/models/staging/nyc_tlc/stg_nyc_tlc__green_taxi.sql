with

green_taxi as (
    select
        *
    from
        {{ source('nyc_tlc', 'green_taxi') }}
),

final as (
    select
        vendorid as vendor_id,
        lpep_pickup_datetime as pickup_datetime,
        lpep_dropoff_datetime as dropoff_datetime,
        store_and_fwd_flag,
        ratecodeid as rate_code_id,
        pulocationid as pickup_location_id,
        dolocationid as dropoff_location_id,
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
        congestion_surcharge
    from
        green_taxi
)

select * from final
