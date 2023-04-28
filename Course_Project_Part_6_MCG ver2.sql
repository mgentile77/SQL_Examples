/************************************************************************************************************
Michael Gentile
3/6/23
DBMS 130-10P
M.Oklak
M08 Course Project Part 6
****************************************************************************************************/


drop SEQUENCE SEQ_ACTOR_ID;
delete from flix_actors where stage_name = 'Brandon Lee';



create sequence SEQ_ACTOR_ID
increment by 1
start with 1001
NOMAXVALUE;

select * from user_sequences where sequence_name = 'SEQ_ACTOR_ID';

insert into flix_actors (actor_id, stage_name, Last_name, First_name, Birth_date)
values (SEQ_ACTOR_ID.NEXTVAL, 'Brandon Lee', 'Lee', 'Brandon', TO_DATE('02-01-1965', 'mm-dd-yyyy'));

select * 
from flix_actors
where trunc(Birth_date) = to_date('02/01/1965', 'mm/dd/yyyy')