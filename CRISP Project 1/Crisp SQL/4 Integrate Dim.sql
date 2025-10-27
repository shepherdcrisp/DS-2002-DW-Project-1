-- 4 - integrate dims

USE adventureworks_dw;

-- Add surrogate key columns to fact tables
ALTER TABLE fact_sales_orders
  ADD COLUMN customer_key INT,
  ADD COLUMN employee_key INT,
  ADD COLUMN product_key INT,
  ADD COLUMN order_date_key INT,
  ADD COLUMN ship_date_key INT,
  ADD COLUMN due_date_key INT;

ALTER TABLE fact_purchase_orders
  ADD COLUMN employee_key INT,
  ADD COLUMN vendor_key INT,
  ADD COLUMN product_key INT,
  ADD COLUMN order_date_key INT,
  ADD COLUMN ship_date_key INT,
  ADD COLUMN due_date_key INT;

-- Map facts to dimensions
UPDATE fact_sales_orders f
JOIN dim_customers dc ON f.CustomerID = dc.customer_id
SET f.customer_key = dc.customer_key;

UPDATE fact_sales_orders f
JOIN dim_employees de ON f.SalesPersonID = de.employee_id
SET f.employee_key = de.employee_key;

UPDATE fact_sales_orders f
JOIN dim_products dp ON f.ProductID = dp.product_id
SET f.product_key = dp.product_key;

UPDATE fact_sales_orders f
JOIN dim_date dd ON DATE(f.OrderDate) = dd.full_date
SET f.order_date_key = dd.date_key;

UPDATE fact_sales_orders f
JOIN dim_date dd ON DATE(f.ShipDate) = dd.full_date
SET f.ship_date_key = dd.date_key;

UPDATE fact_sales_orders f
JOIN dim_date dd ON DATE(f.DueDate) = dd.full_date
SET f.due_date_key = dd.date_key;

-- Purchases
UPDATE fact_purchase_orders f
JOIN dim_employees de ON f.EmployeeID = de.employee_id
SET f.employee_key = de.employee_key;

UPDATE fact_purchase_orders f
JOIN dim_vendors dv ON f.VendorID = dv.vendor_id
SET f.vendor_key = dv.vendor_key;

UPDATE fact_purchase_orders f
JOIN dim_products dp ON f.ProductID = dp.product_id
SET f.product_key = dp.product_key;

UPDATE fact_purchase_orders f
JOIN dim_date dd ON DATE(f.OrderDate) = dd.full_date
SET f.order_date_key = dd.date_key;

UPDATE fact_purchase_orders f
JOIN dim_date dd ON DATE(f.ShipDate) = dd.full_date
SET f.ship_date_key = dd.date_key;

UPDATE fact_purchase_orders f
JOIN dim_date dd ON DATE(f.DueDate) = dd.full_date
SET f.due_date_key = dd.date_key;
