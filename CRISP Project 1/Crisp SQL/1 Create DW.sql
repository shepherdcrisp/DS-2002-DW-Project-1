-- 1 - create dw 
DROP DATABASE IF EXISTS adventureworks_dw;
CREATE DATABASE adventureworks_dw;
USE adventureworks_dw;

-- Dimension: Customers
CREATE TABLE dim_customers (
  customer_key INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  account_number VARCHAR(50),
  customer_type VARCHAR(20),
  address_type VARCHAR(50),
  address_line1 VARCHAR(100),
  address_line2 VARCHAR(100),
  city VARCHAR(50),
  state_province_code VARCHAR(10),
  state_province VARCHAR(50),
  postal_code VARCHAR(20),
  country_code VARCHAR(10),
  country_region VARCHAR(50),
  sales_territory_group VARCHAR(50),
  sales_territory VARCHAR(50)
);

-- Dimension: Employees
CREATE TABLE dim_employees (
  employee_key INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT,
  national_id_number VARCHAR(20),
  login_id VARCHAR(100),
  manager_id INT,
  first_name VARCHAR(50),
  middle_name VARCHAR(50),
  last_name VARCHAR(50),
  title VARCHAR(100),
  email_address VARCHAR(100),
  phone VARCHAR(25),
  birth_date DATE,
  marital_status CHAR(1),
  gender CHAR(1),
  hire_date DATE,
  salaried_flag TINYINT(1),
  vacation_hours SMALLINT,
  sick_leave_hours SMALLINT,
  current_flag TINYINT(1)
);

-- Dimension: Products
CREATE TABLE dim_products (
  product_key INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  product_name VARCHAR(100),
  product_number VARCHAR(50),
  color VARCHAR(30),
  standard_cost DECIMAL(19,4),
  list_price DECIMAL(19,4),
  size VARCHAR(10),
  weight DECIMAL(10,2),
  days_to_manufacture INT,
  product_line VARCHAR(5),
  class VARCHAR(5),
  style VARCHAR(5),
  product_category VARCHAR(50),
  product_subcategory VARCHAR(50),
  product_model VARCHAR(100),
  sell_start_date DATETIME,
  sell_end_date DATETIME,
  discontinued_date DATETIME
);

-- Dimension: Vendors
CREATE TABLE dim_vendors (
  vendor_key INT AUTO_INCREMENT PRIMARY KEY,
  vendor_id INT,
  account_number VARCHAR(50),
  name VARCHAR(100),
  credit_rating TINYINT,
  preferred_vendor_flag TINYINT(1),
  active_flag TINYINT(1),
  address_type VARCHAR(50),
  address_line1 VARCHAR(60),
  address_line2 VARCHAR(60),
  city VARCHAR(50),
  state_province_code VARCHAR(10),
  state_province VARCHAR(50),
  postal_code VARCHAR(20)
);

-- Date Dimension 
CREATE TABLE dim_date (
  full_date DATE NOT NULL,
  date_key INT GENERATED ALWAYS AS (YEAR(full_date)*10000 + MONTH(full_date)*100 + DAY(full_date)) STORED,
  PRIMARY KEY (date_key),
  UNIQUE KEY uq_full_date (full_date)
);

-- Fact tables 
CREATE TABLE fact_sales_orders LIKE adventureworks.fact_sales_orders_vw;
CREATE TABLE fact_purchase_orders LIKE adventureworks.fact_purchase_orders_vw;
