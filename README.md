# Supply Chain Performance Analytics Dashboard

### MySQL · SQL · Python · Pandas · Power BI

An end-to-end supply chain analytics project that transforms raw transactional CSV data into meaningful business insights. The project uses MySQL for database design and SQL analysis, Python for data extraction and processing, and Power BI to build an interactive three-page dashboard for analyzing market performance, product performance, and shipping efficiency.

---

# 🛠️ Project Workflow

1. **Database Setup**
   - Created a MySQL database and imported the raw supply chain dataset into a staging table.

2. **Data Validation & Normalization**
   - Validated imported data, converted date fields, and organized the dataset into a Star Schema consisting of fact and dimension tables.

3. **SQL Analytics**
   - Wrote SQL queries to analyze:
     - Market performance
     - Product category performance
     - Shipping mode efficiency

4. **Python Data Processing**
   - Connected Python to MySQL using SQLAlchemy.
   - Executed SQL queries.
   - Loaded results into pandas DataFrames.
   - Exported summarized datasets as CSV files.

5. **Power BI Dashboard**
   - Built an interactive three-page Power BI dashboard using the generated CSV files.

---

# 💾 Database Design

The project follows a Star Schema for efficient analytical querying.

### Fact Table

**fact_order_items**

Contains transactional information such as:

- Sales
- Quantity
- Discount
- Delivery Status
- Shipping Dates
- Shipping Time
- Benefit per Order

### Dimension Tables

**dim_customers**

- Customer Details
- Customer Segment
- Customer Location

**dim_products**

- Product Information
- Category
- Department
- Price

**dim_orders**

- Order Information
- Market
- Region
- Order Status

---

# 📊 Dashboard Overview

The Power BI dashboard consists of three pages.

## 1. Market Performance

Analyzes different global markets using:

- Total Sales
- Shipment Volume
- Average Shipping Time
- Late Delivery Percentage

---

## 2. Product Performance

Analyzes product categories based on:

- Total Revenue
- Total Items Sold
- Average Delivery Time
- Average Delivery Delay

---

## 3. Shipping Efficiency

Compares shipping modes using:

- Total Shipments
- Average Shipping Time
- Average Delivery Delay

---

# 📂 Repository Structure

```text
├── datasets/
│   └── Raw supply chain CSV dataset
│
├── SQL_queries/
│   ├── 01_database_setup.sql
│   ├── 02_data_ingestion.sql
│   ├── 03_data_cleaning_prep.sql
│   └── 04_schema_normalization.sql
│
├── Source_Code.ipynb
│
├── output/
│
├── supply_chain_analysis.pbix
├── supply_chain_analysis.pdf
├── README.md
└── .gitignore
```

---

# 🚀 Tech Stack

- **Database:** MySQL
- **Query Language:** SQL
- **Programming:** Python
- **Libraries:** Pandas, SQLAlchemy
- **Visualization:** Power BI

---

# 📈 Key Business Insights

This project helps answer questions such as:

- Which market generates the highest revenue?
- Which product categories perform best?
- Which shipping mode is most efficient?
- Which markets experience higher delivery delays?
- How does shipping performance vary across different transportation methods?
