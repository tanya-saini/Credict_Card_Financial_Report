# Credict Card Financial Report

_Developed a SQL-based customer segmentation model using transaction behavior, credit utilization, and payment patterns to identify distinct risk groups._

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

Goal of the Dashboard: _To build an interactive and data-driven financial dashboard that_:
- Enables analysis of customer behavior, spending, and risk patterns
- Helps identify high-risk and high-value customer segments
- Provides insights into revenue drivers and transaction trends
- Supports decision-making in credit risk management and business strategy


### 📊 **(Dashboard – Transactions View)**

### 🔹 **KPI Cards (Key Performance Indicator)**
- Revenue(interest_earned+annual_fess) : 10.8M 
- Transaction Count : 655.7K
- Total Transaction : 44.5M
- Clients : 10,108

### 🔹 **Customer Acquisition Cost (CAC)**(Bar Chart) 
- Blue cards have highest acquisition cost
- Need to optimize CAC vs returns
 
### 🔹 **Revenue by Use Chip**(Bar Chart)
- Swipe transactions dominate over chip/online
- Indicates low digital adoption → opportunity for digital push

### 🔹 **Revenue by Expenditure Type**(Bar Chart)
- Bills, entertainment, and fuel are top contributors
- Ideal for targeted cashback offers & partnerships

### 🔹 **Quarterly Revenue & Transactions**(Combo Chart)
- Tracks revenue and transaction trends across quarters
- Peak in Q3, slight drop in Q4
- Shows seasonality → plan campaigns accordingly

![Dashboard Transactions](https://github.com/tanya-saini/Platos_Pizza_Analysis/blob/main/dashboard%20overview.png)

  ---

### 📊 **(Dashboard – Customers View)**

### 🔹 **KPI Cards (Key Performance Indicator)**
- Avg Income : 44.8K
- Avg Age : 46
- Customer Acquisition Cost : 972.9K
- % of High Risk customer : ~6.1%

### 🔹 **Revenue by Income Group**(Ribbon Chart)
- High-income customers (specially males) contribute the most revenue, but mid-income shows strong volume
- Focus on high-income for value, mid-income for scale

### 🔹 **Customer Segmentation**(Bar Chart)
- Majority are regular customers; high-risk segment is small but critical
- Females constribution is significant as inactive customers ([Total_Trans_Amt] < 10000 && [Total_Trans_Vol] < 50)
- Opportunity for re-engagement campaigns

### 🔹 **Top 5 Revenue States**(Bar Chart)
- Revenue is concentrated in a few key tier-1 states (TX, NY, CA)
- Helps in geo-targeted marketing & expansion strategy

### 🔹 **Avg High Risk CSS**
- High-risk males have higher satisfaction than females
- Potential experience gap → improve retention strategy for female segment

### 🔹 **Transactions by Gender** (Line Chart)
- Males consistently show higher transaction activity throughout the year
- It helps us to identify dominant user group → tailor engagement strategies

### 🔹 **Expenditure by Age Group**(Bar Chart)
- Spending peaks in the 40–60 age group, making them the primary revenue drivers,
  while younger and older segments require targeted engagement to boost activity.

![Dashboard Customers](https://github.com/tanya-saini/Platos_Pizza_Analysis/blob/main/dashboard%20overview.png)


  ## 🔹 Business Impact & Insights
- Identified ~6.1% high-risk segment using SQL-based risk segmentation logic.
- Measured portfolio value at ~57M, with 45M transaction amount and 7.98M interest earned.
- Between all the states TX, NY & CA is contributing to 68%.
- Male customers are contributing 31M in revenue, while female customers are pulling in 26M.
- Blue & Silver credit card together are contributing to 93% of all transactions.
- Showed that higher CAC does not always mean higher engagement, highlighting acquisition inefficiencies.
- Revealed top spending categories and quarterly trends to support targeted offers and campaign timing.
  
## 🔹 Final Recommendations
- Focus on high-risk customers (~6%) with stricter credit controls
- Target high-income & 40–60 age group for revenue growth
- Optimize CAC by focusing on high-engagement segments
- Promote digital payments (chip/online usage)
- Re-engage inactive customers through targeted campaigns

## 🔹 Future Scope
- Develop Customer LTV models
- Implement recommendation systems for offers
- Apply time-series forecasting for revenue trends
- Integrate external data (credit score, economic factors)
- Enable real-time dashboards
