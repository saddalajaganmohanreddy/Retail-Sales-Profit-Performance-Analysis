-- Retail Sales SQL Analysis

-- 1. Total Revenue
SELECT SUM(Sales) AS total_revenue
FROM data;

-- 2. Total Profit
SELECT SUM(Profit) AS total_profit
FROM data;

-- 3. Profit Margin Percentage
SELECT SUM(Profit) / NULLIF(SUM(Sales),0) * 100 AS profit_margin_percentage
FROM data;

-- 4. Total Orders
SELECT COUNT(DISTINCT `Order ID`) AS total_orders
FROM data;

-- 5. Sales by Category
SELECT Category, SUM(Sales) AS total_sales
FROM data
GROUP BY Category
ORDER BY total_sales DESC;

-- 6. Profit by Region
SELECT Region, SUM(Profit) AS total_profit
FROM data
GROUP BY Region
ORDER BY total_profit DESC;

-- 7. Monthly Sales Trend
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS order_month,
       SUM(Sales) AS monthly_sales
FROM data
GROUP BY order_month
ORDER BY order_month;

-- 8. Loss-Making Products
SELECT `Product Name`,
       SUM(Profit) AS total_profit
FROM data
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
ORDER BY total_profit;

-- 9. Top 5 Customers by Sales
SELECT `Customer Name`,
       SUM(Sales) AS total_sales
FROM data
GROUP BY `Customer Name`
ORDER BY total_sales DESC
LIMIT 5;
