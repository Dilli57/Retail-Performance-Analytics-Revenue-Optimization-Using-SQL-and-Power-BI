use apple1;

show tables ;

show indexes in sales;

CREATE INDEX idx_sales_store_product 
ON sales(store_id, product_id);

CREATE INDEX idx_products_category 
ON products(product_id, category_id);



-- 1. Product Performance Analysis

-- Business Problem
-- Which products are driving the highest sales and should be prioritized for inventory and marketing?

SELECT p.product_name, t.total_sales
FROM (
    SELECT product_id, SUM(quantity) AS total_sales
    FROM sales
    GROUP BY product_id
) t
JOIN products p ON t.product_id = p.product_id
ORDER BY t.total_sales DESC
LIMIT 10;

-- 2. Sales Trend Analysis

SELECT DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
       SUM(s.quantity) AS total_sales
FROM sales s
GROUP BY month
ORDER BY month;

-- 3. Store Performance Benchmarking

SELECT store_id,
       SUM(quantity) AS total_sales,
       RANK() OVER (ORDER BY SUM(quantity) DESC) AS rank_position
FROM sales
GROUP BY store_id;

-- 4. Category Contribution Analysis

SELECT c.category_name, t.total_sales,
       CASE 
           WHEN t.total_sales > 50000 THEN 'High'
           WHEN t.total_sales > 20000 THEN 'Medium'
           ELSE 'Low'
       END AS performance_level
FROM (
    SELECT p.category_id, SUM(s.quantity) AS total_sales
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY p.category_id
) t
JOIN category c ON t.category_id = c.category_id;

-- 5. Warranty Claims Analysis

SELECT 
    COUNT(DISTINCT c.claim_id) * 100.0 /
    COUNT(DISTINCT s.sale_id) AS claim_percentage
FROM sales s
LEFT JOIN claims c 
ON s.sale_id = c.sale_id;

-- Claim Status Analysis

SELECT repair_status, COUNT(*) AS total_claims
FROM claims
GROUP BY repair_status;

-- Claim Rate by Product

SELECT s.product_id,
       COUNT(c.claim_id) AS total_claims
FROM sales s
LEFT JOIN claims c ON s.sale_id = c.sale_id
GROUP BY s.product_id;

-- 6. Category-wise Top Products

WITH ranked_products AS (
    SELECT c.category_name,
           p.product_name,
           SUM(s.quantity) AS total_sales,
           RANK() OVER (PARTITION BY c.category_name ORDER BY SUM(s.quantity) DESC) AS rnk
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    JOIN category c ON p.category_id = c.category_id
    GROUP BY c.category_name, p.product_name
)
SELECT *
FROM ranked_products
WHERE rnk <= 3;

-- 7. Sales Trend Smoothing

SELECT sale_date,
       daily_sales,
       AVG(daily_sales) OVER (
           ORDER BY sale_date 
           ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
       ) AS moving_avg_7_days
FROM (
    SELECT sale_date, SUM(quantity) AS daily_sales
    FROM sales
    GROUP BY sale_date
) t;

-- 8.High Demand Products

WITH product_counts AS (
    SELECT product_id, COUNT(*) AS sales_count
    FROM sales
    GROUP BY product_id
),
avg_sales AS (
    SELECT AVG(sales_count) AS avg_count
    FROM product_counts
)
SELECT p.product_id, p.sales_count
FROM product_counts p, avg_sales a
WHERE p.sales_count > a.avg_count;

-- 9.Store vs Category Strength

SELECT st.store_name, c.category_name, t.total_sales
FROM (
    SELECT store_id, product_id, SUM(quantity) AS total_sales
    FROM sales
    GROUP BY store_id, product_id
) t
JOIN products p ON t.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
JOIN stores st ON t.store_id = st.store_id
ORDER BY t.total_sales DESC;

