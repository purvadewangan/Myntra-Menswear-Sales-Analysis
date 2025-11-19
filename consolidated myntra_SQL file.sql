-- USE startersql;
-- SELECT * FROM myntra_dataset;
-- SELECT COUNT(*) FROM myntra_dataset;

-- 01_How does the discount percentage correlate with product ratings and number of ratings across brands?
SELECT 
    brand_name,
    ROUND(AVG(discount_percent), 2) AS avg_discount,
    ROUND(AVG(ratings), 2) AS avg_rating,
    ROUND(AVG(number_of_ratings), 0) AS avg_num_ratings
FROM myntra_dataset
GROUP BY brand_name
ORDER BY avg_discount DESC;
-- No direct relationship found 

-- 02_Which brands experience the largest change in sales volume (proxy: number_of_ratings) when prices drop or discounts increase?
SELECT
    brand_name,
    ROUND(
        (AVG(discount_percent * number_of_ratings) - AVG(discount_percent) * AVG(number_of_ratings))
        /
        (STDDEV(discount_percent) * STDDEV(number_of_ratings))
    , 2) AS discount_sensitivity
FROM
    myntra_dataset
GROUP BY
    brand_name
HAVING
    STDDEV(discount_percent) > 0 AND STDDEV(number_of_ratings) > 0
ORDER BY
    discount_sensitivity DESC;

-- 03_What is the ideal discount range that maximizes both customer engagement (ratings, reviews) and minimizes profit loss for each brand?
SELECT
    brand_name,
    CASE
        WHEN discount_percent < 30 THEN 'Low Discount (<30%)'
        WHEN discount_percent BETWEEN 30 AND 60 THEN 'Moderate Discount (30-60%)'
        ELSE 'High Discount (>60%)'
    END AS discount_range,
    ROUND(AVG(discount_percent), 2) AS avg_discount_in_range, 
    ROUND(AVG(ratings), 2) AS avg_rating,
    ROUND(AVG(number_of_ratings), 0) AS avg_num_ratings
FROM
    myntra_dataset
GROUP BY
    brand_name, discount_range
ORDER BY
    brand_name, avg_num_ratings DESC;
    
-- 04_Are premium brands (like Levi’s, Calvin Klein, etc.) offering steeper discounts leading to dilution of brand equity compared to mid-range brands?
SELECT 
    brand_name,
    ROUND(AVG(MRP), 0) AS avg_mrp,
    ROUND(AVG(discount_percent), 2) AS avg_discount,
    ROUND(AVG(ratings), 2) AS avg_rating
FROM myntra_dataset
GROUP BY brand_name
ORDER BY avg_mrp DESC;
    
-- 05_How do similar product types (e.g., “Men Slim Fit Jeans”) differ in average price and discount across brands, and which pricing strategies outperform in ratings?
SELECT 
    pants_description,
    brand_name,
    ROUND(AVG(price), 0) AS avg_price,
    ROUND(AVG(ratings), 2) AS avg_rating
FROM myntra_dataset
WHERE pants_description LIKE '%Slim Fit Jeans%'
GROUP BY pants_description, brand_name
ORDER BY avg_price;   

-- 06_Which brands consistently achieve high ratings and engagement despite higher pricing, indicating strong perceived value?
SELECT 
    brand_name,
    ROUND(AVG(ratings), 2) AS avg_rating,
    ROUND(AVG(price), 0) AS avg_price,
    SUM(number_of_ratings) AS total_ratings
FROM myntra_dataset
GROUP BY brand_name
HAVING total_ratings > 1000
ORDER BY avg_rating DESC;
 
-- 07_Which product categories (e.g., Cotton Pants, Slim Fit Jeans, Joggers) perform best for specific brands in terms of both user feedback and pricing balance?
SELECT 
    pants_description,
    brand_name,
    ROUND(AVG(ratings), 2) AS avg_rating,
    SUM(number_of_ratings) AS engagement
FROM myntra_dataset
GROUP BY pants_description, brand_name
ORDER BY engagement DESC; 

-- 08_Which brands or product types receive consistently low ratings or very few reviews, suggesting low market traction?
SELECT 
    brand_name,
    ROUND(AVG(ratings), 2) AS avg_rating,
    ROUND(AVG(price), 0) AS avg_price,
    SUM(number_of_ratings) AS total_reviews
FROM myntra_dataset
GROUP BY brand_name
HAVING avg_rating < 3.5 AND total_reviews < 500;

-- 09_Which combinations of price range and rating trends suggest products that should be restocked frequently due to high demand and customer satisfaction?
SELECT 
    CASE 
        WHEN price < 1000 THEN 'Budget'
        WHEN price BETWEEN 1000 AND 2000 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_segment,
    ROUND(AVG(ratings), 2) AS avg_rating,
    SUM(number_of_ratings) AS total_ratings
FROM myntra_dataset
GROUP BY price_segment
ORDER BY total_ratings DESC;

-- 10_Are there brands or categories where customer engagement (number_of_ratings) grows steadily over time, signaling potential for long-term retention and repeat purchases?
SELECT 
    brand_name,
    ROUND(AVG(number_of_ratings), 0) AS avg_reviews_per_product,
    COUNT(*) AS total_products
FROM myntra_dataset
GROUP BY brand_name
ORDER BY avg_reviews_per_product DESC;