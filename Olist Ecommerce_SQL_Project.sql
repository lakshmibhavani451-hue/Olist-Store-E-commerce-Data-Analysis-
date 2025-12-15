CREATE DATABASE olist_project;
USE olist_project;

# 1 Weekday vs Weekend (order_purchase_timestamp) Payment Statistics
SELECT 
    CASE 
        WHEN DAYOFWEEK(STR_TO_DATE(order_purchase_timestamp, '%d-%m-%Y')) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,
    ROUND(SUM(payment_value),2) AS Total_Payment,
    COUNT(DISTINCT o.order_id) AS Total_Orders
FROM olist_orders_dataset AS o
JOIN olist_order_payments_dataset AS p
    ON o.order_id = p.order_id
GROUP BY Day_Type
ORDER BY Day_Type;



# 2 Number of Orders with Review Score  5 and Payment Type as Credit Card
SELECT 
    COUNT(DISTINCT o.order_id) AS Total_Orders_With_5Score_Review
FROM olist_orders_dataset AS o
JOIN olist_order_reviews_dataset AS r 
    ON o.order_id = r.order_id
JOIN olist_order_payments_dataset AS p 
    ON o.order_id = p.order_id
WHERE r.review_score = 5 
  AND p.payment_type = 'credit_card';
  
  
  # 3 Average number of Days Taken for Delivery (pet_shop)
SELECT 
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(o.order_delivered_customer_date, '%Y-%m-%d'),
        STR_TO_DATE(o.order_purchase_timestamp, '%Y-%m-%d')
    )), 2) AS Avg_Delivery_Days_For_Pet_Shop
FROM olist_orders_dataset AS o
JOIN olist_order_items_dataset AS i 
    ON o.order_id = i.order_id
JOIN olist_products_dataset AS p 
    ON i.product_id = p.product_id
WHERE p.product_category_name = 'Pet_Shop'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_purchase_timestamp IS NOT NULL;

  
  # 4 Average Price and Payment Value from Customers of São Paulo City
 SELECT 
    ROUND(AVG(i.price), 2) AS Avg_Price,
    ROUND(AVG(pay.payment_value), 2) AS Avg_Payment_Value
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c 
    ON o.customer_id = c.customer_id
JOIN olist_order_items_dataset AS i 
    ON o.order_id = i.order_id
JOIN olist_order_payments_dataset AS pay 
    ON o.order_id = pay.order_id
WHERE c.customer_city = 'sao paulo';


# 5 Relationship Between Shipping Days & Review Scores
SELECT 
    r.review_score,
    ROUND(AVG(DATEDIFF(
        STR_TO_DATE(o.order_delivered_customer_date, '%Y-%m-%d'),
        STR_TO_DATE(o.order_purchase_timestamp, '%Y-%m-%d')
    )), 2) AS Avg_Shipping_Days
FROM olist_orders_dataset AS o
JOIN olist_order_reviews_dataset AS r 
    ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
  AND o.order_purchase_timestamp IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score;


# 6 Total Orders
 SELECT 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM olist_orders_dataset;


# 7 Average Order Value
SELECT 
    ROUND(SUM(payment_value) / COUNT(DISTINCT order_id), 2) AS Avg_Order_Value
FROM olist_order_payments_dataset;


# 8 Top 5 States by Sales
SELECT 
    c.customer_state,
    ROUND(SUM(p.payment_value), 2) AS Total_Sales
FROM olist_orders_dataset AS o
JOIN olist_customers_dataset AS c 
    ON o.customer_id = c.customer_id
JOIN olist_order_payments_dataset AS p 
    ON o.order_id = p.order_id
GROUP BY c.customer_state
ORDER BY Total_Sales DESC
LIMIT 5;

  
