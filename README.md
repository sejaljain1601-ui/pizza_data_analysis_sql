# Pizza Mania SQL Project

## Project Overview
This project is a relational database analysis of Pizza Mania’s data. The main goal is to analyze pizza orders, revenue trends, and popular pizza categories and sizes using SQL. It demonstrates database design, query writing, and basic data analysis techniques.

---
## Database Schema
The project contains four main tables:

**Orders** - `order_id (Primary Key)`, `order_date`, `order_time`

**PizzaTypes** - `pizza_type_id (Primary Key)`, `name`, `category`, `ingredients` 

**Pizzas** - `pizza_id (Primary Key)`, `pizza_type_id (Foreign Key -> PizzaTypes)`, `size (S/M/L/XL)`, `price`

**Order_Details** - `order_details_id (Primary Key)`, `order_id (Foreign Key -> Orders)`, `pizza_id (Foreign Key -> Pizzas)`, `quantity`

Relationships:
•	Each order can have multiple pizzas.
•	Each pizza can appear in multiple orders.

---
## SQL Scripts
The repository includes three main SQL scripts:

- `01_create_database.sql` – Creates the Pizza Mania database

- `02_create_tables.sql` – Creates all tables (Orders, Pizza_Types, Pizzas, Order_Details) with primary and foreign keys

- `03_queries.sql` – Contains all 10 analysis queries 

---
## Key Queries & Analysis
The repository includes the following queries with explanations:

**1. List all orders that include an 'XL' pizza** - Retrieves order IDs for all orders containing XL pizzas.

**2. Total number of pizzas sold in each pizza category** - Aggregates quantities per category to show which category sold the most.

**3. Category with the highest-selling pizza size** - Finds the most popular pizza size within all categories based on quantity sold.

**4. Hourly breakdown of total pizzas sold** - Summarizes pizza sales by hour to identify peak sales times.

**5. Daily revenue per order_date** - Calculates total revenue generated each day.

**6. Average number of pizzas ordered per day** - Computes the mean daily pizza sales.

**7. Top 3 categories by total sales value**- Identifies pizza categories generating the highest revenue.

**8. Top 3 most ordered pizza types by revenue per category** - Ranks pizza types by revenue within each category.
   
**9. Percentage contribution of each pizza type to total revenue** - Shows how much each pizza type contributes to overall sales.
  
**10. Most expensive pizza** - Retrieves the name and price of the costliest pizza.
    
---
## Insights & Findings
**•	Peak Hours:** Highest pizza sales occur during 12 PM–1 PM (lunch) and 5 PM–6 PM (dinner). Morning (9–10 AM) and late night (10–11 PM) have minimal sales.

**•	Top-Selling Pizza by Quantity:** Classic pizza leads in total units sold (14,888), followed by Supreme, Veggie, and Chicken categories.

**•	Top Revenue-Generating Pizzas:** Thai Chicken Pizza generates the highest revenue (43,434.25), followed closely by Barbecue and California Chicken Pizzas. Chicken pizzas overall bring in the most revenue per category.

**•	Balanced Performance Across Categories:** Classic pizzas dominate in quantity, Chicken pizzas dominate in revenue, and Supreme & Veggie pizzas maintain moderate sales, showing a well-rounded menu.

**•	Most Expensive Pizza:** The Greek Pizza at 35.95 is the priciest, useful for premium pricing strategies or upselling opportunities.

---
## Repository Structure
Pizza_Data_Analysis_SQL/

├── `create_database.sql`       # Script to create the database

├── `create_tables.sql`         # Script to create all tables with PKs & FKs

├── `queries.sql`               # All analysis queries

└── `README.md`                 # Project overview, schema, queries, insights

---
**AUTHOR**

Sejal Jain – SQL & Data Analysis Enthusiast

•	GitHub: [SejalJain1601-ui] (https://github.com/sejaljain1601-ui)

•	LinkedIn: [Sejal Jain] (www.linkedin.com/in/sejal-jain-lko)

