**Olist Store E-commerce Data Analysis (MySQL Focus)**
🌟 **Project Overview**
This project focuses on analyzing the Olist Brazilian e-commerce dataset using SQL to extract meaningful business insights related to sales, customer behavior, payments, delivery performance, and reviews.
The objective is to answer real-world business questions that help stakeholders understand:
Customer purchasing patterns
Revenue distribution across regions
Payment preferences
Delivery efficiency
Impact of delivery time on customer reviews

🗂️**Dataset Description**
The project uses the Olist public dataset, which contains multiple relational tables:
olist_orders_dataset
olist_customers_dataset
olist_order_items_dataset
olist_order_payments_dataset
olist_order_reviews_dataset
olist_products_dataset
These tables are joined using primary and foreign keys such as order_id, customer_id, and product_id.

🛠️**Tools & Technologies**
SQL (MySQL)
Joins (INNER JOIN)
Aggregate functions (SUM, AVG, COUNT)
Date functions (DATEDIFF, DAYOFWEEK, STR_TO_DATE)
Grouping & filtering
Business KPIs & metrics

📊 **Key Business Questions Answered**
1️⃣ Weekday vs Weekend Payment Statistics
Categorized orders into Weekday and Weekend
Compared:
Total payment value
Total number of orders
Helps understand customer purchasing behavior by day type

2️⃣ Orders with 5-Star Reviews Paid by Credit Card
Identified highly satisfied customers
Filtered orders with:
Review score = 5
Payment type = Credit Card
Useful for customer satisfaction & payment preference analysis

3️⃣ Average Delivery Days for Pet Shop Category
Calculated average delivery time for Pet Shop products
Helps assess logistics efficiency for specific product categories

4️⃣ Average Price & Payment Value (São Paulo Customers)
Focused on customers from São Paulo city
Calculated:
Average product price
Average payment value
Useful for city-level revenue analysis

5️⃣ Relationship Between Shipping Days & Review Scores
Analyzed how delivery time impacts customer reviews
Calculated average shipping days per review score
Supports insights into customer experience and logistics performance

6️⃣ Total Number of Orders
Counted distinct orders across the dataset
Serves as a core business KPI

7️⃣ Average Order Value (AOV)
Calculated as:
Total Payment Value / Total Orders
A key metric used in e-commerce performance tracking

8️⃣ Top 5 States by Sales
Identified the top-performing states based on total sales
Useful for regional sales strategy and expansion planning

📈**Key Insights**
Weekend orders contribute significantly to total payment value.
Faster deliveries generally lead to higher review scores.
Credit card payments dominate among highly satisfied customers.
São Paulo is a major contributor to revenue.
Certain product categories experience longer delivery times.

✅**Conclusion**
This project demonstrates how SQL can be effectively used to analyze real-world e-commerce data and convert raw transactional records into actionable business insights. By working with the Olist dataset, multiple relational tables were joined to answer practical questions related to sales performance, customer behavior, payment preferences, delivery efficiency, and customer satisfaction.
The analysis highlights that:
Delivery time has a strong impact on customer review scores, emphasizing the importance of efficient logistics.
Credit cards are the most preferred payment method among highly satisfied customers.
Weekday and weekend purchasing behaviors differ, which can help businesses optimize marketing and operational strategies.
Regional analysis shows that certain states and cities contribute significantly to overall revenue.
Product-category–based delivery insights help identify areas for logistics improvement.
Overall, this project reflects a structured analytical approach, strong understanding of SQL joins, aggregations, and date functions, and the ability to translate data into meaningful insights for decision-making.
