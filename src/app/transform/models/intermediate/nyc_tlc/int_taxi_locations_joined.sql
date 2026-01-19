with

import_zones as (

    select * from {{ source('nyc_tlc', 'taxi_zone_lookup') }}

),

import_green_taxi as (

    select * from {{ ref('stg_nyc_tlc__green_taxi') }}

),

joined as (

    select
        green_taxi.vendor_id,
        green_taxi.pickup_datetime,
        green_taxi.dropoff_datetime,
        green_taxi.rate_code_id,
        zones."Borough" as pickup_borough,
        zones."Zone" as pickup_zone,
        zones.service_zone as pickup_service_zone,
        zones."Borough" as dropoff_borough,
        zones."Zone" as dropoff_zone,
        zones.service_zone as dropoff_service_zone,
        green_taxi.passenger_count,
        green_taxi.trip_distance,
        green_taxi.fare_amount,
        green_taxi.extra,
        green_taxi.mta_tax,
        green_taxi.tip_amount,
        green_taxi.tolls_amount,
        green_taxi.ehail_fee,
        green_taxi.improvement_surcharge,
        green_taxi.total_amount,
        green_taxi.payment_type,
        green_taxi.trip_type,
        green_taxi.congestion_surcharge,
        green_taxi.store_and_fwd
    from
        import_green_taxi as green_taxi
    inner join import_zones as zones on
        green_taxi.pickup_location_id = zones."LocationID"
        and zones."Borough" != 'Unknown'

)

select * from joined
