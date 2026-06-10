-- Total Sales
SELECT SUM(sales) AS total_sales
FROM SuperStoreOrders;

-- Total Profit
SELECT SUM(profit) AS total_profit
FROM SuperStoreOrders;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM SuperStoreOrders;

-- Total Customers
SELECT COUNT(DISTINCT customer_name) AS total_customers
FROM SuperStoreOrders;

-- Total Products
SELECT COUNT(DISTINCT product_name) AS total_products
FROM SuperStoreOrders;

--Total Number of Categories
SELECT COUNT(DISTINCT category) AS total_categories
FROM SuperStoreOrders;

--Total Number of Sub-Categories
SELECT COUNT(DISTINCT sub_category) AS total_subcategories
FROM SuperStoreOrders;

--Average Sales Per Order
SELECT SUM(sales) / COUNT(DISTINCT order_id) AS avg_sales_per_order
FROM SuperStoreOrders;