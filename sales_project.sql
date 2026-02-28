SHOW DATABASES;
CREATE DATABASE IF NOT EXISTS sales_project;
USE sales_project;
SHOW TABLES;

CREATE TABLE if not exists sales (
order_id int,
customer_name VARCHAR(50),
city  VARCHAR(50),
product  VARCHAR(20),
amount int
);

insert into sales values
('1','Asha','pune','Laptop',50000),
('2','Rahul','Mumbai','Mobile',20000),
('3','Asha','pune','Mouse',1000),
('4','neha','pune','Laptop',50000),
('5','Rahul','mumbai','Laptop',60000),
('6','Asha','pune','keyboard',2000);

select * from sales;

###Total sales per city 
SELECT city,SUM(amount) AS total_sales
FROM sales
GROUP BY city;

##Total laptop sales per city
select city,SUM(amount) as total_sales
from sales
where Product = 'Laptop'
group by city;

##cities with total sales > 60000
select city,SUM(amount) as total_sales
from sales
group by city
HAVING SUM(amount) > 60000;

##find total sales per customer
select  SUM(amount) as total_sales from sales;

##count the number of order per city
select  city, COUNT(order_id) as total_order from sales
GROUP BY city;


##Find average order amount per product
select product , avg(amount) as total_average from sales
group by product;

#Find maximum order amount per city
select city , MAX(amount) as maximum_order from sales
group by city;

##Find minimum order amount per customer
select customer_name, MIN(amount) as minimum_order from sales 
group by customer_name;


##Show cities where total sales > 70000.
select city,SUM(amount) as total_sales
from sales
GROUP BY city
HAVING SUM(amount) > 70000;

##show customers who made more than 2 orders
SELECT customer_name, COUNT(order_id) AS total_orders
FROM sales
GROUP BY customer_name
HAVING COUNT(order_id) > 2;

##show products whose average price is greater than 25000.
SELECT product, AVG(amount) AS avg_price
FROM sales
GROUP BY product
HAVING AVG(amount) > 25000;

##count the numbers of products sold per city
SELECT city, COUNT(product) AS total_products_sold
FROM sales
GROUP BY city;