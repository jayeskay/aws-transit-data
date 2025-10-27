select
    locationid as location_id,
    borough,
    zone,
    service_zone
from
    testing.taxi_zone_lookup
order by
    locationid
limit 100;
