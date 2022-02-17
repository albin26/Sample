with census as( 
select	distinct Location_ISO_Code,	Location,	Total_Regencies,
Total_Cities,Total_Districts,	Total_Urban_Villages,	Total_Rural_Villages	,
Area_km_2_ as area_km2,	Population,	Population_Density,	Longitude,	Latitude
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.COVID_INDONESIA)

select * from census