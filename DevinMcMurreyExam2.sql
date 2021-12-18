--Devin McMurrey A00601445 

use Large_Co
go


--Q1
select concat (emp_Lname, ',',space (3) ,EMP_FNAME)as [Full Name] , EMP_TITLE as Title, EMP_EMAIL as [Email Address] -- I used space (3) just to try and give is some separation :)
from LGEMPLOYEE
where DEPT_NUM = 550 and (year(EMP_HIREDATE) = 1982 or year(EMP_HIREDATE) = 1983)
order by EMP_LNAME, EMP_FNAME

--Q2
select Ven.VEND_ID, VEND_NAME, VEND_CITY, VEND_STATE, Sup.PROD_SKU, PROD_CATEGORY, PROD_DESCRIPT, BRAND_NAME
from LGVENDOR as Ven inner join LGSUPPLIES as Sup on Ven.VEND_ID = Sup.VEND_ID inner join LGPRODUCT as Prod on Sup.PROD_SKU = Prod.PROD_SKU 
inner join LGBRAND as Brand on Prod.BRAND_ID = Brand.BRAND_ID
where PROD_CATEGORY = 'primer' and PROD_PRICE > 10 and PROD_QOH <= 25
order by Sup.PROD_SKU

--Q3
select CUS.CUST_CODE , CUST_FNAME, CUST_LNAME, CUST_CITY as [Customer City], CUST_STATE as [Customer State], count(INV_NUM) AS [INVOICE COUNT] 
from LGCUSTOMER AS CUS inner join LGINVOICE AS INV ON CUS.CUST_CODE = INV.CUST_CODE 
WHERE CUST_STATE = 'OH'
GROUP BY CUS.CUST_CODE, CUST_FNAME, CUST_LNAME, CUST_CITY, CUST_STATE
HAVING COUNT(INV_NUM) >= 5
ORDER BY COUNT(INV_NUM) DESC

--Q4 
select EMP.EMP_NUM, INV.EMPLOYEE_ID 
From LGEMPLOYEE AS EMP left join LGINVOICE AS INV
on EMP.EMP_NUM = INV.EMPLOYEE_ID 
where INV.EMPLOYEE_ID is null
Select EMP.EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_TITLE AS [TITLE]
From LGEMPLOYEE AS EMP left join LGINVOICE AS INV
on EMP.EMP_NUM = INV.EMPLOYEE_ID
where INV.EMPLOYEE_ID is null
order by EMP_LNAME, EMP_FNAME
--or 
Select EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_TITLE AS [TITLE]
From LGEMPLOYEE 
where EMP_NUM not in
(select EMPLOYEE_ID
from LGINVOICE
where EMPLOYEE_ID is not null)
ORDER BY EMP_LNAME, EMP_FNAME

--Q5
SELECT BRAND_NAME, BRAND_TYPE, PROD_SKU, PROD_DESCRIPT, concat('$',PROD_PRICE)
FROM LGBRAND AS BRAND INNER JOIN LGPRODUCT AS PROD
ON BRAND.BRAND_ID = PROD.BRAND_ID
WHERE BRAND_TYPE = 'VALUE' and prod_price > (SELECT avg(PROD_PRICE)
FROM LGBRAND AS BRAND INNER JOIN LGPRODUCT AS PROD 
ON BRAND.BRAND_ID = PROD.BRAND_ID
WHERE BRAND_TYPE = 'PREMIUM')
order by PROD_PRICE desc;


--Q6
CREATE TABLE tempLGProduct 
(
PROD_SKU VARCHAR(15) NOT NULL Primary Key,
PROD_DESCRIPT VARCHAR(255) Not Null,
PROD_TYPE VARCHAR(255) Not Null,
PROD_BASE VARCHAR(255) Not Null,
PROD_CATEGORY VARCHAR(255) Not Null,
PROD_PRICE NUMERIC(10, 2) Not Null Check(PROD_PRICE >= 0),
PROD_QOH INT Not Null,
PROD_MIN INT Null,
BRAND_ID NUMERIC(4,0) Null references LGBRAND(BRAND_ID)
);


--Q7
INSERT INTO [dbo].[tempLGProduct]
           ([PROD_SKU],[PROD_DESCRIPT],[PROD_TYPE],[PROD_BASE],[PROD_CATEGORY],[PROD_PRICE],[PROD_QOH],[PROD_MIN],[BRAND_ID])
     VALUES
           ('9998-YY1','Traffic Paint','Exterior',  'Water', 'Top Coat',  7.00,  15,  50,  35  ),
		   ('9999-YY2','Primer,Non-vinyl Wash','Interior',  'Solvent', 'Primer',  18.00,  68,  55,  35)
	GO
	
--Q8
Update [tempLGProduct]
set Prod_Base = 'Solvent-YY' where PROD_SKU = '9999-YY2'

--SELECT *
--FROM tempLGProduct (JUST USING THIS SIMILAR TO A PRINT STATMENT IN PYTHON TO CHECK MY WORK =)

--Q9
DELETE FROM tempLGProduct WHERE PROD_SKU = '9999-YY2'

--SELECT*
--FROM tempLGProduct

--Q10

CREATE VIEW vw_ProductsByBrand
as
SELECT BRAND_NAME, COUNT(PROD_SKU) as [PRODUCT COUNT],concat('$',AVG(PROD_PRICE)) as [AVERAGE PRICE]  from 
LGBRAND INNER JOIN LGPRODUCT on LGBRAND.BRAND_ID = LGPRODUCT.BRAND_ID
GROUP BY BRAND_NAME
GO
