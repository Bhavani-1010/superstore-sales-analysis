--Sales by Category
SELECT category,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY category
ORDER BY total_sales DESC;

--Sales by Sub-Category
SELECT sub_category,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY sub_category
ORDER BY total_sales DESC;

--Top 10 Products by Sales
SELECT product_name,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

--Top 10 Customers by Sales
SELECT customer_name,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

--Sales by Region
SELECT region,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY region
ORDER BY total_sales DESC;

--Sales by Ship Mode
SELECT ship_mode,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY ship_mode
ORDER BY total_sales DESC;

--Average Sales per Customer
SELECT customer_name,
       AVG(sales) AS avg_sales
FROM SuperStoreOrders
GROUP BY customer_name
ORDER BY avg_sales DESC
LIMIT 10;