CREATE DATABASE IF NOT EXISTS retail_sales_db;
USE retail_sales_db;

CREATE TABLE IF NOT EXISTS superstore (
Row_ID VARCHAR(20),
Order_ID VARCHAR(20),
Order_Date DATE,
Ship_Date DATE,
Ship_Mode VARCHAR(30),
Customer_ID VARCHAR(20),
Customer_Name VARCHAR(100),
Segment VARCHAR(30),
Country VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
Postal_Code VARCHAR(20),
Region VARCHAR(20),
Product_ID VARCHAR(20),
Category VARCHAR(50),
Sub_Category VARCHAR(50),
Product_Name VARCHAR(200),
Sales DECIMAL(10,2),
Quantity INT,
Discount DECIMAL(5,2),
Profit DECIMAL(10,2)
);
 describe SUPERSTORE;
 ---- Total Revenue and Profit Overview
SELECT
SUM(Sales) AS Total_Revenue,
SUM(Profit) AS Total_Profit
FROM superstore_clean;

--Revenue by Product Category
SELECT category,
SUM(Sales) AS Total_Revenue
FROM superstore_clean
GROUP BY Category
ORDER BY Total_Revenue DESC;


-- Revenue by Region
SELECT
Region,
SUM(Sales) AS Total_Revenue
FROM superstore_clean
GROUP BY Region
order by Total_Revenue DESC;

-- Monthly Revenue Trend
SELECT
DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
SUM(Sales) AS Monthly_Revenue
FROM superstore_clean
GROUP BY Month
ORDER BY Month;

-- Top 10 Best-Selling Sub-Categories
SELECT Sub_Category,
SUM(Sales) AS Total_Revenue,
SUM(Profit) AS Profit,
SUM(Profit)/SUM(Sales)*100 AS Profit_Margin_Pct
FROM superstore_clean
GROUP BY Sub_Category
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Customer Segment Performance
SELECT Segment,
SUM(Sales) AS Total_Revenue,
SUM(Profit) AS Profit,
COUNT(DISTINCT Customer_ID) AS Customers
FROM superstore_clean
GROUP BY Segment
ORDER BY Total_Revenue DESC;
 