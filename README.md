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

## Dataset Metadata

- **Source**: Walmart Sales Data
- **Rows**: 1,000
- **Columns**: 17
- **Features**:
  - `Invoice ID`: Unique identifier for each transaction.
  - `Branch`: Store branch (A, B, C).
  - `City`: Location of the branch (Yangon, Naypyitaw, Mandalay).
  - `Customer Type`: Type of customer (Member or Normal).
  - `Gender`: Gender of the customer.
  - `Product Line`: Product categories such as Health and Beauty, Electronic Accessories, etc.
  - `Unit Price`: Price per unit of the product.
  - `Quantity`: Quantity of items sold in a transaction.
  - `Tax 5%`: 5% tax applied to the total sales.
  - `Total`: Total amount including tax.
  - `Date`: Date of the transaction.
  - `Time`: Time of the transaction.
  - `Payment`: Payment method (Ewallet, Cash, Credit Card).
  - `COGS`: Cost of goods sold.
  - `Gross Margin Percentage`: Percentage profit margin.
  - `Gross Income`: Gross income from the transaction.
  - `Rating`: Customer satisfaction rating.

---

## SQL Queries and Analysis

### Feature Engineering:
- **Time Clustering**: Grouped transaction times into Morning, Afternoon, and Evening.
- **Day Name Extraction**: Extracted the day of the week from the `Date` column.
- **Month Name Extraction**: Extracted the month name for monthly trend analysis.

### Business Questions Addressed:
#### General Analysis:
- Number of unique cities and branches.

#### Product Analysis:
- Best-selling product lines.
- Most common payment methods.
- Total revenue by product line and month.

#### Customer Insights:
- Customer types with the most purchases and revenue.
- Ratings analysis by day, branch, and time of day.

#### Branch and Sales Performance:
- Branch with the highest revenue.
- Time of day with the highest sales.

---

## Tools

- **Database**: MySQL
- **IDE**: MySQL Workbench
- **Data Source**: Walmart Sales Data CSV

---
