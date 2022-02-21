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

latest_count as(
select *
--distinct Continent,Country,Province,Location_level,Location,Location_ISO_Code,Island,Latitude,Longitude
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.latest_covid_count

),
final as (

select
loc.Country,loc.Location,loc.Location_ISO_Code,
census.Total_Districts,census.population,
new_covid.Date,new_covid.new_cases,new_covid.new_deaths,new_covid.new_recovered,
total_covid.total_cases,total_covid.total_deaths,total_covid.total_recovered,
covid_rate.Case_Fatality_Rate,covid_rate.Case_Recovered_Rate,
covid_rate.Growth_Factor_of_New_Cases,covid_rate.Growth_Factor_of_New_Deaths,
latest_count.date as latest_date,
latest_count.new_cases as latest_new_count,
latest_count.new_deaths as latest_new_death_count,
latest_count.new_recovered as latest_new_recovered_count,
latest_count.total_cases as latest_total_cases,
latest_count.total_deaths as latest_total_deaths,
latest_count.total_recovered as latest_total_recovered
    from loc,census,new_covid,total_covid,covid_rate,latest_count
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
	and loc.Country = latest_count.Country
	--group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
) 
select *
 from final