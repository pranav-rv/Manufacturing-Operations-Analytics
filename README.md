# Manufacturing Operations Analytics

### An Experimental Analysis of Manufacturing Production, Quality, Downtime, Cost, and Operational Efficiency

## Overview

Manufacturing Operations Analytics is an end-to-end data analytics project designed to transform raw manufacturing operational data into actionable management insights.

The project analyzes production, quality, downtime, cost, and operational efficiency to help management identify performance gaps, prioritize improvement areas, and support data-driven decisions.

## Business Objective

The objective is to build a repeatable analytics pipeline that can:

- Improve production visibility
- Monitor plant and production-line performance
- Identify downtime drivers
- Detect quality and defect issues
- Analyze production cost and cost efficiency
- Prioritize operational improvement areas
- Support management decision-making with data

## Technology Stack

- **Python** — ETL, data cleaning, validation, and transformation
- **Pandas** — Data manipulation and preprocessing
- **SQL Server** — Centralized data storage
- **SQL** — Business analysis and KPI calculations
- **Power BI** — Interactive dashboards and visualization
- **Excel / CSV** — Raw data input
- **GitHub** — Version control and portfolio management

### Technology Flow

**Excel/CSV → Python + Pandas → SQL Server → SQL → Power BI → Business Insights**

## Project Workflow

