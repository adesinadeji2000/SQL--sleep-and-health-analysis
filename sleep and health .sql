select *
from shld ;

-----What is the average Sleep Duration for each BMI Category?

select bmi_category,round(avg(sleep_duration),2)as average_Sleep_Duration
from shld
group by bmi_category ;

-----Which Occupation has the highest average Stress Level?

select occupation, round( avg(stress_level),2) as avg_stress
from shld 
group by occupation
order by avg_stress desc
limit ;

-----Find the correlation between Sleep Duration and Quality of Sleep. (foRmular for finding correlation is (CORR))

select  corr(sleep_duration , quality_of_sleep)
from shld
 
-----What is the most common Sleep Disorder among different Age groups?
alter table shld
add column age_group varchar(50);

update  shld
set age_group = case
                       when age <=29 then 'young adult'
	                   when age <=49 then 'adult'
                       else  'senior'
	             end ;

select count(sleep_disorder), age_group, sleep_disorder
from shld
group by age_group, sleep_disorder
order by count(sleep_disorder) desc ;

----What is the average Daily Steps count for people who have "Insomnia"?

select round(avg(daily_steps),1) as avg_daily_steps, sleep_disorder
from shld
group by sleep_disorder
order by avg(daily_steps) desc ;

-----Is there a difference in average Heart Rate between males and females?
--- ans diff =71.05- 69.26= 1.79
select round(avg(heart_rate),2) as average_heart_rate , gender
from shld 
group by gender
order by  average_heart_rate desc;

-----What percentage of people have no Sleep Disorder?


select  sleep_disorder ,round(count(person_id) * 100.0 / sum(count(person_id)) over (),2) as percentage_of_people
from shld
group by  sleep_disorder 
order by  percentage_of_people desc ;

-----What is the average physical_activity_level for people with a Stress Level greater than 7? 

select round(avg(physical_activity_level),2) as avg_physical_activity_level,stress_level
from shld
group by stress_level
having stress_level > 7
order by avg_physical_activity_level desc ;  



select *
from shld ;


ALTER TABLE shld 
ALTER COLUMN sleep_duration TYPE numeric USING sleep_duration :: numeric ;


