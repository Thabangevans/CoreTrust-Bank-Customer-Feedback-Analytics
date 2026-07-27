-- ==========================================================
-- CoreTrust Bank Data Warehouse
-- Dimension Tables
-- ==========================================================

--------------------------------------------------------------
-- CUSTOMER DIMENSION
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS warehouse.dim_customer (

    customer_key SERIAL PRIMARY KEY,

    first_name VARCHAR(100),

    last_name VARCHAR(100),

    email VARCHAR(255) UNIQUE,

    phone VARCHAR(30)

);

--------------------------------------------------------------
-- BRANCH DIMENSION
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS warehouse.dim_branch (

    branch_key SERIAL PRIMARY KEY,

    branch_name VARCHAR(150) UNIQUE

);

--------------------------------------------------------------
-- SERVICE DIMENSION
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS warehouse.dim_service (

    service_key SERIAL PRIMARY KEY,

    service_name VARCHAR(150) UNIQUE

);

--------------------------------------------------------------
-- ISSUE CATEGORY DIMENSION
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS warehouse.dim_issue (

    issue_key SERIAL PRIMARY KEY,

    issue_category VARCHAR(150) UNIQUE

);

--------------------------------------------------------------
-- DATE DIMENSION
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS warehouse.dim_date (

    date_key DATE PRIMARY KEY,

    year INTEGER,

    quarter INTEGER,

    month INTEGER,

    month_name VARCHAR(20),

    day INTEGER,

    weekday VARCHAR(20)

);
