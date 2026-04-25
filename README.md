 **🛒 E-commerce Data Analysis (Olist Dataset)**

📌 **Problem Statement**
E-commerce businesses need insights into customer behavior, sales performance, and delivery efficiency to improve decision-making.

## 💡 Objective
Analyze transactional data to identify trends in sales, customer activity, product performance, and delivery timelines.

## 🛠 Tools Used
- SQL

## 📊 Key Analysis Performed
- Total sales and revenue trends
- Top-performing products and categories
- Customer distribution and behavior
- Order delivery performance and delays
- Payment analysis

## 🔍 Key Insights
- Identified top revenue-generating product categories
- Found regions with highest customer activity
- Analyzed delivery delays impacting customer satisfaction
- Observed seasonal trends in order volume

## 🧠 Sample SQL Queries
**Total Orders**
'''sql
 SELECT 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM olist_orders_dataset;

 **Average Order Value**
SELECT 
    ROUND(SUM(payment_value) / COUNT(DISTINCT order_id), 2) AS Avg_Order_Value
FROM olist_order_payments_dataset;

**Weekday vs Weekend (order_purchase_timestamp) Payment Statistics**
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

**Relationship Between Shipping Days & Review Scores**
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
