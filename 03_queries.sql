-- 1.	Write an SQL query to list all order_id that include an 'XL' pizza.

SELECT od.order_id
FROM pizzas AS p
JOIN order_details AS od
ON p.pizza_id = od.pizza_id
WHERE p.size = 'XL';


-- 2.	Find the total number of pizzas sold in each pizza category.

SELECT SUM(od.quantity) AS total_pizza_number, pt.category
FROM order_details AS od
JOIN pizzas AS p
ON p.pizza_id = od.pizza_id
JOIN pizza_types AS pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_pizza_number;


-- 3.	Find the category with the highest-selling pizza size.

SELECT pt.category, SUM(od.quantity) AS total_quantity, p.size
FROM order_details AS od
JOIN pizzas AS p
ON p.pizza_id = od.pizza_id
JOIN pizza_types AS pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category, p.size
ORDER BY total_quantity DESC
LIMIT 1;


-- 4.	Get the hourly breakdown of total pizzas sold. 

SELECT SUM(od.quantity) AS total_pizzas_sold, HOUR(o.order_time) AS hourly_breakdown
FROM orders AS o
JOIN order_details AS od
ON o.order_id = od.order_id
GROUP BY hourly_breakdown 
ORDER BY hourly_breakdown;


-- 5.	Retrieve the daily revenue per order_date.

SELECT SUM(od.quantity * p.price) AS daily_revenue, o.order_date
FROM orders AS o
JOIN order_details AS od
ON o.order_id = od.order_id
JOIN pizzas AS p
ON od.pizza_id = p.pizza_id
GROUP BY o.order_date
ORDER BY o.order_date;


-- 6.Calculate the average number of pizzas ordered per day.

SELECT ROUND(AVG(quantity),0) AS average_orders_per_day
FROM 
(SELECT SUM(od.quantity) AS quantity, o.order_date
FROM orders AS o
JOIN order_details AS od
ON o.order_id = od.order_id
GROUP BY o.order_date) AS order_quantity;


-- 7.	Retrieve the top 3 categories by total sales value.

SELECT pt.category, SUM(od.quantity * p.price) AS total_sales_value
FROM order_details AS od
JOIN pizzas AS p
ON p.pizza_id = od.pizza_id
JOIN pizza_types AS pt
ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_sales_value DESC
LIMIT 3;


-- 8.	Determine the top 3 most ordered pizza types based on revenue for each pizza category.

SELECT category, pizza_name, revenue
FROM (
    SELECT pt.category, pt.name AS pizza_name, SUM(od.quantity * p.price) AS revenue,
           ROW_NUMBER() OVER (PARTITION BY pt.category ORDER BY SUM(od.quantity * p.price) DESC) AS rn
    FROM order_details AS od
    JOIN pizzas AS p 
    ON od.pizza_id = p.pizza_id
    JOIN pizza_types AS pt 
    ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category, pt.name
) AS ranked
WHERE rn <= 3
ORDER BY category, revenue DESC;


-- 9.	Calculate the percentage contribution of each pizza type to total revenue.

SELECT pt.pizza_type_id AS pizza_type,
       ROUND(SUM(od.quantity * p.price) / total.total_revenue * 100, 2) AS revenue_percentage
FROM order_details AS od
JOIN pizzas AS p
ON od.pizza_id = p.pizza_id
JOIN pizza_types AS pt 
ON p.pizza_type_id = pt.pizza_type_id
JOIN (
    SELECT SUM(od.quantity * p.price) AS total_revenue
    FROM order_details AS od
    JOIN pizzas AS p 
    ON od.pizza_id = p.pizza_id
) AS total
GROUP BY pt.pizza_type_id, total.total_revenue
ORDER BY revenue_percentage DESC;


-- 10.	Find the Name and Price of the most expensive pizza.

SELECT pt.name, p.price
FROM pizza_types AS pt 
JOIN pizzas AS p
ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

































