/***********************************************
Michael Gentile
2/13/2023
M04 Course Project Part 2
DBMS 130-10P
M. OKLAK
**********************************************/




Delete flix_rental_history;
delete flix_media;
delete flix_star_billings;
delete flix_actors;
delete flix_customers;
delete flix_movies;



insert into flix_movies (Title_id, Title, Description, Rating, Category, Release_Date)
VALUEs (1, 'Trainspotting', 'Renton, deeply immersed in the Edinburgh drug scene, tries to clean up and get out, despite the allure of the drugs and influence of friends.', 'r', 'drama', TO_DATE('1996', 'yyyy'));
insert into flix_movies (Title_id, Title, Description, Rating, Category, Release_Date)
VALUEs (2, 'Fargo', 'Minnesota car salesman Jerry Lundegaards inept crime falls apart due to his and his henchmens bungling and the persistent police work of the quite pregnant Marge Gunderson.', 'r', 'drama', to_date('1996','yyyy'));
insert into flix_movies (Title_id, Title, Description, Rating, Category, Release_Date)
VALUEs (3, 'Shine', 'Pianist David Helfgott, driven by his father and teachers, has a breakdown. Years later he returns to the piano, to popular if not critical acclaim.', 'pg-13', 'drama', TO_DATE('1996','yyyy'));
insert into flix_movies (Title_id, Title, Description, Rating, Category, Release_Date)
VALUEs (4, 'Primal Fear', 'An altar boy is accused of murdering a priest, and the truth is buried several layers deep.', 'r', 'drama', TO_DATE('1996', 'yyyy'));
insert into flix_movies (Title_id, Title, Description, Rating, Category, Release_Date)
VALUEs (5, 'Breaking Waves', 'Oilman Jan is paralyzed in an accident. His wife, who prayed for his return, feels guilty; even more, when Jan urges her to have sex with another.', 'r', 'drama', TO_DATE('1996', 'yyyy'));
insert into flix_movies (Title_id, Title, Description, Rating, Category, Release_Date)
VALUEs (6, 'Sling Blade', 'Karl Childers, a simple man hospitalized since his childhood murder of his mother and her lover, is released to start a new life in a small town.', 'r', 'drama', TO_DATE('1996', 'yyyy'));



	
insert into flix_customers(customer_id, last_name, first_name, home_phone, cell_phone, email, street1, street2, city, state_province, postal_code)
VALUEs (6, 'Chadwick', 'Forbes','(951) 414-2633','(858) 772-9367','in.lobortis.tellus@aol.edu','4799 Molestie. Rd.', null,'Galway', 'PA', '17225');
insert into flix_customers(customer_id, last_name, first_name, home_phone, cell_phone, email, street1, street2, city, state_province, postal_code)
VALUEs (1,'Felix', 'Hayes','(835) 821-0271','(846) 483-8214','integer.aliquam@icloud.edu','7074 Dui. Rd.', null,'Tvedestrand','VT','58440');
insert into flix_customers(customer_id, last_name, first_name, home_phone, cell_phone, email, street1, street2, city, state_province, postal_code)
VALUEs (2,'Signe', 'Pace','(836) 464-3011','(551) 768-5286','aenean.eget@icloud.org','5880 Mauris St.', null,'Vienna','FL','73918');
insert into flix_customers(customer_id, last_name, first_name, home_phone, cell_phone, email, street1, street2, city, state_province, postal_code)
VALUEs (3,'Maryam', 'Matthew','(306) 667-2851','(591) 973-4114','integer@google.com','Ap #456', '376 Sem. Rd.', 'Sokoto','MO','82626');
insert into flix_customers(customer_id, last_name, first_name, home_phone, cell_phone, email, street1, street2, city, state_province, postal_code)
VALUEs (4,'Dunlap', 'Kirk','(751) 755-3103','(598) 354-1574','dui.lectus@hotmail.edu','Ap #630', '6540 Netus Av.','Salerno','OK','96468');
insert into flix_customers(customer_id, last_name, first_name, home_phone, cell_phone, email, street1, street2, city, state_province, postal_code)
VALUEs (5,'Warren', 'Ellis','(357) 348-5333','(303) 321-0718','vivamus@yahoo.ca','Ap #396', '5856 Dis Avenue','Banjarbaru','AZ','26136');


insert into flix_actors (actor_id, stage_name, last_name, first_name, birth_date)
VALUEs (1, 'Billy Bob Thornton', 'Thornton', 'Billy', to_date('08-04-1955', 'mm-dd-yyyy'));
insert into flix_actors (actor_id, stage_name, last_name, first_name, birth_date)
VALUEs (2, 'William H. Macy', 'Macy', 'William', TO_DATE('03-13-1950', 'mm-dd-yyyy'));
	
	
insert into flix_star_billings (star_billing_id, actor_id, title_id, comments)
VALUEs (1, 1, 6, 'Billy Bob Thornton was nominated for an Oscar for this role.');
insert into flix_star_billings (star_billing_id, actor_id, title_id, comments)
VALUEs (2, 2, 2, 'William H. Macy was nominated for an Oscar for this role.');

insert into flix_media (media_id, title_id, format)
values (1, 6, 'dvd');
insert into flix_media (media_id, title_id, format)
values (2, 6, 'blu-ray');
insert into flix_media (media_id, title_id, format)
values (3, 2, 'dvd');
insert into flix_media (media_id, title_id, format)
values (4, 2, 'blu-ray');

insert into flix_rental_history (Rental_history_Id, customer_id, media_id, rental_date, return_date)
VALUES (23001, 5, 2, TO_DATE('02-10-2023', 'mm-dd-yyyy'), null);
insert into flix_rental_history (Rental_history_Id, customer_id, media_id, rental_date, return_date)
VALUES (23002, 3, 3, TO_DATE('12-24-2022', 'mm-dd-yyyy'), TO_DATE('01-12-2023', 'mm-dd-yyyy'));