```text
RAW DATA
Excel / CSV
     │
     ▼
PYTHON ETL
Load → Validate → Clean → Transform
     │
     ▼
SQL SERVER
Manufacturing_Operations_DB
     │
     ├──────────────────┐
     ▼                  ▼
SQL ANALYSIS      POWER BI
Business KPIs     Interactive
& Analysis        Dashboards
     │                  │
     └────────┬─────────┘
              ▼
       BUSINESS INSIGHTS
              │
              ▼
      MANAGEMENT ACTION PLAN
              │
              ▼
       DECISION SUPPORT
Python prepares the data → SQL stores and analyzes it → Power BI communicates it → Business analysis drives decisions.
Dataset
The project uses a synthetic manufacturing operations dataset containing 5,000 records and 12 variables.
The dataset covers operational dimensions such as:
- Date
- Plant
- Production Line
- Product
- Shift
- Planned Units
- Produced Units
- Defective Units
- Downtime
- Overtime
- Production Cost
- Downtime Reason
Data Preparation & ETL
Python was used as the ETL layer to prepare the raw manufacturing dataset before loading it into SQL Server.
The ETL process included:
- Loading the raw 5,000-record dataset using Pandas
- Verifying dataset dimensions and structure
- Checking missing values
- Checking duplicate records
- Checking negative values in relevant numerical fields
- Validating the business rule that defective units cannot exceed produced units
- Converting the Date column to datetime
- Saving the cleaned dataset
- Loading the cleaned data into SQL Server
ETL Flow
Raw Dataset → Pandas → Data Validation → Quality Checks → Data Transformation → Clean Dataset → SQL Server
SQL Business Analysis
SQL Server was used to analyze the cleaned manufacturing data across multiple business dimensions:
- Overall production KPIs
- Plant performance
- Production achievement and defects
- Production-line performance
- Downtime by reason and plant
- Downtime per 1,000 produced units
- Product performance
- Shift performance
- Daily and monthly performance
- Lowest-performing production days
- Cost and efficiency analysis
Key KPIs
KPI	Result
Production Achievement	90.78%
Production Shortfall	~449K units
Defect Rate	3.72%
Total Downtime	311,021 minutes
Overtime	19,535.40 hours
Production Cost	339.65M
Cost per Unit	76.88


Power BI Dashboard
Power BI was used to transform the analyzed manufacturing data into an interactive management dashboard.
Page 1 — Production / Operations Analysis
The dashboard provides visibility into:
- Total Produced Units
- Total Defective Units
- Production Efficiency
- Total Downtime
- Production Efficiency by Plant
- Production by Plant
- Downtime by Reason
- Downtime by Plant
- Planned vs Actual Production by Product
- Defect Rate by Plant
- Monthly Production Trend
- Product filtering
Page 2 — Cost & Performance Analysis
The dashboard provides visibility into:
- Total Produced Units
- Total Production Cost
- Production Efficiency
- Total Downtime
- Defect Rate
- Cost per Unit
- Production Cost by Product
- Cost per Unit by Product
- Overtime Hours by Plant
- Production Cost by Plant
- Production by Shift
- Production Cost vs Efficiency by Plant
- Production Cost by Line
- Production Volume by Line
- Production Efficiency Trend
- Plant filtering
Key Business Insights
1. Production Shortfall
Overall production achievement is 90.78%, resulting in an estimated shortfall of approximately 449K units against the planned production volume.
Business implication: Production capacity and operational constraints need attention to improve plan achievement.
2. Plant D Is the Primary Improvement Area
Plant D has the lowest production efficiency at 84.43% and the highest defect rate at 4.81%.
Business implication: Plant D should receive the highest priority for operational improvement.
3. Machine Failure Is the Largest Downtime Driver
Machine Failure accounts for 89,703 minutes of downtime, approximately 28.8% of total downtime.
Business implication: Maintenance effectiveness and machine reliability should be investigated as a major opportunity for downtime reduction.
4. Plant D Has the Highest Defect Rate
Plant D records the highest defect rate at 4.81%.
Business implication: Quality controls and root-cause analysis should be prioritized at Plant D.
5. Product D Requires Quality Attention
Product D achieves 91.42% production achievement but has a 4.37% defect rate.
Business implication: Strong production volume does not necessarily indicate strong quality performance; Product D should be investigated for defect drivers.
6. Shift Performance Is Highly Consistent
Production achievement across shifts remains within a narrow range of approximately 90.65%–90.91%.
Business implication: No single shift appears to be a major performance outlier, so shift-level intervention should remain a monitoring activity rather than the primary improvement focus.
7. Plant D Has the Highest Cost per Unit
Plant D has the highest cost per unit at 84.36, while also recording the lowest production efficiency.
Business implication: The combination of lower efficiency and higher unit cost makes Plant D the strongest candidate for cost and operational improvement.
Management Recommendation Priorities
Priority	Area	Recommended Action
High	Plant D	Conduct focused operational and quality improvement analysis
High	Machine Failure	Strengthen preventive maintenance and investigate recurring failure causes
High	Defect Rate	Perform root-cause analysis for high-defect plants/products
Medium	Production Shortfall	Identify capacity and downtime constraints affecting plan achievement
Medium	Cost Efficiency	Investigate high cost-per-unit operations, especially Plant D
Monitor	Shift Performance	Continue monitoring because shift performance is relatively consistent


Business Value
The project helps management move from monitoring manufacturing data to identifying problems, prioritizing improvement areas, and taking data-driven action.
Key business benefits include:
- Improved production visibility
- Plant performance monitoring
- Downtime reduction opportunities
- Quality improvement opportunities
- Cost efficiency analysis
- Prioritized decision-making
- Repeatable Python → SQL Server → Power BI reporting pipeline
Future Improvements
Potential enhancements include:
1. Automating the Excel → Python → SQL Server → Power BI refresh process
2. Predictive maintenance
3. Production forecasting
4. Automated alerts for high downtime, rising defects, low production achievement, and cost increases
5. Cloud deployment
6. Advanced KPIs such as OEE, MTBF, and MTTR when machine-level data becomes available
Project Structure
Manufacturing-Operations-Analytics/
│
├── data/
│   ├── manufacturing_operations_synthetic_5000_12vars.xlsx
│   └── manufacturing_operations_cleaned.csv
│
├── python/
│   └── manufacturing_etl.py
│
├── sql/
│   ├── 01_overall_kpis.sql
│   ├── 02_plant_performance.sql
│   ├── 03_production_quality.sql
│   ├── 04_downtime_analysis.sql
│   ├── 05_product_analysis.sql
│   ├── 06_shift_analysis.sql
│   ├── 07_daily_monthly_analysis.sql
│   └── 08_cost_efficiency.sql
│
├── powerbi/
│   └── Manufacturing_Operations_Analytics.pbix
│
├── screenshots/
│   ├── production_operations_analysis.png
│   └── cost_performance_analysis.png
│
├── README.md
└── requirements.txt
Conclusion
The Manufacturing Operations Analytics project demonstrates an end-to-end approach to transforming raw manufacturing data into actionable business insights.
The solution combines Python ETL, SQL Server, SQL business analysis, and Power BI to provide visibility into production, quality, downtime, and cost performance.
The analysis identified Plant D as the primary improvement area, while Plant C provides a benchmark for efficient operations. Machine-failure downtime, production shortfalls, quality issues, and cost efficiency were identified as key areas for management attention.
Overall, the project demonstrates how data analytics can support evidence-based operational decisions, performance improvement, and management decision-making.
From raw operational data to actionable management decisions.

Author
❤️ Pranav Krishna R V ❤️
MBA | Business Analytics / Business Analyst Portfolio
GitHub: pranav-rv
