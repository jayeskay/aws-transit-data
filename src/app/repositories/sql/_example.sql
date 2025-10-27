select
    "LocationID" as location_id,
    "Borough" as borough,
    "Zone" as taxi_zone,
    service_zone
from
    public.taxi_zone_lookup
order by
    "LocationID"
limit 100;
