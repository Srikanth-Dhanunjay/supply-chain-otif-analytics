-- ============================================================================
-- PROJECT: Supply Chain Efficiency & OTIF Analytics
-- SCRIPT:  04_schema_normalization.sql
-- PURPOSE: Building the Star Schema Production Warehouse. Extracts, 
--          deduplicates, and loads data into Fact and Dimension tables.
-- ============================================================================

USE supply_chain_db;

-- ----------------------------------------------------------------------------
-- STEP 1: BUILD AND POPULATE DIM_CUSTOMERS
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dim_customers (
    customer_id INT PRIMARY KEY,
    customer_fname VARCHAR(50),
    customer_lname VARCHAR(50),
    customer_segment VARCHAR(50),
    customer_city VARCHAR(50),
    customer_state VARCHAR(50),
    customer_country VARCHAR(50),
    customer_street VARCHAR(150),
    customer_zipcode VARCHAR(20)
);

TRUNCATE TABLE dim_customers;

INSERT INTO dim_customers
SELECT DISTINCT 
    customer_id, customer_fname, customer_lname, customer_segment,
    customer_city, customer_state, customer_country, customer_street, customer_zipcode
FROM staging_supply_chain;


-- ----------------------------------------------------------------------------
-- STEP 2: BUILD AND POPULATE DIM_PRODUCTS
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dim_products (
    product_card_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_category_id INT,
    category_name VARCHAR(50),
    product_price DECIMAL(10,2),
    department_id INT,
    department_name VARCHAR(50)
);

TRUNCATE TABLE dim_products;

INSERT INTO dim_products
SELECT DISTINCT 
    product_card_id, product_name, product_category_id, category_name,
    product_price, department_id, department_name
FROM staging_supply_chain;


-- ----------------------------------------------------------------------------
-- STEP 3: BUILD AND POPULATE DIM_ORDERS
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS dim_orders (
    order_id INT PRIMARY KEY,
    payment_type VARCHAR(50),
    order_status VARCHAR(50),
    order_city VARCHAR(50),
    order_state VARCHAR(50),
    order_country VARCHAR(50),
    order_region VARCHAR(50),
    market VARCHAR(50)
);

TRUNCATE TABLE dim_orders;

INSERT INTO dim_orders
SELECT DISTINCT 
    order_id, type, order_status, order_city, 
    order_state, order_country, order_region, market
FROM staging_supply_chain;


-- ----------------------------------------------------------------------------
-- STEP 4: BUILD AND POPULATE THE CENTRAL EVENT TABLE (FACT_ORDER_ITEMS)
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS fact_order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    product_card_id INT,
    order_datetime DATETIME,
    shipping_datetime DATETIME,
    days_for_shipping_real INT,
    days_for_shipment_scheduled INT,
    late_delivery_risk INT,
    delivery_status VARCHAR(50),
    shipping_mode VARCHAR(50),
    order_item_quantity INT,
    sales DECIMAL(10,2),
    order_item_total DECIMAL(10,2),
    benefit_per_order DECIMAL(10,2),
    order_item_discount DECIMAL(10,2)
);

TRUNCATE TABLE fact_order_items;

INSERT INTO fact_order_items
SELECT 
    order_item_id, order_id, customer_id, product_card_id,
    order_datetime, shipping_datetime, days_for_shipping_real, days_for_shipment_scheduled,
    late_delivery_risk, delivery_status, shipping_mode, order_item_quantity,
    sales, order_item_total, benefit_per_order, order_item_discount
FROM staging_supply_chain;


-- ----------------------------------------------------------------------------
-- STEP 5: PRODUCTION DATA VOLUME AUDIT
-- Confirm data volumes across all tables to verify complete extraction.
-- ----------------------------------------------------------------------------
SELECT 'dim_customers' AS table_name, COUNT(*) AS row_count FROM dim_customers
UNION ALL
SELECT 'dim_products', COUNT(*) FROM dim_products
UNION ALL
SELECT 'dim_orders', COUNT(*) FROM dim_orders
UNION ALL
SELECT 'fact_order_items', COUNT(*) FROM fact_order_items;