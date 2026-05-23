-- ============================================================================
-- PROJECT: Supply Chain Efficiency & OTIF Analytics
-- SCRIPT:  02_data_ingestion.sql (PURE SQL STRATEGY)
-- PURPOSE: Ingestion of raw DataCo CSV records using pure SQL variables.
-- ============================================================================

USE supply_chain_db;

-- Step 1: Ensure table is empty before reloading
TRUNCATE TABLE staging_supply_chain;

-- Physically add the two custom datetime columns to your staging table structure
ALTER TABLE staging_supply_chain 
ADD COLUMN order_datetime DATETIME,
ADD COLUMN shipping_datetime DATETIME;

-- Step 2: Execute bulk load with inside-memory transformation variables
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DataCoSupplyChainDataset.csv'
INTO TABLE staging_supply_chain
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- We map the sequential columns of the CSV file. 
-- We catch the 29th and 52nd column fields inside the temporary memory variables 
-- @raw_order_date and @raw_shipping_date before they touch the disk.
(type, days_for_shipping_real, days_for_shipment_scheduled, benefit_per_order, 
 sales_per_customer, delivery_status, late_delivery_risk, category_id, 
 category_name, customer_city, customer_country, customer_email, 
 customer_fname, customer_id, customer_lname, customer_password, 
 customer_segment, customer_state, customer_street, customer_zipcode, 
 department_id, department_name, latitude, longitude, market, 
 order_city, order_country, order_customer_id, @raw_order_date, 
 order_id, order_item_cardprod_id, order_item_discount, order_item_discount_rate, 
 order_item_id, order_item_product_price, order_item_profit_ratio, 
 order_item_quantity, sales, order_item_total, order_profit_per_order, 
 order_region, order_state, order_status, order_zipcode, product_card_id, 
 product_category_id, product_description, product_image, product_name, 
 product_price, product_status, @raw_shipping_date, shipping_mode)
SET 
  order_datetime = STR_TO_DATE(@raw_order_date, '%m/%d/%Y %H:%i'),
  shipping_datetime = STR_TO_DATE(@raw_shipping_date, '%m/%d/%Y %H:%i'),
  order_date_dateorders = @raw_order_date,
  shipping_date_dateorders = @raw_shipping_date;

-- Step 3: Verify execution row count
SELECT COUNT(*) AS total_rows_imported FROM staging_supply_chain;