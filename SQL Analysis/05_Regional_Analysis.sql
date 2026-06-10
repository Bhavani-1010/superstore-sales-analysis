-- Total Sales by Region

SELECT region,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY region
ORDER BY total_sales DESC;


-- Total Profit by Region

SELECT region,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY region
ORDER BY total_profit DESC;


-- Total Orders by Region

SELECT region,
       COUNT(DISTINCT order_id) AS total_orders
FROM SuperStoreOrders
GROUP BY region
ORDER BY total_orders DESC;


-- Sales by Country
SELECT country,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY country
ORDER BY total_sales DESC
LIMIT 10;


-- Profit by Country
SELECT country,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY country
ORDER BY total_profit DESC
LIMIT 10;

-- Sales by Market
SELECT market,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY market
ORDER BY total_sales DESC;


-- Profit by Market
SELECT market,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY market
ORDER BY total_profit DESC;

--Top 10 States by Sales
SELECT state,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

--Top 10 States by Profit
SELECT state,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;

--Bottom 10 States by Profit
SELECT state,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY state
ORDER BY total_profit ASC
LIMIT 10;