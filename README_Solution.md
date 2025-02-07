# Financial Dashboard

## Overview
This task provides financial analysis dashboards using PostgreSQL and Grafana.

## Components
- PostgreSQL queries for financial analysis
- Grafana dashboard for visualization
- Three main analyses:
  1. Monthly Spending Trends
  2. Department Overview
  3. Currency Distribution

## Setup Instructions
1. Database Configuration:
   - Host: recruitment.free.technology
   - Port: 5432
   - Database: recruitment_task

2. Grafana Setup:
   - Import the dashboard JSON from grafana/dashboards/
   - Configure PostgreSQL data source
   - Refresh the dashboard

## Visualizations
1. Monthly Spending Trend (Time Series)
   - Shows spending patterns over time by currency

2. Department Overview (Bar Chart)
   - Displays spending distribution across departments

3. Currency Distribution (Pie Chart)
   - Shows the proportion of spending in different currencies

## Notes
- Currency conversions are not implemented to maintain data accuracy
- All amounts are shown in their original currencies