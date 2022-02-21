with new_counts as (
select Date,location,
new_cases as new_cases,
new_deaths as new_deaths,
new_recovered as new_recovered,
new_active_cases as new_active_cases,
New_Cases_per_Million as New_Cases_per_Million,
New_Deaths_per_Million as New_Deaths_per_Million
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.COVID_INDONESIA
group by 1,2,3,4,5,6,7,8 
order by 1,2
)
select * from new_counts