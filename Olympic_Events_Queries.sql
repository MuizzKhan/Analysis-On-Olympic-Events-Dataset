-- Q1) Write an SQL query to find in which event united states has won the highest medals

select Year, Event, count(Medal) from olympic_events 
where Team = 'United States' and Medal <> 'NA' 
group by Year, Event 
order by count(Medal) desc, Year desc;

-- Q2) Identify the event which was played most consecutively in the summer olympic games

select event, count(event) from olympic_events 
where season = 'summer' 
group by event
order by count(event) desc;

-- Q3) Write an SQL query to fetch the details of all the countries which have won most number of silver and bronze medals and at least one gold medal

select team,sum(Silver),
			sum(Bronze),
			sum(Gold)
from(
		select *,
			case Medal when 'Silver' then 1 else 0 end as Silver,
			case Medal when 'Bronze' then 1 else 0 end as Bronze,
			case Medal when 'Gold' then 1 else 0 end as Gold
		from olympic_events
) as DerivedTable
group by team
having sum(Gold) > 0
order by sum(Silver) desc;

-- Q4) Which player has won maximum number of gold medals

select Name, sum(Gold)
from(
		select *,
			case Medal when 'Gold' then 1 else 0 end as Gold
		from olympic_events
) as DerivedTable
group by Name
order by sum(Gold) desc;

-- Q5) Which sport was played maximum times

select sport, count(*) from olympic_events 
group by sport 
order by count(*) desc;

-- Q6) Which year has maximum events

select year, count(event) from olympic_events 
group by year 
order by count(event) desc;

-- Q7) Identify the number of olympic athletes or partipicants with respect to gender

select gender, count(*) from olympic_events
group by gender;

-- Q8) Which country has participated the most of the times

select team, count(*) from olympic_events
group by team
order by count(*) desc;

-- Q9) How many events held in the season of summer and winter

select season, count(event) from olympic_events
group by season
order by count(event) desc;

-- Q10) Find out the maximum age of athletes or participants and from which country they belong

select team, age from olympic_events 
where age = (select max(age) from olympic_events);

