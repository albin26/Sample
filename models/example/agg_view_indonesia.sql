{{
  config(
    materialized='view'
  )
}}

with loc as (
select *
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.Location
),
new_covid as (
select *
--distinct Continent,Country,Province,Location_level,Location,Location_ISO_Code,Island,Latitude,Longitude
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.new_covid_data
),
total_covid as (
select *
--distinct Continent,Country,Province,Location_level,Location,Location_ISO_Code,Island,Latitude,Longitude
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.total_covid_data
),
census as( 
select *
--distinct Continent,Country,Province,Location_level,Location,Location_ISO_Code,Island,Latitude,Longitude
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.region_census
),
covid_rate as( 
select *
--distinct Continent,Country,Province,Location_level,Location,Location_ISO_Code,Island,Latitude,Longitude
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.geographical_covid_rate
),

final as (

select
loc.Country,loc.Location,loc.Location_ISO_Code,
census.Total_Districts,census.population,
new_covid.Date,new_covid.new_cases,new_covid.new_deaths,new_covid.new_recovered,
total_covid.total_cases,total_covid.total_deaths,total_covid.total_recovered,
covid_rate.Case_Fatality_Rate,covid_rate.Case_Recovered_Rate,covid_rate.Growth_Factor_of_New_Cases,covid_rate.Growth_Factor_of_New_Deaths

    from loc,census,new_covid,total_covid,covid_rate
	where 
	loc.Location_ISO_Code = census.Location_ISO_Code
	and loc.location = census.location
	and loc.location = covid_rate.location
	and loc.location = new_covid.location
	and loc.location = total_covid.location
	and covid_rate.date = total_covid.date
	and covid_rate.date = new_covid.date
	and loc.Longitude = census.Longitude
	and loc.Latitude = census.Latitude
	and loc.Longitude = covid_rate.Longitude
	and loc.Latitude = covid_rate.Latitude
) 
select *
 from final