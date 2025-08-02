#Create database :
CREATE DATABASE sales_data_analysis;

#Use the created database:
USE sales_data_analysis;

#Create table with different column:
CREATE TABLE retail_Store(
	transactions_id INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(30),
	age INT NOT NULL,
	category VARCHAR(50),
	quantiy INT,
	price_per_unit INT,
	cogs FLOAT,
	total_sale INT
);

#Data imported from retail_store dataset:
SELECT * FROM retail_Store
limit 10;

#Calculate the total sales and total quantity sold across all records.
select SUM(total_sale) AS Total_Sale ,
	SUM(quantiy) AS Quantity
from retail_Store;
     
#Analyze the monthly revenue trend to see how sales change over time.
SELECT 
   DATE_FORMAT(sale_date , '%Y-%m') as Month,
   SUM(total_sale) as Monthly_Sales
   from retail_Store
group by Month
order by Month;

#Identify the top 10 best-selling products based on total sales.
select 
	 category,
     sum(total_sale)
     from retail_Store
     group by category
     order by total_sale desc
     limit 10;

#Find the most profitable product category     
select 
	category as Product_Name,
    SUM(total_sale) as Most_Profitable
    from retail_Store
    group by category
    limit 1;

#Determine which customers placed the most orders.
select 
	customer_id as Customer,
	COUNT(transactions_id) AS Total_Orders
    from retail_Store
    group by customer_id
    order by Total_Orders desc;

#Calculate the average order value (AOV) for all orders.
select 
	sum(total_sale) / COUNT(distinct transactions_id) as Average_Order
    from retail_Store
