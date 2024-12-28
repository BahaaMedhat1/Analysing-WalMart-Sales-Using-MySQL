# Walmart Sales Analysis

This project involves analyzing Walmart sales data using **MySQL** to uncover key insights into sales performance, customer behavior, and product trends. The goal is to demonstrate advanced data wrangling, feature engineering, and analysis techniques while providing actionable insights for business decision-making.

---

## Project Overview

The Walmart sales dataset contains transactional data from three store branches located in **Yangon**, **Naypyitaw**, and **Mandalay**. The data provides a comprehensive view of sales performance across different cities, product lines, payment methods, and customer types. Using SQL queries, this project answers critical business questions, uncovers patterns, and provides insights for business growth.

---

## Key Insights

### General Analysis:
- The dataset includes sales data from **3 unique cities**.
- Each branch operates in a specific city:
  - **Branch A**: Yangon
  - **Branch B**: Naypyitaw
  - **Branch C**: Mandalay

### Product Insights:
- The most common payment methods are **Ewallet** and **Cash**, each accounting for ~34% of transactions.
- The best-selling product line is **Food and Beverages**, contributing the highest sales quantity.
- The highest revenue-generating product line is also **Food and Beverages**.

### Customer Insights:
- The most frequent customer type is **Member**, highlighting customer loyalty.
- The day with the best average customer ratings is **Monday**, with an average rating of **7.15**.
- Female customers tend to make more purchases compared to males.

### Branch and Sales Performance:
- **Branch C** recorded the highest sales revenue, generating **$110,568**.
- The time of day with the highest customer engagement is **Morning**, contributing to sales of **$61,798**.

### Additional Observations:
- The month with the highest revenue is **March**, indicating seasonal patterns.
- **Branch A** had the highest average product rating.

---
## Advanced SQL Operations

### Feature Engineering
#### 1. Add a Column for Time Grouping (Morning, Afternoon, Evening)
```sql
ALTER TABLE walsales
ADD COLUMN time_group varchar(200);

SELECT time,
    CASE 
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
		ELSE "Evening"
    END AS time_group
FROM walsales;

UPDATE walsales
SET time_group = (CASE 
					 WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
					 WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
				     ELSE "Evening"
				  END );
```

#### 2. Add a Column for Day Name and Month Name
```sql
-- ADD Day_name Column
ALTER TABLE walsales
ADD COLUMN Day_name varchar(100);

SELECT date,
    DAYNAME(date) AS day_name
FROM walsales;

UPDATE walsales
SET day_name = DAYNAME(date);


-- ADD Month_name Column
ALTER TABLE walsales
ADD COLUMN month_name varchar(100);

SELECT date,
    MONTHNAME(date) AS month_name
FROM walsales;

UPDATE walsales
SET month_name = MONTHNAME(date);

```



---


## SQL Queries and Analysis

### 1. Product Analysis
#### 1. Fetch Each Product Line and Categorize Them as "Good" or "Bad" Based on Average Sales
```sql
SELECT product_line,
    ROUND(AVG(total), 2) AS total_sales,
    CASE
		WHEN ROUND(AVG(total), 2) > (SELECT ROUND(AVG(total), 2) FROM walsales) THEN "Good"
        ELSE "Bad"
	END AS cluster_sales
FROM walsales
GROUP BY product_line
ORDER BY 2 DESC;
```

#### 2. What Is the Most Common Product Line by Gender?
```sql
SELECT gender,
    product_line,
    COUNT(product_line) AS cnt
FROM walsales
GROUP BY gender, product_line
ORDER BY 2 DESC, 3 DESC;
```

#### 3. What Is the Average Rating of Each Product Line?
```sql
SELECT product_line,
    ROUND(AVG(rating), 2) AS avg_round
FROM walsales
GROUP BY product_line
ORDER BY 2 DESC;
```
--- 

### 2.Customer Analysis
#### 1. Which Day of the Week Has the Best Average Ratings per Branch?
```sql
SELECT day_name,
    branch,
    ROUND(AVG(rating), 2) AS avg_rating
FROM walsales
GROUP BY day_name, branch
HAVING ROUND(AVG(rating), 2) > (SELECT AVG(rating) FROM walsales)
ORDER BY 1 ASC;
```

#### 2. Which Time of Day Do Customers Give Most Ratings?
```sql
SELECT day_name,
    ROUND(AVG(rating), 2) AS rating
FROM walsales
GROUP BY day_name
ORDER BY 2 DESC;
```

#### 3. Which Customer Type Buys the Most?
```sql
SELECT customer_type,
    ROUND(SUM(total)) AS total
FROM walsales
GROUP BY customer_type;
```
---

## Tools

- **Database**: MySQL
- **Data Source**: Walmart Sales Data CSV
---

## Contact

If you have any questions or suggestions regarding this project, feel free to reach out:
- **Email**: [bahawanas427@gmail.com](mailto:bahawanas427@gmail.com)
- **LinkedIn**: [Bahaa Wanas](https://www.linkedin.com/in/bahaa-wanas-9797b923a)

---
