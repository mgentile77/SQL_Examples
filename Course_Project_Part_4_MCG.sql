/************************************************************************************************************
Michael Gentile
2/27/23
DBMS 130-10P
M.Oklak
M06 Course Project part 4
****************************************************************************************************/


--Question 1

select a.last_name, a.first_name, m.title
from flix_actors a inner join
flix_star_billings s on a.actor_id = s.actor_id inner join
flix_movies m on s.title_id = m.title_id
order by a.last_name, a.First_name;

--Question 2

select title, release_date
from flix_movies
where sysdate >= ADD_MONTHS(release_date, 300)
order by release_date;

--Question 3

select stage_name, title
from flix_actors a left join 
flix_star_billings s on a.actor_id = s.actor_id right join
flix_movies m on s.title_id = m.title_id
order by stage_name;
