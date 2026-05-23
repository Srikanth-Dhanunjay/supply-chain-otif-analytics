-- ============================================================================
-- PROJECT: Supply Chain Efficiency & OTIF Analytics
-- SCRIPT:  03_data_cleaning_prep.sql
-- PURPOSE: Data quality assurance, row-level audits, and integrity tracking.
-- ============================================================================

USE supply_chain_db;

-- ----------------------------------------------------------------------------
-- AUDIT TASK 1: Confirm Complete Timestamp Population
-- Inspect the first 5 records to visually verify that our new DATETIME tracks
-- align perfectly with the original text columns.
-- ----------------------------------------------------------------------------
SELECT 
    order_date_dateorders AS original_order_text,
    order_datetime AS parsed_order_datetime,
    shipping_date_dateorders AS original_shipping_text,
    shipping_datetime AS parsed_shipping_datetime
FROM staging_supply_chain
LIMIT 5;

-- ----------------------------------------------------------------------------
-- AUDIT TASK 2: High-Fidelity Data Integrity Checks
-- Run conditional aggregations to hunt for missing records (NULLs) or 
-- chronological paradoxes (shipping occurring before an order is placed).
-- ----------------------------------------------------------------------------
SELECT 
    COUNT(*) AS total_records_checked,
    COUNT(CASE WHEN order_id IS NULL THEN 1 END) AS missing_order_ids,
    COUNT(CASE WHEN customer_id IS NULL THEN 1 END) AS missing_customer_ids,
    COUNT(CASE WHEN order_datetime IS NULL THEN 1 END) AS failed_date_parsers,
    COUNT(CASE WHEN shipping_datetime < order_datetime THEN 1 END) AS logical_date_anomalies
FROM staging_supply_chain;