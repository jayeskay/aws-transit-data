with

-- pull in green taxi trips
green_trips as (
    select
        *, 
        'green' as taxi_type
    from
        {{ ref('int_taxi_locations_joined') }}
)

select
    pickup_datetime,
    dropoff_datetime,
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
    store_and_fwd
from
    green_trips
