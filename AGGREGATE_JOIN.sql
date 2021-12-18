use [Sales_Co]
go
--1. How many products are supplied by vendors 21344
SELECT count(p_code) as Products_provided
FROM product
where v_code = 21344
--2. How many products are supplied by vendors 21344 and 24288
SELECT count(p_code)
FROM product
where v_code in (21344, 24288)
--3. What is the number of products supplied by all vendors
SELECT count(v_code)
FROM product
-- Note the difference!This is counting all products in Product table
SELECT count(P_CODE)
FROM product
--4. How many vendors have supplied products to SaleCo.
SELECT count( distinct V_code)
FROM Product
--5. What are the highest and lowest priced products in our inventory?
SELECT max(p_price) as HighetsPrice, min(p_price) as LowestPrice
FROM product
--6. What is the lowest priceand highest the company has paid for a product 
--supplied by Vendor 21344
SELECT min(p_price) as LowestPrice, max(p_price) as HighestPrice
FROM product
WHERE v_code = 21344
--7. What is the range of pricescompany has paid for products supplied by vendor 
--21344
SELECT (max(p_price) - min(p_price)) as [Range]
FROM product
Where v_code = 21344
--8. What is the total quantity on hand and total inventory value
SELECT sum(p_qoh) as [Total QOH], sum(p_price*p_qoh) as [Total Value]
FROM product
--9. What is the average price of all products in inventory, average inventory 
--value?
SELECT AVG(p_price) as [Avg Price], avg(P_price*p_qoh) as [Avg. Value]
FROM product
/*--------------------------------------
GROUPING DATA using having clause
----------------------------------------*/
/* 10. Display average price of products supplied by each vendor. The
response should display vendor code along with the average price of
products supplied by that vendor code
*/
Select v_code, avg(p_price) as [Average Price]
from Product
Group by v_code
Order By v_code
/*
11. Suppose out of all these vendor codes, we are interested only in the
average price of vendors 23119, 24288, and 25595.
Then we apply the Having Clause to extract only those groups meeting
this criteria
*/
Select v_code, avg(p_price) as [Average Price]
from Product
Group by v_code
Having v_code in (23119, 24288, 25595)
Order By v_code
/* 12. What if we want to list the highest price product supplied by each
vendor */
Select v_code, max(p_price) as [Highest Price]
from Product
Group by v_code
Order By v_code
/* What if we had run the following query? Will we get the same
results as the one above? What's the difference
*/
Select v_code, max(p_price) as [Highest Price]
from Product
where v_code in (23119, 24288, 25595)
Group by v_code
Order By v_code
/* 13. what if we are interested in the avg proice of products supplied
by each vendor. However, we only want to look at those where the
highest price of products supplied by the vendor is in excess of
$20.00
*/
Select v_code, avg(p_price) as [Averaget Price]
From Product
Where max(p_price) > 20.00
Group By v_code
Order By v_code --- are we getting error?
Select v_code, avg(p_price) as [Average Price]
From Product
Group By v_code
Having max(p_price) > 20.00
Order By v_code
/* 14. List the highest and lowest price of products supplied by each vendor. We 
are
interested only in those vendors where the lowest price is in excess of $20.00 and 
highest price is in 
excess of $200.00 
*/
Select v_code, max(p_price) as [Highest Price], min (p_price) as [Lowest Price]
from product
group by v_code
Having min(p_price) > 10.00 and max(p_price) <200
Order By v_code
/*--------------------------------------
RETRIEVING DATA FROM MULTIPLE TABLES
----------------------------------------*/
/*
1. List all products suplied by vendors - we need to display product's
code, description, vendor name,
vendor contact info.
Product information is contained in the product table and vendor
information in vendor table. The common attribute between the tables
is v_code.
*/
SELECT p_code, p_descript, v_name, v_contact, v_areacode, v_phone
FROM Vendor INNER JOIN Product
ON Vendor.v_code =
Product.v_code
/* Types of Joins
1. Inner Join or Join - only retrieve records that match on
values in the common attribute
2. Outer Join - retrieve both matched and unmatched records
a. Left Join
b. Right Join
c. Full Join
Inner Join and Left/Right outer joins are most
commonly used. The book describes different ways these joins are
implemented. We'll use only the JOIN ON syntax
*/
.
-- 2. List all products that are not supplied by any vendor. Include product code, 
--description and vendor name in your results.
Select p_code, p_descript, v_name
from Product left join Vendor
on Product.v_code = Vendor.v_code
where Product.v_code is null
---3. Write above query using right join 
Select p_code, p_descript, v_name
from Vendor right join Product
on Product.v_code = Vendor.v_code
where Product.v_code is null
---4. Write same query using table aliases
Select p_code, p_descript, v_name
from Product as p left join Vendor as v 
on p.v_code = v.v_code
where p.v_code is null
---5. Now include vendor code in your results.
Select p_code, p_descript, Vendor.v_code, v_name
from Product left join Vendor
on Product.v_code = Vendor.v_code
where Product.v_code is null
/* 6. List all the products that have been purchased. Display the product
code, product description, invoice number, qty ordered/purchased, and
unit price paid.
*/
select product.p_code, p_descript,inv_number, line_units,
line_price
from Product inner join Line
on Product.p_code = Line.p_code
---7. Now include total value in query of 6.
select product.p_code, p_descript,inv_number, line_units,
line_price, (line_units*line_price) as [TotValue]
from Product inner join Line
on Product.p_code = Line.p_code
--8. of these list only where the total value exceeds $100.00
select product.p_code, p_descript,inv_number, line_units,
line_price, (line_units*line_price) as [TotValue]
from Product inner join Line
on Product.p_code = Line.p_code
where (line_units*line_price) > 100.00
--9. List total value by each invoice number. 
select inv_number, sum(line_units*line_price) as [TotValue] 
from Product inner join Line
on Product.p_code = Line.p_code
Group by inv_number
Order By inv_number
--10. List total value by invoice number. Show also the customer code who purchased
the products along with invoice number and total value.Show the results for each 
customer code by invoice number.
select cus_code, line.inv_number, sum(line_units*line_price) as [TotValue]
from Product inner join Line
on Product.p_code = Line.p_code
inner join Invoice on invoice.inv_number =
line.inv_number
Group by cus_code, line.inv_number
Order By cus_code, inv_number
--11. display only specififed customer code
select cus_code, line.inv_number, sum(line_units*line_price) as [TotValue]
from Product inner join Line
on Product.p_code = Line.p_code
inner join Invoice on invoice.inv_number =
line.inv_number
Group by cus_code, line.inv_number
Having cus_code = 10011
Order By cus_code, inv_number
-- 12. now include the customer name
select Customer.cus_code, cus_lname, cus_fname, line.inv_number, 
sum(line_units*line_price) as [TotValue]
from Product inner join Line
on Product.p_code = Line.p_code
inner join Invoice 
on invoice.inv_number = line.inv_number inner join Customer 
on Customer.cus_code = invoice.cus_code
Group by Customer.cus_code, cus_lname, cus_fname, line.inv_number
Order By Customer.cus_code, inv_number
---13. Find the vendors who are from same state from the Vendor table. Return 
--vendor name and state in your results.
select v_name, v_state
from Vendor
group by v_state, v_name 
order by v_state
---14. Return every combination of vendor name with product description for those 
--vendors only who have supplied products.  
select V_NAME, P_CODE
from Vendor cross join Product
where Vendor.v_code = Product.v_code

select V_NAME, P_CODE
from Vendor cross join Product
where product.V_CODE is not null and vendor.V_code in (select v_code from product where v_code is not null) 