# Supply Chain OTIF & Delivery Risk Analytics
### MySQL · Python · Power BI | Global Logistics Performance

An end-to-end data pipeline processing simulated global logistics performance. This project integrates a relational MySQL database with Python feature engineering to deliver a premium, interactive three-page Power BI dashboard.

---

## 🛠️ System Architecture & Workflow

1. **Ingestion & Preprocessing**: SQL script handles bulk ingestion, cleaning, and structural normalization of raw transactional CSV records.
2. **Relational Database Modeling**: Built a structured **Star Schema** within a MySQL environment, parsing flat data into optimized tables.
3. **Analytical Feature Engineering**: Derived logistics distribution metrics and saved refined summaries into the `/output` directory as standalone CSV files.
4. **Bespoke BI Delivery**: Developed an interactive 3-page Power BI application utilizing native header page navigation rails to eliminate manual client page hunting.

---

## 💾 Database Modeling & SQL Engineering (MySQL)

Raw CSV files were mapped into an optimized staging layer using explicit data types, primary keys, and foreign key constraints to build a clean reporting schema:

*   **Fact Table**: `fact_order_items` (Captures financial values, real shipping timelines, and calculated delivery risk metrics).
*   **Dimension Tables**: `dim_orders` (Shipping modes and status), `dim_products` (Categories and SKUs), and `dim_customers` (Customer Information).

> **Note:** Relational DDL definitions and metric aggregation scripts are fully documented in the `/SQL_queries` folder.

---

## 📊 Interactive Power BI Dashboard Application

The front-end interface features a modern UI/UX floating container layout with three distinct, interconnected reporting layers connected via an inline header button rail:

1. **Market Analysis**: Evaluates regional revenue scales against core delivery threat baselines.
2. **Product Performance**: Uses `Top N` filtering to isolate the Top 10 product categories by total revenue alongside the Top 10 categories suffering the worst average fulfillment delays.
3. **Logistics Efficiency**: Compares total shipment volume distributions directly alongside average fulfillment delays across different carrier shipping modes.
---

## 📂 Repository Blueprint

```text
├── datasets/                  # Raw input supply chain transactional files
├── output/                   # Processed analytic CSV exports and dashboard asset captures
├── SQL_queries/              # Structured MySQL database mapping and metric logic scripts
├── .gitignore                # System and environmental file filter configuration
├── supply_chain_analysis.pbix     # Master Power BI Desktop application architecture
└── supply_chain_analysis.pdf      # Static PDF export of the Power BI dashboard pages
