Retail Store Sales Data Analysis - SQL Project
This project analyzes transactional data from a retail store using SQL. It includes database creation, data exploration, and running queries to uncover business insights such as sales performance, customer behavior, and product trends.

Project Overview:
Database: sales_data_analysis

Table: retail_Store

Table Structure:
transactions_id INT - Unique transaction ID (Primary Key)
sale_date DATE - Date of sale
sale_time TIME - Time of sale
customer_id INT - Unique customer identifier
gender VARCHAR(30) - Gender of the customer
age INT - Age of the customer
category VARCHAR(50) - Product category
quantiy INT - Quantity sold (Note: typo, should be 'quantity')
price_per_unit INT - Price per unit
cogs FLOAT - Cost of goods sold
total_sale INT - Total sale amount

SQL Tasks Performed:
View sample data:
SELECT * FROM retail_Store LIMIT 10;

Calculate total sales and quantity:
SELECT SUM(total_sale) AS Total_Sale,
SUM(quantiy) AS Quantity
FROM retail_Store;

Analyze monthly revenue trends:
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS Month,
SUM(total_sale) AS Monthly_Sales
FROM retail_Store
GROUP BY Month
ORDER BY Month;

Identify top 10 best-selling product categories:
SELECT category,
SUM(total_sale)
FROM retail_Store
GROUP BY category
ORDER BY total_sale DESC
LIMIT 10;

Find the most profitable product category:
SELECT category AS Product_Name,
SUM(total_sale) AS Most_Profitable
FROM retail_Store
GROUP BY category
LIMIT 1;

Determine customers with the most orders:
SELECT customer_id AS Customer,
COUNT(transactions_id) AS Total_Orders
FROM retail_Store
GROUP BY customer_id
ORDER BY Total_Orders DESC;

Calculate Average Order Value (AOV):
SELECT SUM(total_sale) / COUNT(DISTINCT transactions_id) AS Average_Order
FROM retail_Store;

Key Insights:
Monthly revenue patterns help in forecasting and planning.

Top product categories show what customers buy most.

Identifying top customers can help with loyalty programs.

AOV gives insight into average customer spending.

Note:
Make sure to fix the typo in the column name from 'quantiy' to 'quantity' for accuracy and consistency.

Author:
Muhammad Farhan
Aspiring AI/ML Engineer | SQL Enthusiast
