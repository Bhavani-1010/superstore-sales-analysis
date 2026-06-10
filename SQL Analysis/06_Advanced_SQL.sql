-- Top 5 Customers by Sales
WITH customer_sales AS (
    SELECT customer_name,
           SUM(sales) AS total_sales
    FROM SuperStoreOrders
    GROUP BY customer_name
)

SELECT *
FROM customer_sales
ORDER BY total_sales DESC
LIMIT 5;


-- Customers with Above Average Sales
SELECT customer_name,
       SUM(sales) AS total_sales
FROM SuperStoreOrders
GROUP BY customer_name
HAVING SUM(sales) >
(
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(sales) AS customer_total
        FROM SuperStoreOrders
        GROUP BY customer_name
    )
);


-- Product Ranking by Sales
WITH product_sales AS (
    SELECT product_name,
           SUM(sales) AS total_sales
    FROM SuperStoreOrders
    GROUP BY product_name
)

SELECT product_name,
       total_sales,
       RANK() OVER (
            ORDER BY total_sales DESC
       ) AS sales_rank
FROM product_sales;


-- Customer Ranking by Profit

WITH customer_profit AS (
    SELECT customer_name,
           SUM(profit) AS total_profit
    FROM SuperStoreOrders
    GROUP BY customer_name
)

SELECT customer_name,
       total_profit,
       RANK() OVER (
            ORDER BY total_profit DESC
       ) AS profit_rank
FROM customer_profit;


-- Top 3 Products in Each Category
WITH product_sales AS (
    SELECT category,
           product_name,
           SUM(sales) AS total_sales
    FROM SuperStoreOrders
    GROUP BY category, product_name
)

SELECT *
FROM (
    SELECT category,
           product_name,
           total_sales,
           RANK() OVER (
                PARTITION BY category
                ORDER BY total_sales DESC
           ) AS sales_rank
    FROM product_sales
)
WHERE sales_rank <= 3;


-- Product Profit Ranking by Category
WITH product_profit AS (
    SELECT category,
           product_name,
           SUM(profit) AS total_profit
    FROM SuperStoreOrders
    GROUP BY category, product_name
)

SELECT category,
       product_name,
       total_profit,
       RANK() OVER (
            PARTITION BY category
            ORDER BY total_profit DESC
       ) AS profit_rank
FROM product_profit;


-- Running Sales Total
WITH yearly_sales AS (
    SELECT year,
           SUM(sales) AS total_sales
    FROM SuperStoreOrders
    GROUP BY year
)

SELECT year,
       total_sales,
       SUM(total_sales) OVER (
            ORDER BY year
       ) AS running_total_sales
FROM yearly_sales;


-- Previous Year Sales Comparison
WITH yearly_sales AS (
    SELECT year,
           SUM(sales) AS total_sales
    FROM SuperStoreOrders
    GROUP BY year
)

SELECT year,
       total_sales,
       LAG(total_sales) OVER (
            ORDER BY year
       ) AS previous_year_sales
FROM yearly_sales;


-- Highest Profit Product per Category
WITH product_profit AS (
    SELECT category,
           product_name,
           SUM(profit) AS total_profit
    FROM SuperStoreOrders
    GROUP BY category, product_name
)

SELECT *
FROM (
    SELECT category,
           product_name,
           total_profit,
           RANK() OVER (
                PARTITION BY category
                ORDER BY total_profit DESC
           ) AS profit_rank
    FROM product_profit
)
WHERE profit_rank = 1;


-- Lowest Profit Product per Category
WITH product_profit AS (
    SELECT category,
           product_name,
           SUM(profit) AS total_profit
    FROM SuperStoreOrders
    GROUP BY category, product_name
)

SELECT *
FROM (
    SELECT category,
           product_name,
           total_profit,
           RANK() OVER (
                PARTITION BY category
                ORDER BY total_profit ASC
           ) AS profit_rank
    FROM product_profit
)
WHERE profit_rank = 1;