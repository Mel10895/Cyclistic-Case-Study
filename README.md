# Cyclistic-Case-Study

**Role:** Data Analyst 
• **Tools:** SQL Server, Power BI, Excel • 
**Timeline:** [08 2025]  
**Goal:** Use 12 months of trip data to understand how **annual members** and **casual riders** differ, and recommend actions to grow memberships.

---

## Business Task
Increase annual memberships by identifying ride behavior differences and actionable levers in product, pricing, and marketing.

## Data
- Source: Cyclistic (Divvy) public trip data, 12 CSVs ([2024-07 to 2025-06])
- Rows: ~[5,597,025] rides • Columns: 13
- Scope: Chicago area shared bikes
- Privacy: Aggregated, public, no PII

## Tools & Stack
- **Excel:** quick profiling/cleaning
- **SQL Server (SSMS):** cleaning, joining, transformations  
- **Power BI:** visualization & dashboard  

## Method (Google DA 6 Steps)
1. **Ask** – What behaviors differ by rider type?  
2. **Prepare** – Imported 12 CSVs into Excel for initial profiling  
3. **Process** – 
   - In **Excel**:  
     - Removed duplicates  
     - Dropped `start_station_name` and `end_station_name` because >70% values were NULL  
     - Added `day_of_week` and `month` helper columns   
3. **Process** – Cleaning rules:
   - Drop rides with `started_at > ended_at`
   - Exclude durations ≤ 0 or > 24 hours
   - Remove rows with NULL `ride_id`
4. **Analyze** – Core questions:
   - Avg ride length by user type / weekday / month  
   - Trip volume by weekday & month (seasonality)  
   - Bike type usage by user type  
5. **Share** – Power BI dashboard (link below)  
6. **Act** – Recommendations to convert casual → member

