1. Total Revenue	
 SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
	Output: 817860.05083847

2. Average Order Value
 SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value FROM pizza_sales;
	Output: 38.3072623343546
 
 3. Total Pizzas Sold:
  SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;
	Output: 49574
	
4. Total Orders:
 SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;
	Output: 21350 
	
5. Average Pizzas/Order:
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL (10,2)) AS Average_Pizza_Per_Order FROM pizza_sales; 	Output: 2.32 
	Output: 2.32
	The DECIMAL(10,2) - means it will show you 10 decimals in total but only output 2
	The CAST function converts the data type of an expression to the specified type 
	in our scenerio we used CAST --- AS DECIMAL changing it into a decimal 


6. Daily Trends for Total Orders
	SELECT DATENAME(DW, order_date) as Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
	FROM pizza_sales
	GROUP BY DATENAME(DW, order_date);
	
7. Monthly Trend for Total Orders 
	SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
	FROM pizza_sales
	GROUP BY DATENAME(MONTH, order_date)
	ORDER BY Total_Orders DESC;
	
8. Percentage of Sales by Pizza Category
	SELECT Pizza_Category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 /
	(SELECT SUM(total_price) FROM pizza_sales) AS Percentage_of_Total_Sales 
	FROM pizza_sales
	WHERE MONTH(order_date) = 1
	GROUP BY Pizza_Category;
	
9. Percentage of Sales by Pizza Sales
	SELECT Pizza_Size, CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 /
	(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER,order_date) = 1) AS DECIMAL (10,2)) AS Percentage_of_Total_Sales 
	FROM pizza_sales
	WHERE DATEPART(QUARTER,order_date) = 1
	GROUP BY (Pizza_Size);

10. Total Pizzas sold by Pizza Category
	SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
	FROM pizza_sales
	WHERE MONTH(order_date) = 2
	GROUP BY pizza_category
	ORDER BY Total_Quantity_Sold DESC

11. Top 5 Best Sellers by Total Pizzas Sold
	SELECT TOP 5 Pizza_Name, SUM(total_price) AS Total_Revenue FROM pizza_sales
	GROUP BY Pizza_Name
	ORDER BY Total_Revenue DESC

12. Botton 5 Worst Sellers by Total Pizzas Sold 
	SELECT TOP 5 Pizza_Name, SUM(total_price) AS Total_Revenue FROM pizza_sales
	GROUP BY Pizza_Name
	ORDER BY Total_Revenue ASC
