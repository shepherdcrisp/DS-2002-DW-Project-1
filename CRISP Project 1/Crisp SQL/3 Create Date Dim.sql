-- 3 - create dim date 
USE adventureworks_dw;

INSERT INTO dim_date (full_date)
SELECT DISTINCT DATE(OrderDate)
FROM adventureworks.salesorderheader
UNION
SELECT DISTINCT DATE(ShipDate)
FROM adventureworks.salesorderheader
UNION
SELECT DISTINCT DATE(DueDate)
FROM adventureworks.salesorderheader
UNION
SELECT DISTINCT DATE(OrderDate)
FROM adventureworks.purchaseorderheader
UNION
SELECT DISTINCT DATE(ShipDate)
FROM adventureworks.purchaseorderheader;
