/*QUESTION 1: High-Value Customers (LTV)
Which customers generate the highest revenue?
H1: Customers with higher income generate higher LTV
H2: High utilization customers generate more revenue*/

use ccdb;
-- Top Customers
SELECT *
FROM (
    SELECT 
        c.Client_Num,
        SUM(c.Total_Trans_Amt) AS Customer_LTV,
        cust.Income
    FROM credit_card c
    JOIN customer cust
    ON c.Client_Num = cust.Client_Num
    GROUP BY c.Client_Num, cust.Income
) t
ORDER BY Customer_LTV DESC
LIMIT 10;

-- Test Hypothesis (Income vs LTV)
SELECT 
    CASE 
        WHEN Income < 35000 THEN 'Low Income'
        WHEN Income BETWEEN 35000 AND 70000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Group,
    AVG(Total_Trans_Amt) AS Avg_LTV
FROM credit_card c
JOIN customer cust
ON c.Client_Num = cust.Client_Num
GROUP BY Income_Group;
-- ------------------------------------------------------------------------------------------------------------
/*QUESTION 2: Delinquency Analysis
What factors lead to delinquent accounts?
H1: Lower income → higher delinquency = no
    Younger customer(low income) → least delinquency
H2: High utilization ratio → higher delinquency = false -> opposite 
*/

-- Overall Delinquency Rate
SELECT 
    Delinquent_Acc,
    COUNT(*) AS Count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage
FROM credit_card
GROUP BY Delinquent_Acc;

SELECT 
    CASE 
        WHEN Customer_Age < 30 THEN 'Young'
        WHEN Customer_Age BETWEEN 30 AND 50 THEN 'Middle'
        ELSE 'Senior'
    END AS Age_Group,
    CASE 
        WHEN cust.Income < 35000 THEN 'Low Income'
        WHEN cust.Income BETWEEN 35000 AND 70000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Group,
    AVG(c.Delinquent_Acc) AS Delinquency_Rate
FROM credit_card c
JOIN customer cust
ON c.Client_Num = cust.Client_Num
GROUP BY Age_Group, Income_Group;

SELECT 
    CASE 
        WHEN  Avg_Utilization_Ratio < 0.3 THEN 'Low'
        WHEN Avg_Utilization_Ratio BETWEEN 0.3 AND 0.7 THEN 'Medium'
        ELSE 'High'
    END AS Utilization_Group,
    AVG(Delinquent_Acc) AS Delinquency_Rate
FROM credit_card 
GROUP BY Utilization_Group;
-- ------------------------------------------------------------------------------------------------------------
/*QUESTION 3: Which Card Category Performs Best?
Which Card_Category generates the highest revenue and usage?
H1: Premium cards (Gold/Platinum) generate higher revenue per customer
H2: Basic cards (Blue) have higher transaction volume but lower value = TRUE
H3: Higher credit limit cards drive higher spending LEADING TO HIGHER REVENUE  = TRUE */

SELECT 
    Card_Category,
    COUNT(DISTINCT Client_Num) as Customers,
    SUM(Total_Trans_Amt) AS Total_Spend,
    ROUND(AVG(Total_Trans_Amt),2) AS Avg_Spend_Per_Customer,
    ROUND(SUM(Annual_Fees+Interest_Earned),2) AS Total_Revenue,
    ROUND(AVG(Annual_Fees+Interest_Earned),2) AS Avg_Revenue_Per_Customer
FROM credit_card
GROUP BY Card_Category
ORDER BY Total_Revenue DESC;

SELECT 
    Card_Category,
    SUM(Total_Trans_Vol) AS Total_Transactions,
    ROUND(AVG(Total_Trans_Vol),2) AS Avg_Transactions
FROM credit_card
GROUP BY Card_Category;

SELECT 
    Card_Category,
    ROUND(AVG(Credit_Limit),2) AS Avg_Limit,
    ROUND(AVG(Total_Trans_Amt),2) AS Avg_Spend,
    CONCAT(ROUND(AVG(Total_Trans_Amt)*100.0/AVG(Credit_Limit),2),'%') AS spending_percenatge
FROM credit_card
GROUP BY Card_Category;
-- ------------------------------------------------------------------------------------------------------------
/*QUESTION 4: What Drives Customer Satisfaction?
What factors influence customer satisfaction score?
H1: Delinquent customers → lower satisfaction
H2: High utilization → lower satisfaction true  
*/

