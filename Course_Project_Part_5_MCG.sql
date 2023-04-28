/***********************************************
Michael Gentile
2/28/2023
Course Project Part 5
DBMS 130-10P
M. OKLAK
**********************************************/

drop view v_Title_Unavailable;
drop SYNONYM vTU;

-- Question 1

create view v_Title_Unavailable as 
select m.title, rh.media_id
from flix_rental_history rh
inner join flix_media me on rh.media_id = me.media_id
inner join flix_movies m on me.title_id = m.title_id
where rh.return_date is null
order by rh.rental_date
with read only;

-- Question 2

create SYNONYM vTU for v_Title_Unavailable;

-- Question 3 

select * from vTU;