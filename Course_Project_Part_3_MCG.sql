/************************************************************
Michael Gentile
2/20/2023
DBMS 130-10P
M. Oklak
Module 5 course Project Part 3
************************************************************/

/*
To determine the popularity of the movies in the FLIX inventory, 
Write a query to display each movie and the number of times it was rented. 
Sort your results by the count of rentals in descending order.	
*/

select Title, count(*) as "Times Rented"
from flix_movies mo inner join flix_media me on mo.title_id = me.title_id
inner join flix_rental_history r on me.media_id = r.media_id
group by title 
order by "Times Rented" desc;

/*
FLIX will be mailing coupons to the homes of renters. They are printing labels for each renter. 
Your results should include the 
Name:                 Customers’ first and last name concatenated, 
Address:             Street, city, state, postal code concatenated
Also include 2 columns
name_length      Display the length of the concatenated first and last name
address_length   Display the length of the concatenated address

 

Sort your results by the customers’ last names.   
*/

select 
first_name || ' ' || last_name as "Name"
,street1 || chr(10) 
|| street2 
|| chr(10) 
|| city || ', ' || state_province || ' ' || postal_code as "Address"
,length (first_name || ' ' || last_name) as "Name length"
,length (street1 || chr(10) 
|| street2 
|| chr(10) 
|| city || ', ' || state_province || ' ' || postal_code) as "Address Length"
from flix_customers c inner join flix_rental_history r on c.customer_id = r.customer_id
order by last_name;

/*
With more people buying Blu-ray products, FLIX is considering clearing VHS products
 out of their inventory. Before they do, they need to know if customers are renting
 that type of media. Write a query to identify the number of times each type of media
 has been rented. Sort your results by the count of rentals descending.
 */
 
 
select me.format, count(*) as "Times Rented"
from flix_media me right join flix_rental_history r on me.media_id = r.media_id
group by me.format
order by "Times Rented" desc
