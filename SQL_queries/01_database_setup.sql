-- ============================================================================
-- PROJECT: Supply Chain Efficiency & OTIF Analytics
-- SCRIPT:  01_database_setup.sql
-- PURPOSE: Initialize the database and build the high-capacity staging table
--          to serve as our operational loading dock.
-- ============================================================================

-- Step 1: Create the target analytics environment if it does not exist
CREATE DATABASE IF NOT EXISTS supply_chain_db;
USE supply_chain_db;

-- Step 2: Drop the staging table if it exists to allow for a clean, repeatable run
DROP TABLE IF EXISTS staging_supply_chain;

-- Step 3: Define the comprehensive structure for our raw data ingest
CREATE TABLE staging_supply_chain (
    type VARCHAR(50),
    days_for_shipping_real INT,
    days_for_shipment_scheduled INT,
    benefit_per_order DECIMAL(10,2),
    sales_per_customer DECIMAL(10,2),
    delivery_status VARCHAR(100),
    late_delivery_risk INT,
    category_id INT,
    category_name VARCHAR(100),
    customer_city VARCHAR(100),
    customer_country VARCHAR(100),
    customer_email VARCHAR(100),
    customer_fname VARCHAR(100),
    customer_id INT,
    customer_lname VARCHAR(100),
    customer_password VARCHAR(100),
    customer_segment VARCHAR(100),
    customer_state VARCHAR(50),
    customer_street VARCHAR(255),
    customer_zipcode VARCHAR(50),
    department_id INT,
    department_name VARCHAR(100),
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    market VARCHAR(100),
    order_city VARCHAR(100),
    order_country VARCHAR(100),
    order_customer_id INT,
    order_date_dateorders VARCHAR(100),
    order_id INT,
    order_item_cardprod_id INT,
    order_item_discount DECIMAL(10,2),
    order_item_discount_rate DECIMAL(5,2),
    order_item_id INT,
    order_item_product_price DECIMAL(10,2),
    order_item_profit_ratio DECIMAL(5,2),
    order_item_quantity INT,
    sales DECIMAL(10,2),
    order_item_total DECIMAL(10,2),
    order_profit_per_order DECIMAL(10,2),
    order_region VARCHAR(100),
    order_state VARCHAR(100),
    order_status VARCHAR(100),
    order_zipcode VARCHAR(50),
    product_card_id INT,
    product_category_id INT,
    product_description VARCHAR(255),
    product_image VARCHAR(255),
    product_name VARCHAR(255),
    product_price DECIMAL(10,2),
    product_status INT,
    shipping_date_dateorders VARCHAR(100),
    shipping_mode VARCHAR(100)
);

-- Step 4: Verify the table was created successfully with an empty structure
SELECT * FROM staging_supply_chain LIMIT 0;