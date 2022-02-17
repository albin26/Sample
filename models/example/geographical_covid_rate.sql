with covid_rate as (select	date,	location,	province,	latitude,	longitude,	
sum(Case_Fatality_Rate) as Case_Fatality_Rate ,
sum(Case_Recovered_Rate) as Case_Recovered_Rate,
sum(Growth_Factor_of_New_Cases)as Growth_Factor_of_New_Cases,
sum(Growth_Factor_of_New_Deaths) as Growth_Factor_of_New_Deaths
from FIVETRAN_DATABASE.PLAYGROUND_ALBIN.COVID_INDONESIA
group by 1,2,3,4,5
order by 1,2)

select * from covid_rate