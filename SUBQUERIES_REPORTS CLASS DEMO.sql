USE Sales_Co
GO 

-- 1. List of all products that are priced higher than the average product price. 
Select avg(p_price) from Product
Select p_code, p_descript, p_price
From Product
where p_price > 56.421250
Select p_code, p_descript, p_price
From Product
where p_price > avg(p_price)
Select p_code, p_descript, p_price
From Product
where p_price > 
(Select avg(p_price) from Product)
--- 2. Show all the vendor information who have supplied at least one product and 
--are from state Tennessee. Show vendor code, and vendor name.
select distinct Product.v_code, v_name
from Product join Vendor
on Product.v_code = Vendor.v_code
where v_state = 'TN'
Select v_code, v_name 
from Vendor
where v_code in
(select v_code
from Product) and v_state = 'TN'
---3. List of of all vendors who have not supplied a single product 
--Display vendor's code and name 
select Vendor.v_code as v_v_code, Product.v_code as p_v_code
From Vendor left join Product 
on Vendor.v_code = Product.v_code 
where Product.v_code is null
Select Vendor.v_code, v_name
From Vendor left join Product 
on Vendor.v_code = Product.v_code 
where Product.v_code is null
Select v_code, v_name
From Vendor 
where v_code not in
(select v_code 
from Product
where v_code is not null)
---4. List of all customers who have purchased any type of a  hammer, or a saw (not
--saw blades). Show customer code and last and first name.
-- First let's look at the product table to see what kind of hammers and saws  are 
--supplied. 
Select p_code, p_descript
from Product
where p_descript like '%hammer%' or  p_descript like '%saw%'
-- we are not interested in blades, so we need to find saws that do not include 
--blades
Select p_code, p_descript
from Product
where p_descript like '%hammer%' or  (p_descript like '%saw%' and p_descript not 
like '%blade%')
-- Now that we know the product codes of the products of interest, we can look for 
--the customers that purchased these products. 
Select distinct C.cus_code, cus_Fname, cus_LName
From Customer C inner join Invoice I on C.cus_code = I.cus_code
inner join Line L on I.inv_number = L.inv_number
inner join Product P on L.p_code = P.p_code
Where l.p_code in
(Select p_code
from Product
where p_descript like '%hammer%' or  
(p_descript like '%saw%' and p_descript not 
like '%blade%'))
Select cus_code, cus_Fname, cus_LName
From Customer 
where cus_code in
(select cus_code
from Invoice 
where inv_number in 
(select inv_number from Line where p_code in
(select p_code from Product 
where p_descript like '%hammer%' or 
(p_descript like '%saw%' and p_descript not like '%blade%'))))
---5. List all products with total quantity sold in excess of the average qty sold.
--Show product code and total quantity sold. 
select avg(line_units) as AvgQty
from line 

Select p_code, sum(line_units) as [Total Sales]
from line
Group by p_code
Having sum(Line_units) > 2.55555
Order by p_code

Select p_code, sum(line_units) as [Total Sales]
from line
Group by p_code
Having sum(Line_units) > (select avg(line_units) from line)
Order by p_code
---6. List the difference between each product's price and the average product 
--price. Display product code, product price, average product price, and the 
--difference
Select p_code, p_price, avg(p_price), (p_price - avg(p_price)) as [Diff] --- doesnt pull full set of values , just one value 
from Product
group by p_code, p_price
order by p_code
Select p_code, p_price, (select avg(p_price) from Product) as average, (p_price - (select 
avg(p_price) from Product)) as [Diff]
from Product
order by p_code


---7
declare
@showall char(4) = 'True',
@product1 varchar(100)= '%hammer%',
@product2 varchar(100) = '%saw%' 
select C.cus_code, 
concat (cus_Fname, space (1), 
cus_Lname) as [Customer Name], 
count (P.p_code) as [product count], 
p_descript, v_name, 
sum (line_units*line_price) as [Total order value], 
(p_price - (select avg(p_price) from Product)) as [Diff],
[KPI for Total order value] = case
when sum (line_units*line_price) > 100 then 1
when sum (line_units*line_price) between 50 and 100 then 0
when sum (line_units*line_price) <50 then -1
end
From Customer C inner join Invoice I on C.cus_code = I.cus_code
inner join Line L on I.inv_number = L.inv_number
inner join Product P on L.p_code = P.p_code inner join 
Vendor V on V.v_code = P.v_code
where @showall = 'False' or p_descript like @product1 or p_descript like @product2
group by C.cus_code, cus_Fname, cus_Lname, p_descript, p_price, v_name
order by C.cus_code

declare 
@product3 varchar(100)= '%hammer%',
@product4 varchar(100) = '%saw%' 
select C.cus_code, 
concat (cus_Fname, space (1), 
cus_Lname) as [Customer Name], 
count (P.p_code) as [product count], 
p_descript, v_name, 
sum (line_units*line_price) as [Total order value], 
(p_price - (select avg(p_price) from Product)) as [Diff],
[KPI for Total order value] = case
when sum (line_units*line_price) > 100 then 1
when sum (line_units*line_price) between 50 and 100 then 0
when sum (line_units*line_price) <50 then -1
end
From Customer AS C inner join Invoice AS I on C.cus_code = I.cus_code
inner join Line AS L on I.inv_number = L.inv_number
inner join Product P on L.p_code = P.p_code inner join 
Vendor V on V.v_code = P.v_code
where p_descript like @product3 or p_descript like @product4
group by C.cus_code, cus_Fname, cus_Lname, p_descript, p_price, v_name
order by C.cus_code
---8
go 

CREATE VIEW vw2
as
select C.cus_code, 
concat (cus_Fname, space (1), 
cus_Lname) as [Customer Name], 
count (P.p_code) as [product count], 
p_descript, v_name, 
sum (line_units*line_price) as [Total order value], 
(p_price - (select avg(p_price) from Product)) as [Diff],
[KPI for Total order value] = case
when sum (line_units*line_price) > 100 then 1
when sum (line_units*line_price) between 50 and 100 then 0
when sum (line_units*line_price) <50 then -1
end
From Customer C inner join Invoice I on C.cus_code = I.cus_code
inner join Line L on I.inv_number = L.inv_number
inner join Product P on L.p_code = P.p_code inner join 
Vendor V on V.v_code = P.v_code
where p_descript like '%hammer%' or p_descript like '%saw%'
group by C.cus_code, cus_Fname, cus_Lname, p_descript, p_price, v_name;


select * from vw2
order by cus_code;