SELECT 
    c.Delinquent_Acc,
    COUNT(c.Delinquent_Acc) AS Customers,
    ROUND(AVG(cust.Cust_Satisfaction_Score),2) AS Avg_Satisfaction
FROM credit_card c
JOIN customer cust
ON c.Client_Num = cust.Client_Num
GROUP BY c.Delinquent_Acc;

SELECT 
    CASE 
        WHEN Avg_Utilization_Ratio < 0.3 THEN 'Low'
        WHEN Avg_Utilization_Ratio BETWEEN 0.3 AND 0.7 THEN 'Medium'
        ELSE 'High'
    END AS Util_Group,
    AVG(cust.Cust_Satisfaction_Score) AS Avg_Satisfaction
FROM credit_card c
JOIN customer cust
ON c.Client_Num = cust.Client_Num
GROUP BY Util_Group;
-- ------------------------------------------------------------------------------------------------------------
/*QUESTION 5: Are There Seasonal Trends in Transactions?
Do transactions vary across time (weeks/quarters)?
H1: Transactions increase in certain quarters (e.g., festive season)
H2: End-of-month / certain weeks show higher spending
*/

SELECT 
    Week_Num as Week_Num,
    SUM(Total_Trans_Amt) AS Weekly_Spend
FROM credit_card
GROUP BY Week_Num
ORDER BY 2 DESC LIMIT 5;

SELECT 
    Qtr,
    SUM(Total_Trans_Amt) AS Total_Spend,
    SUM(Total_Trans_Vol) AS Total_Volume
FROM credit_card
GROUP BY Qtr
ORDER BY Qtr;
-- ------------------------------------------------------------------------------------------------------------
/*QUESTION 6: Does Payment Method (Chip Usage) Affect Behavior?
H1: Chip users spend more (higher transaction amount and freq) yes
H2: Chip users have lower delinquency (more secure behavior) no highest 
*/

SELECT 
    `Use Chip`,
    COUNT(*) AS Customers,
    AVG(Total_Trans_Amt) AS Avg_Spend,
    AVG(Total_Trans_Vol) AS Avg_Transactions
FROM credit_card
GROUP BY `Use Chip`;

SELECT 
    `Use Chip`,
    AVG(Delinquent_Acc) AS Delinquency_Rate
FROM credit_card
GROUP BY `Use Chip`;
-- ------------------------------------------------------------------------------------------------------------
/*QUESTION 7: Can We Segment Customers into Meaningful Groups?
 Can we group customers based on behavior and demographics to identify 
 distinct segments?
H1: High income + high spend → premium customers
H2: Low income + high utilization → risky customers
H3: Low spend + low utilization → inactive customers
H4: High transaction volume but low spend → frequent small buyers
*/
with agg_per_customer AS(
SELECT 
    c.Client_Num,
    SUM(c.Total_Trans_Amt) AS Total_Spend,
    SUM(c.Total_Trans_Vol) AS Total_Transactions,
    AVG(c.Avg_Utilization_Ratio) AS Avg_Utilization,
    AVG(c.Credit_Limit) AS Avg_Credit_Limit,
    ROUND(SUM(c.Interest_Earned + c.Annual_Fees),2) AS Total_Revenue,
    MAX(c.Delinquent_Acc) AS Delinquency_Flag,
    
    cust.Income,
    cust.Customer_Age,
    cust.Gender,
    cust.Education_Level

FROM credit_card c
JOIN customer cust
ON c.Client_Num = cust.Client_Num

GROUP BY 
    c.Client_Num,
    cust.Income,
    cust.Customer_Age,
    cust.Gender,
    cust.Education_Level),
    
segmentation_table AS(
SELECT *,
    CASE 
        WHEN Total_Spend > 50000 AND Income > 70000 THEN 'Premium Customers'
        WHEN Avg_Utilization > 0.7 AND Delinquency_Flag = 1 THEN 'High Risk Customers'
        WHEN Total_Spend < 10000 AND Total_Transactions < 50 THEN 'Inactive Customers'
        WHEN Total_Transactions > 200 AND Total_Spend < 20000 THEN 'Frequent Low Spenders'
        ELSE 'Regular Customers'
    END AS Customer_Segment
FROM agg_per_customer) 

SELECT 
    Customer_Segment,
    AVG(Total_Spend) AS Avg_Spend,
    ROUND(AVG(Avg_Utilization),4) AS Avg_Utilization,
    AVG(Delinquency_Flag) AS Risk_Level
FROM segmentation_table
GROUP BY Customer_Segment;











