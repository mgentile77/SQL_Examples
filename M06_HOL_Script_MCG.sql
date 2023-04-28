/************************************************************************************************************
Michael Gentile
2/27/23
DBMS 130-10P
M.Oklak
M06 HOL Assignment
****************************************************************************************************/

/******************************************
	IVY TECH COMMUNITY COLLEGE
	DBMS130 – M06 Hands-On Lab Assignment
******************************************/

--============================================
--		60 points	(10 points each)
--
-- 		Sub-queries
--============================================
/*
1.	Write a SQL statement that uses a sub_query.
The sub-query should find the employee_ids of managers.
The outer query should list all employee details about the Managers only.
Sort results by manager last name and first name.
*/	
select *
from HOL_employees
where employee_id in (
    select distinct manager_id
    from HOL_employees)
order by last_name, first_name;

/*
2.	Write a SQL statement that uses a sub_query.
	The sub-query should find the employee_id of Kevin Mourgos.
	The outer query should list all employee details of the employees who work for (are managed by) Mr. Mourgos.
	Sort your results by the employees' last and first names.
*/
select *
from HOL_employees
where manager_id in (
    select employee_id
    from HOL_employees
    where last_name = 'Mourgos')
order by last_name, first_name;

/*
3.	Write a SQL statement that uses a sub_query.
	The sub-query should find the the average current salary of all employees at the company.
	The outer query should list all employee details of employees who make less that the average salary.
	Sort your results by the employees' last and first names.
*/
select *
from hol_employees
where current_salary < (
    select avg(current_salary)
    from hol_employees)
order by last_name, first_name;

/*
4.	Write a SQL statement that uses a sub_query.
    The sub-query should return the distinct Job_IDs of Employees who make less than the average salary - see previous question.
    The outer query should return the job details on these jobs.
    Sort the results by Job Title.
*/
select *
from hol_jobs
where job_id in (
    select distinct job_id
    from hol_employees
    where current_salary < (
        select avg(current_salary)
        from hol_employees))
order by job_title;

/*
5.	Write a SQL statement that uses a sub_query.
    The sub-query should return the Order Numbers of all orders that have at least one Order Item Amount > $25.00.
	    Order Item Amount = quantity * price
    NOTE: Unit Price is NULL in HOL_ORDER_ITEMS so you will need to JOIN to HOL_BOOKS to get Book_Price.

    The outer query should display the Customer_IDs of the Customers associated with these Order Numbers.  
    If a customer has more than one order, their customer_ID should only occur once; no duplicate customers.
	Sort your results by Customer_ID.
*/
select distinct customer_id
from hol_order_items oi inner join hol_orders o on oi.order_number = o.order_number
where o.order_number in (
    select oi.order_number
    from hol_order_items oi inner join hol_books b on oi.isbn = b.isbn
    where (b.book_price*oi.quantity) >25)
order by customer_id;


/*
6.	VERY DIFFICULT

    Write a SQL statement that uses a sub-query.
    The sub-query should be the entire query from Q5 - except the ORDER BY Clause.
    The outer query should return the following:
	Customer_ID
	Customer Last Name
	Customer First Name
	Customer Email
	Customer Address:
		Street
		City
		State/Province
		Postal Code
		Country Name (not Country ID)
		Region Name (not Region ID)
	Sort the results by customer last name and first name.
*/
select c.customer_id, c.last_name, c.first_name, email, l.street, l.city, l.state_province, l.postal_code
, co.country_name, r.region_name
from hol_customers c inner join 
hol_locations l on c.location_id = l.location_id inner join
hol_countries co on l.country_id = co.country_id inner join
hol_regions r on co.region_id = r.region_id
where customer_id in (
	select distinct customer_id
	from hol_order_items oi inner join hol_orders o on oi.order_number = o.order_number
	where o.order_number in (
		select oi.order_number
		from hol_order_items oi inner join hol_books b on oi.isbn = b.isbn
		where (b.book_price*oi.quantity) >25))
order by c.last_name, c.first_name;