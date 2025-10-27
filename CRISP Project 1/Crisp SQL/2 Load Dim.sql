-- 2 loading dimensions

USE adventureworks_dw;

-- Load Customers
INSERT INTO dim_customers (
  customer_id, account_number, customer_type, address_type,
  address_line1, address_line2, city, state_province_code, state_province,
  postal_code, country_code, country_region, sales_territory_group, sales_territory
)
SELECT
  CustomerID, AccountNumber, CustomerType, AddressType,
  AddressLine1, AddressLine2, City, StateProvinceCode, `State_Province`,
  PostalCode, CountryRegionCode, `Country_Region`, `Sales Territory Group`, `Sales Territory`
FROM adventureworks.dim_customers_vw;

-- Load Employees
INSERT INTO dim_employees (
  employee_id, national_id_number, login_id, manager_id,
  first_name, middle_name, last_name, title, email_address, phone,
  birth_date, marital_status, gender, hire_date, salaried_flag,
  vacation_hours, sick_leave_hours, current_flag
)
SELECT
  EmployeeID, NationalIDNumber, LoginID, ManagerID,
  FirstName, MiddleName, LastName, Title, EmailAddress, Phone,
  BirthDate, MaritalStatus, Gender, HireDate, SalariedFlag,
  VacationHours, SickLeaveHours, CurrentFlag
FROM adventureworks.dim_employee_vw;

-- Load Products
INSERT INTO dim_products (
  product_id, product_name, product_number, color, standard_cost, list_price,
  size, weight, days_to_manufacture, product_line, class, style,
  product_category, product_subcategory, product_model, sell_start_date, sell_end_date, discontinued_date
)
SELECT
  ProductID, Name, ProductNumber, Color, StandardCost, ListPrice,
  Size, Weight, DaysToManufacture, ProductLine, Class, Style,
  ProductCategory, ProductSubcategory, ProductModel, SellStartDate, SellEndDate, DiscontinuedDate
FROM adventureworks.dim_products_vw;

-- Load Vendors
INSERT INTO dim_vendors (
  vendor_id, account_number, name, credit_rating, preferred_vendor_flag, active_flag,
  address_type, address_line1, address_line2, city, state_province_code, state_province, postal_code
)
SELECT
  VendorID, AccountNumber, Name, CreditRating, PreferredVendorStatus, ActiveFlag,
  AddressType, AddressLine1, AddressLine2, City, StateProvinceCode, `State_Province`, PostalCode
FROM adventureworks.dim_vendors_vw;
