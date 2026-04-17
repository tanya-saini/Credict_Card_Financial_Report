# Credict Card Financial Report

_Developed a SQL-based customer segmentation model using transaction behavior, credit utilization, and payment patterns to identify distinct risk groups._

## 📌 Table of Contents

- [Overview](#overview)
- [Business Problem](#business-problem)
- [Dataset](#dataset)
- [Tools & Technologies](#tools--technologies)
- [Research Questions & Key Findings](#research-questions--key-findings)
- [Dashboard](#dashboard)
- [How to Run This Project](#how-to-run-this-project)
- [Final Recommendations](#final-recommendations)

## 🔹 Overview

This project focuses on analyzing credit card customer data to uncover insights into spending behavior, credit utilization, and risk patterns. Using SQL-based data processing and segmentation techniques, customers were grouped into meaningful segments based on their financial behavior and payment patterns.

## 🔹 Business Problem

This project aims to:
- Identify high-risk customer segments based on credit utilization and payment behavior
- Analyze key factors driving delinquency, such as income, utilization ratio, and spending patterns
- Evaluate customer value and revenue contribution across different card categories
- Understand customer satisfaction drivers and their relationship with financial behavior
- Segment customers into meaningful groups for targeted marketing and risk mitigation strategies

## 🔹 Dataset

The dataset consists of two related tables containing detailed information on customer demographics and credit card usage behavior.

- **Credit Card Dataset**: Includes transaction-level and financial behavior data such as spending (Total_Trans_Amt), transaction volume, credit utilization, credit limits, interest earned, and delinquency status, along with time-based fields (week, quarter, year).
- **Customer Dataset**: Contains demographic and profile information including age, gender, income, education level, marital status, job type, and customer satisfaction score.

## 🔹 Tools & Technologies

- **SQL (MySQL)** – Used for data extraction, transformation, aggregation, and segmentation logic
- **Power BI** – Built interactive dashboards for visualizing customer behavior, risk, and financial metrics
- **Python (Pandas, NumPy**) – Performed data cleaning & preprocessing
- **Git & GitHub** – Version control and project documentation

## 🔹 Features / Highlights

Key questions such as:

- Which customers are high-value vs high-risk?
- What factors drive delinquency and financial risk?
- Which card categories and regions generate the most revenue?
- How do customer behavior and demographics impact spending and satisfaction?

Goal of the Dashboard:

To build an interactive and data-driven financial dashboard that:
- Enables analysis of customer behavior, spending, and risk patterns
- Helps identify high-risk and high-value customer segments
- Provides insights into revenue drivers and transaction trends
- Supports decision-making in credit risk management and business strategy

Walkthrough of Key Visuals

🔹 (Dashboard – Transaction View)

🔹 KPI Cards (Key Performance Indicator)
- Revenue(interest_earned+annual_fess): 10.8M 
- Transaction Count: 655.7K
- Total Transaction: 44.5M
- Clients: 10,108

🔹 Customer Acquisition Cost (CAC)
- Blue cards have highest acquisition cost
- Need to optimize CAC vs returns
 
🔹 Revenue by Use Chip
- Swipe transactions dominate over chip/online
- Indicates low digital adoption → opportunity for digital push

🔹 Revenue by Expenditure Type
- Bills, entertainment, and fuel are top contributors
- Ideal for cashback offers & partnerships




🔹 Revenue by Expenditure Type (Bar Chart)
Identifies top spending categories (Bills, Fuel, Grocery, etc.)
👉 Useful for targeted offers & partnerships
🔹 Revenue by Education Level
Links education with income segments and spending
👉 Helps refine customer segmentation strategies
🔹 Quarterly Revenue & Transactions (Combo Chart)
Tracks revenue and transaction trends across quarters
👉 Identifies seasonality and growth patterns
• Business Impact & Insights
📊 Risk Management
Identified high-risk segments based on utilization and delinquency
Enables proactive credit control strategies
💰 Revenue Optimization
Highlighted top-performing card categories and customer segments
Supports targeted marketing and product positioning
🎯 Customer Segmentation
Segmented users into high-value, inactive, and high-risk groups
Enables personalized engagement strategies
📈 Strategic Decision-Making
Insights on regional performance, spending behavior, and CAC efficiency
Helps businesses optimize resource allocation and growth strategies

🔹 Key KPIs (Top Section)
Avg Income: , CAC, Avg Age, High Risk %
👉 Provide a quick snapshot of customer profile and overall risk level
🔹 Revenue by Income Group (Area Chart)
Compares revenue across high, medium, and low income groups
👉 Helps identify which income segment contributes most to revenue
🔹 Dependency Analysis (Bar Chart)
Shows relationship between dependents and spending/revenue
👉 Useful for understanding household impact on financial behavior
🔹 Customer Segmentation (Bar Chart)
Classifies customers into Regular, Inactive, and High-Risk groups
👉 Core visual for identifying target segments
🔹 Top 5 Revenue Generating States (Bar Chart)
Displays highest revenue-contributing regions
👉 Helps in regional strategy and targeting
🔹 Satisfaction vs Risk (KPI Cards)
Compares satisfaction scores between male and female high-risk customers
👉 Reveals experience gaps across segments
🔹 Transactions by Gender (Line Chart)
Tracks transaction trends over time by gender
👉 Helps identify behavioral differences
🔹 Expenditure by Age Group (Bar Chart)
Shows spending distribution across age groups
👉 Useful for customer profiling and targeting
🔹 Transaction Count vs CAC (Scatter Plot)
Analyzes relationship between customer acquisition cost and engagement
👉 Helps evaluate marketing efficiency










