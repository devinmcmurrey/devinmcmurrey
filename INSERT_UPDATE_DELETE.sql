create database Realestate3
USE Realestate3
GO
/*Ex1*/



create table customers4
(customer_id  int identity (100,10) primary key,
customer_name varchar(255) not null,
city varchar(50),
zip_code varchar(10) not null,
customer_proposed_price money default 500000,
date_of_visit date) 

/*Ex2*/
insert into customers4(customer_name, city, zip_code, customer_proposed_price, 
date_of_visit)
values ('White Clover Markets', 'Seattle', '98128', 520000, '20160810'), ('Wilman Kala', null, '21240', 500000, '20160804'),('Wolski',
'Walla', '01-012', 450000, null)

select * 
from customers4

/*Ex3*/
select *
into customerscopy2
from customers
where customer_proposed_price>=500000

select *
from customers

/*Ex4*/
insert into customers (customer_name, customer_proposed_price, zip_code)
values ('Cardinal', default, '4006')

select *
from customers

/*Ex5*/
update customerscopy2	
set date_of_visit = GETDATE()
where customer_name = 'Wilman Kala'

select *
from customerscopy2

/*Ex6*/
delete from customers
where date_of_visit is null 

SELECT * 
FROM customers