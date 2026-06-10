-- Top 10 Customers by Sales
SELECT customer_name,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- Top 10 Customers by Profit
SELECT customer_name,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;


-- Top 10 Customers by Number of Orders
SELECT customer_name,
       COUNT(DISTINCT order_id) AS total_orders
FROM SuperStoreOrders
GROUP BY customer_name
ORDER BY total_orders DESC
LIMIT 10;


-- Average Sales Per Customer
SELECT customer_name,
       AVG(sales) AS avg_sales
FROM SuperStoreOrders
GROUP BY customer_name
ORDER BY avg_sales DESC
LIMIT 10;


-- Customers Generating Loss
SELECT customer_name,
       SUM(profit) AS total_profit
FROM SuperStoreOrders
GROUP BY customer_name
HAVING SUM(profit) < 0
ORDER BY total_profit
LIMIT 10;


-- Top 10 Customers by Profit Margin
SELECT customer_name,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       ROUND((SUM(profit) * 100.0) / SUM(sales), 2) AS profit_margin_pct
FROM SuperStoreOrders
GROUP BY customer_name
ORDER BY profit_margin_pct DESC
LIMIT 10;


-- Customer Ranking by Sales (Window Function)
WITH customer_sales AS (
    SELECT customer_name,
           SUM(sales) AS total_sales
    FROM SuperStoreOrders
    GROUP BY customer_name
)

SELECT customer_name,
       total_sales,
       RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM customer_sales
LIMIT 10;


-- Customers Above Average Sales
WITH customer_sales AS (
    SELECT customer_name,
           SUM(sales) AS total_sales
    FROM SuperStoreOrders
    GROUP BY customer_name
)

SELECT customer_name,
       total_sales
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
)
ORDER BY total_sales DESC;