with total_counts as (
select Date,location,
sum(total_cases) as total_cases,
sum(total_deaths)as total_deaths,
sum(total_recovered)as total_recovered,
sum(total_active_cases) as total_active_cases,
sum(total_Cases_per_Million) as total_Cases_per_Million,
sum(total_Deaths_per_Million) as total_Deaths_per_Million
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.COVID_INDONESIA
group by 1,2 
order by 1,2
)
select * from total_counts