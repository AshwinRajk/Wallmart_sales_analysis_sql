create database if not exists Walmart_sales_analysis;
create table if not exists sales (
	invoice_id VARCHAR(30) not null primary key,
    branch varchar(5) not null,
    city varchar(30) not null,
    customer_type varchar(30) not null,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_percentage float ( 11, 9) ,
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);




SELECT 
	time,
   ( CASE
    WHEN 'time' BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
    WHEN 'time' BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
	ELSE "Evening"  
    END 
    ) AS Time_of_day
    FROM sales;
    
    
    
    SELECT time,
     ( CASE
    WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
    WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
	ELSE "Evening"  
    END 
    ) AS Time_of_day
    FROM sales;
    
    ALTER table sales add column Time_of_day varchar(20);
  
  UPDATE sales
  SET time_of_day = ( CASE
    WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
    WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
	ELSE "Evening"  
    END );
    
    
   
    
    SELECT date,
		dayname(date)
    FROM sales;
    
    ALTER table sales add column day_name varchar(10);
    
    UPDATE sales
    SET day_name = dayname(date);
    
    
  
    

    SELECT 
    date ,
    monthname(date)
    FROM sales;
   
  
  
ALTER table sales add column month_name varchar(10);
UPDATE sales
SET month_name = monthname(date);



SELECT
distinct city,
branch
FROM sales;
   

SELECT 
count(distinct product_line)
FROM sales;



SELECT
	payment_method,
    COUNT(payment_method)
FROM sales
GROUP BY payment_method;



SELECT
	product_line,
    COUNT(product_line) as most_selling
FROM sales
GROUP BY product_line
ORDER BY most_selling desc;



SELECT
	month_name as month,
    sum(total) as total_revenue
FROM sales
GROUP BY month
ORDER BY total_revenue DESC;



SELECT
	month_name AS month,
    SUM(cogs) as cogs
FROM sales
GROUP BY month
ORDER BY cogs DESC;



SELECT
	product_line,
    SUM(total) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue desc;




SELECT
	city,
    branch,
    SUM(total) as total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue desc;




SELECT
product_line,
avg(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax desc;



SELECT
branch,
sum(quantity) as qty
FROM sales
GROUP BY branch
HAVING sum(quantity) > (select avg( quantity) from sales);



SELECT
gender,
product_line,
COUNT(gender) as common
FROM sales
GROUP BY gender, product_line
ORDER BY common desc;




SELECT
product_line,
round(avg(rating), 2) as avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating desc;



SELECT
time_of_day,
COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Monday"
GROUP BY time_of_day
ORDER BY total_sales desc;



SELECT
customer_type,
SUM(total) as most_revenue
FROM sales
GROUP BY customer_type
ORDER BY most_revenue desc;




SELECT
city,
avg (tax_pct) as max_tax
FROM sales
GROUP BY city
ORDER BY max_tax desc;



SELECT
customer_type,
avg(tax_pct) as VAT
FROM sales
GROUP BY customer_type
ORDER BY VAT desc;



SELECT
DISTINCT(customer_type)
FROM 
sales;


SELECT
DISTINCT (payment_method)
FROM 
sales;


SELECT
customer_type,
count(customer_type) as most_common
FROM 
sales
GROUP BY customer_type
ORDER BY most_common desc;


SELECT
customer_type,
COUNT(*) as cstm_cnt
from sales
group by customer_type
order by cstm_cnt desc;


SELECT
gender,
COUNT(gender)as most_cnt
from sales
group by gender
order by most_cnt desc;



SELECT
gender,
COUNT(*)as most_cnt
from sales
where branch = "a"
group by gender
order by most_cnt desc;



SELECT
time_of_day,
avg(rating) as most_rtng
from sales
group by time_of_day
order by most_rtng desc;



SELECT
time_of_day,
avg(rating) as most_rtng
from sales
where branch = "c"
group by time_of_day
order by most_rtng desc;





