with

import_green_trips as (

    select * from {{ ref('int_taxi_locations_joined') }}
),

final as (

    select
        pickup_at,
        dropoff_at,
        pickup_borough,
        pickup_zone,
        pickup_service_zone,
        dropoff_borough,
        dropoff_zone,
        dropoff_service_zone,
        payment_type,
        trip_type,
        taxi_type,
        passenger_count,
        trip_distance,
        fare_amount,
        total_amount,
        congestion_surcharge,
        store_and_forward
    from
        import_green_trips

)

select * from final
