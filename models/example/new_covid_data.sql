with new_counts as (
select Date,location,
sum(new_cases) as new_cases,
sum(new_deaths)as new_deaths,
sum(new_recovered)as new_recovered,
sum(new_active_cases) as new_active_cases,
sum(New_Cases_per_Million) as New_Cases_per_Million,
sum(New_Deaths_per_Million) as New_Deaths_per_Million
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.COVID_INDONESIA
group by 1,2 
order by 1,2
)
select * from new_counts