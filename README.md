# MTA-GTFS-Data-Warehouse

This project implements a complete ETL pipeline and analytical workflow for the MTA Brooklyn bus network using GTFS (General Transit Feed Specification) data. The pipeline includes raw data ingestion, transformation using Python (Pandas and Snowpark), and loading into Snowflake to build a scalable and query-efficient data warehouse. The goal of this project is to enable rich transit analysis, including visualizing stop-level travel times, identifying high-latency routes, and enabling peak-hour diagnostics. Tableau serves as the BI layer for interactive dashboards that support operational insights and route optimization across Brooklyn’s bus system.

---

## 🚀 Tech Stack
- **Data Processing & ETL:** Python, Pandas, Snowpark
- **Data Warehousing:** Snowflake
- **Data Visualization:** Tableau
- **Others:** SQL, Matplotlib, Plotly

---

## 📁 Part 1 – Data Modeling

The source GTFS dataset consists of multiple `.txt` files, including:

- `stops.txt`
- `calendar_dates.txt`
- `calendar.txt`
- `routes.txt`
- `shapes.txt`
- `stop_times.txt`
- `trips.txt`
- `agency.txt`

These files were used to design a Snowflake schema with clearly defined dimension and fact tables.

![Schema Screenshot](https://github.com/user-attachments/assets/5d0c82cc-d9b0-4161-a58f-18f7c0ab5f20)

---

## 🧹 Part 2 – Data Cleansing & Preparation

Data was cleaned and preprocessed using Python and Pandas:

- Removed irrelevant or redundant columns
- Standardized timestamps exceeding 24:00:00 format
- Eliminated null or malformed entries
- Joined stop and trip data for enriched analysis

---

## 🛠️ Part 3 – ETL and Snowflake Loading

Processed data was structured into dimension and fact tables:

- Efficient schema design for fast querying
- Utilized Snowflake’s Python connector for batch uploads
- Views created for downstream Tableau consumption

---

## 📊 Part 4 – BI & Visualization with Tableau

Once the data was modeled and available in Snowflake, it was connected to Tableau for analytics and dashboarding:

- Interactive route-level analysis
- Stop-level average travel times
- Temporal heatmaps and travel flow charts
- Cumulative trip visualizations by stop sequence
- Interactive Map of stops and routes
- Comprehensive analytics of the routes and services

![Dashboard Screenshot](https://github.com/user-attachments/assets/d8a19874-14d2-47d4-a4ca-79f29203b0e6)

![Screenshot 2025-06-06 070218](https://github.com/user-attachments/assets/79780dac-eabd-431c-9766-dab89817a545)

**Link to Public Dashboard** - https://public.tableau.com/app/profile/albet.bagdasarov/viz/MTA_17492074403020/General

---

## 📌 Highlights

- Built and deployed a transit data warehouse in Snowflake
- Cleaned and transformed complex GTFS data using Python
- Designed analytical dashboards in Tableau for transportation insights
- Demonstrated data-driven methods for optimizing public transit systems

---
