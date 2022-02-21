with total_counts as (
select Date,location,
total_cases as total_cases,
total_deaths as total_deaths,
total_recovered as total_recovered,
total_active_cases as total_active_cases,
total_Cases_per_Million as total_Cases_per_Million,
total_Deaths_per_Million as total_Deaths_per_Million
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.COVID_INDONESIA
group by 1,2,3,4,5,6,7,8 
order by 1,2
)
select * from total_counts