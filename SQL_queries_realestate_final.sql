
-- 1. Average Price by Property Type
SELECT type, ROUND(AVG(price), 2) AS avg_price
FROM realestate
GROUP BY type;

-- 2. Total Listings by City
SELECT city, COUNT(*) AS total_listings
FROM realestate
GROUP BY city
ORDER BY total_listings DESC;

-- 3. Avg Price per Sq Ft by City
SELECT city, ROUND(AVG(price / sq__ft), 2) AS avg_price_per_sqft
FROM realestate
WHERE sq__ft > 0
GROUP BY city;

-- 4. Yearly Price Trend
SELECT YEAR(sale_date) AS sale_year, ROUND(AVG(price), 2) AS avg_price
FROM realestate
GROUP BY sale_year;

-- 5. Highest Priced Home per City
SELECT city, MAX(price) AS max_price
FROM realestate
GROUP BY city;

-- 6. Monthly Sales Volume (from table b)
SELECT DATE_FORMAT(sales_date, '%Y-%m') AS sale_month, COUNT(*) AS total_sales
FROM b
GROUP BY sale_month
ORDER BY sale_month;

-- 7. Join a + b to Show Full Sales Records
SELECT a.city, a.type, b.sales_date, a.price
FROM a
JOIN b ON a.address_id = b.address_id
ORDER BY b.sales_date DESC;

-- 8. Average Price by Year (from joined a + b)
SELECT YEAR(b.sales_date) AS year, ROUND(AVG(a.price), 2) AS avg_price
FROM a
JOIN b ON a.address_id = b.address_id
GROUP BY year;

-- 9. Revenue by Type and Year (from joined a + b)
SELECT a.type, YEAR(b.sales_date) AS year, SUM(a.price) AS total_revenue
FROM a
JOIN b ON a.address_id = b.address_id
GROUP BY a.type, year
ORDER BY year, a.type;
