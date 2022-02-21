with latest_count as(select date,country,
sum(new_cases) as new_cases,
sum(new_deaths) as new_deaths,
sum(new_recovered) as new_recovered,
sum(new_active_cases) as new_active_cases,
sum(total_cases) as total_cases,
sum(total_deaths) as total_deaths,
sum(total_recovered) as total_recovered,
sum(total_active_cases) as total_active_cases
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.COVID_INDONESIA
where date = (select max(date) from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.COVID_INDONESIA)
group by 1,2)

select * from latest_count