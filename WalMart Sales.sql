-- Approach 1: Data Wrangling

-- 1. Create Database and Table for our data.
CREATE DATABASE WalMartSales;
USE WalMartSales;

-- ******************************************************************************************************

-- Approach 2: Feature Engineering.

-- 1. cluster 'time' column into 'Morning', 'Afternoon', 'Evening' and add them to a new column.

ALTER TABLE walsales -- first we create a new column to add our data in.
ADD COLUMN time_group varchar(200);




select -- then we used a case statement to cluster our data.
	time,
    case 
		when `time` between "00:00:00" and "12:00:00" then "Morning"
        when `time` between "12:01:00" and "16:00:00" then "Afternoon"
	else "Evening"
    end as time_group
from
	walsales;
    
    
    
    
update  walsales -- Finally we add our clusterd data into `time_group' column.
set time_group = (case 
					 when `time` between "00:00:00" and "12:00:00" then "Morning"
					 when `time` between "12:01:00" and "16:00:00" then "Afternoon"
				     else "Evening"
				  end );
                  
                  
                  
                  
-- 2. Add a new column contains name of the days based on `date` column, because this help us to answer the question on which week of the day each branch is busiest.

 ALTER TABLE walsales -- adding a new column `day_name`.
 ADD COLUMN Day_name varchar(100);
 
 
 
 
 select -- extracting the name of days.
	date,
    dayname(date) as day_name
from walsales;




update walsales -- adding name of days to `day_name` column
set day_name = dayname(date);




-- 3. Add a new column contains name of the Months based on `date` column.

 ALTER TABLE walsales -- adding a new column `month_name`.
 ADD COLUMN month_name varchar(100);
 
 
 
 
 select -- extracting the name of days.
	date,
    monthname(date) as day_name
from walsales;




update walsales -- adding name of days to `day_name` column
set month_name = monthname(date);

select
	distinct month_name,
    day_name
from
	walsales;


-- ******************************************************************************************************

-- 1- Business Questions To Answer: Generic Question



-- 1. How many unique cities does the data have?
select
	distinct city
from
	walsales;
    
    
    
    
-- 2. In which city is each branch?
select distinct
	city,
    branch
from
	walsales;

-- ******************************************************************************************************
-- 2- Business Questions To Answer: Product


-- 1. How many unique product lines does the data have?
select distinct
	product_line
from
	walsales;



-- 2. What is the most common payment method?
select distinct
	payment,
    count(payment) num_payment
from
	walsales
group by 
	payment
order by
	2 desc;


-- 3. What is the most selling product line?
select
	product_line,
    sum(quantity) as total_quantity
from
	walsales
group by 
	product_line
order by 
	2 desc;
    
    
    

-- 4. What is the total revenue by month?
select 
	month_name,
    round(sum(total)) as total_revenue
from
	walsales
group by 
	month_name
order by 2 desc;



-- 5. What month had the largest COGS?
select 
	month_name,
    round(sum(Cogs)) as total_COGS
from
	walsales
group by 
	month_name
order by 2 desc;




-- 6. What product line had the largest revenue?
select 
	product_line,
    round(sum(total)) as total
from
	walsales
group by 
	product_line
order by 2 desc;



-- 7. What is the city with the largest revenue?

select
	city,
    round(sum(total)) as total
from
	walsales
group by 
	city
order by 2 desc;



-- 8. What product line had the largest VAT?
select
	product_line,
    round(avg(tax_5), 2) as total_tax_5
from
	walsales
group by 
	product_line
order by 2 desc;



-- 9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

select
	product_line,
    round(avg(total), 2) as total_sales,
    case
		when round(avg(total), 2) > (select round(avg(total), 2) from walsales) then "Good"
        else "Bad"
	end as cluster_sales
from
	walsales
group by 
	product_line
order by 2 desc ;




-- 10. Which branch sold more products than average product sold?

select
	branch,
    round(avg(quantity),2) as avg_quantity
from 
	walsales
group by 
	branch
having 
	round(avg(quantity),2) > (select round(avg(quantity), 2) from walsales);
    



-- 11. What is the most common product line by gender?
select
	gender,
    product_line,
    count(product_line) as cnt
from 
	walsales
group by
	gender, product_line
order by 
	2 desc, 3 desc;




-- 12. What is the average rating of each product line?
select
	product_line,
    round(avg(rating), 2) as avg_round
from
	walsales
group by 
	product_line
order by 2 desc; 


-- ******************************************************************************************************
-- 3- Business Questions To Answer: Customer
/*
What is the gender of most of the customers?
What is the gender distribution per branch?
Which time of the day do customers give most ratings?
Which time of the day do customers give most ratings per branch?
Which day fo the week has the best avg ratings?
Which day of the week has the best average ratings per branch?
*/
-- 1. How many unique customer types does the data have?
select
	distinct customer_type
from
	walsales;



-- 2. What is the most common customer type?
select
	customer_type,
    count(customer_type) as cnt
from 
	walsales
group by customer_type;




-- 3. Which customer type buys the most?

select
	customer_type,
    round(sum(total)) as total
from 
	walsales
group by 
	customer_type;


-- 4. What is the gender of most of the customers?
select
	gender,
    customer_type,
    count(customer_type) as cnt
from
	walsales
group by 
	gender, customer_type;
    
    
    
    
-- 5. Which day of the week has the best average ratings per branch?
select
	day_name,
	branch,
    round(avg(rating),2) as avg_rating
from
	walsales
group by 
	day_name, branch
having 
	round(avg(rating),2) > (select avg(rating) from walsales)
order by 1 asc	;



-- 6. Which time of the day do customers give most ratings?
select
	day_name,
    round(avg(rating), 2) as rating
from
	walsales
group by
	day_name
order by 2 desc;


-- 7. Which time of the day do customers give most ratings per branch?
select
	time_group,
    round(avg(rating), 2) as rating
from
	walsales
group by 
	time_group
order by 
	2 desc














