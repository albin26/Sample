with loc as (
select distinct Continent,Country,Province,Location_level,Location,Location_ISO_Code,Island,Latitude,Longitude
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.COVID_INDONESIA
)

select * from loc