--Profit by Category
SELECT category,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY category
ORDER BY total_profit DESC;


--Profit by Sub-Category
SELECT sub_category,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY sub_category
ORDER BY total_profit DESC;


--Top 10 Most Profitable Products
SELECT product_name,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;


--Top 10 Least Profitable Products
SELECT product_name,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;


--Profit by Region
SELECT region,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY region
ORDER BY total_profit DESC;


--Profit Margin by Category
SELECT category,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       ROUND((SUM(profit) * 100.0) / SUM(sales), 2) AS profit_margin_percent
FROM SuperStoreOrders
GROUP BY category
ORDER BY profit_margin_percent DESC;


--Loss-Making Products
SELECT product_name,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit
LIMIT 10;