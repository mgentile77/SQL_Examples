/*----------------------------------------------------------------------------------------------------------------------
Michael Gentile
2/6/2023
DBMS 130-10P
M. Oklak
----------------------------------------------------------------------------------------------------------------------*/


Drop table FLIX_CUSTOMERS cascade constraints;
Drop table FLIX_RENTAL_HISTORY cascade constraints;
Drop table FLIX_MEDIA cascade constraints;
Drop table FLIX_MOVIES cascade constraints;
Drop table FLIX_STAR_BILLINGS cascade constraints;
Drop table FLIX_ACTORS cascade constraints;

create table FLIX_CUSTOMERS
(
	Customer_ID		integer not Null enable
	,Last_Name		varchar2(250)
	,First_Name		varchar2(250)
	,Home_Phone		varchar2(50)
	,Cell_Phone		varchar2(50)
	,Email			varchar2(50)
	,Street1		varchar2(250)
	,Street2		varchar2(250)
	,City			varchar2(250)
	,State_Province	char(2)
	,Postal_Code	Varchar2(50)
	,constraint PK_CustID Primary key (Customer_ID)
);
	
create table FLIX_RENTAL_HISTORY
(
	Rental_History_ID	integer not null enable
	,Customer_ID		integer
	,Media_ID			integer 
	,Rental_Date		Date
	,Return_Date		Date
	,Constraint PK_Rent_HisID	Primary key (Rental_History_ID)
);

create table Flix_Media
(
	Media_ID		integer not null enable
	,Title_ID		integer 
	,Format			varchar2(10)
	,constraint PK_MediaID	Primary key (Media_ID)
);

create Table FLIX_ACTORS
(
	Actor_ID 		integer not null enable
	,Stage_Name		varchar2(250)
	,Last_Name		varchar2(250)
	,First_Name		varchar2(250)
	,Birth_Date		Date
	,constraint PK_ActorID	Primary key (Actor_ID)
);

Create Table FLIX_STAR_BILLINGS
(
	Star_Billing_ID		integer not null enable
	,Actor_ID			integer
	,Title_ID			integer
	,Comments			varchar2(250)
	,constraint PK_Star_BillID Primary key (Star_Billing_ID)
);

create table FLIX_MOVIES
(
	Title_ID		integer not null enable
	,Title			varchar2(250)
	,Description	varchar2(4000)
	,Rating			varchar2(10)
	,Category		Varchar2(250)
	,Release_Date	Date
	,constraint PK_TitleID	primary key (Title_ID)
);

alter table FLIX_RENTAL_HISTORY
add
(
	constraint FK_CustID	foreign key (Customer_ID)
	references FLIX_CUSTOMERS(Customer_ID)
	,constraint FK_MediaID foreign key (Media_ID)
	references FLIX_MEDIA(Media_ID)
);

alter table FLIX_MEDIA
add
(
	constraint FK_TitleID	foreign key (Title_ID)
	references FLIX_MOVIES(Title_ID)
);

alter table FLIX_STAR_BILLINGS
add
(
	constraint FK_ActorID	foreign key (Actor_ID)
	references FLIX_ACTORS(Actor_ID)
	,constraint FK_Title_ID	foreign key (Title_ID)
	references FLIX_MOVIES(Title_ID)
);

alter table FLIX_MOVIES
add
(
	constraint CHK_Rating check (UPPER(Rating) in ('G', 'PG', 'PG-13','PG13','R'))
	,constraint CHK_Cat	check (UPPER(Category) in ('DRAMA', 'COMEDY', 'ACTION', 'SCIFI', 'DOCUMENTARY','Child'))
);