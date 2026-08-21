# University Management System

A PostgreSQL database for managing students, courses, and course enrollments.

## Technologies

- PostgreSQL
- SQL
- pgAdmin 4

## Database Structure

- students — stores student information
- courses — stores course information
- enrollments — connects students with  courses

## Features

- Primary and Foreign Keys
- Unique constraints
- Relational database design
- Sample data

  
---

## 🚀 Learning Progress & Exercises
As part of continuously improving my database management skills, I am regularly practicing advanced SQL queries.

### Completed Modules:
- **[pgexercises.com] Basic SQL Queries:** 
  - CRUD operations (`SELECT`, `INSERT`, `UPDATE`, `DELETE`)
  - Filtering and Sorting (`WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`)
  - Advanced conditions (`CASE`, `IN`, `LIKE`, `UNION`)
  - Basic aggregations and subqueries.

*(Check out the `basic_exercises.sql` file in this repository to see the solutions for the completed tasks.)*

#Advanced SQL (PostgreSQL) - Relational Joins
## 📌 Overview
This repository contains the database schema, queries, and exercise solutions completed on Day 13 of the Backend SQL Development track. The primary focus of this session was mastering relational table joins, data aggregation, and query optimization using PostgreSQL.

---

## 🛠️ Database Schema & Implementation

A custom 3-table relational schema was created to practice real-world multi-table mapping:
* **`teachers`**: Stores instructor details.
* **`courses`**: Linked to `teachers` via Foreign Key (`teacher_id`).
* **`students`**: Linked to `courses` via Foreign Key (`course_id`).

### Key SQL Techniques Applied:
* **Multi-Table INNER JOIN**: Connected `students -> courses -> teachers` to generate unified reports.
* **LEFT JOIN & Handling NULLs**: Used `LEFT JOIN` alongside `COALESCE` to display unassigned students and unlinked courses.
* **Aggregations (`GROUP BY`)**: Evaluated instructor workloads by counting student enrollments per teacher.
* **Refactoring & Clean Code**: Standardized queries using table aliases (`s`, `c`, `t`) and structured indentation for readability.

---

## 🏋️ Problem Solving (`pgexercises.com`)

Completed practical scenarios under the **"Joins and Subqueries"** section on `pgexercises`:

1. **Filtered Joins**: Retrieved individual booking logs for specific members (`David Farrell`).
2. **Date & Facility Filtering**: Filtered booking schedules specifically for Tennis Courts on target dates.
3. **Self-Join**: Joined the `cd.members` table with itself to map member recommendation hierarchies (`recommendedby`).
4. **Outer Joins**: Retained all member records while mapping optional recommender information.
5. **3-Table Join Integration**: Executed multi-table joins across `cd.members`, `cd.bookings`, and `cd.facilities` to isolate facility usage.

---

## 🚀 Getting Started

1. Open **pgAdmin 4** or any PostgreSQL client.
2. Create a new database: `day13_joins_db`.
3. Open a Query Tool session and run the provided `day13_advanced_sql_joins.sql` script to set up the schema, populate seed data, and execute analytical queries.

---
**Tech Stack**: PostgreSQL | pgAdmin 4 | Git / GitHub


# Advanced SQL (PostgreSQL): Sales Analytics 📊

This repository contains practical SQL scripts developed as part of **Day 14** of my Data/Backend engineering curriculum. The primary focus is on advanced PostgreSQL concepts, specifically data aggregation and filtering.

## 🎯 Learning Objectives Completed
- **GROUP BY & HAVING:** Grouping datasets and applying conditional filters to aggregated results.
- **Aggregate Functions:** Utilizing `COUNT()`, `SUM()`, and `AVG()` for business analytics.
- **NULL Behavior:** Understanding and handling `NULL` values safely in arithmetic operations and groupings using `COALESCE`.
- **Refactoring:** Practicing the "5-minute review" habit to improve code reliability and readability.

## 🗄️ Database Schema
The mock database simulates a basic E-commerce environment:
1. `customers` - Stores client data.
2. `orders` - Tracks individual order transactions.
3. `order_items` - Details the specific products/categories within an order.

## 🚀 Key Scenarios Implemented
The `sales_analytics.sql` script includes the following analytical queries:
1. **Monthly Revenue:** Calculates total revenue generated per month based on the order dates.
2. **Top-5 Customers:** Identifies the highest-spending customers using table `JOIN`s and `ORDER BY ... DESC`.
3. **Average Ticket by Category:** Calculates the average order value (Average Ticket) grouped by product category.

### 🛠️ Continuous Improvement (Code Refactoring)
Following the **"read the code again and improve 1 thing"** rule, the initial monthly revenue query was refactored to:
- Safely handle missing (`NULL`) amounts using `COALESCE()`.
- Use the `ROUND()` function to maintain financial precision (2 decimals).
- Implement a `HAVING` clause to filter and display only months generating over $1,000 in revenue.

## 💻 How to Run
1. Clone this repository to your local machine.
2. Open **pgAdmin** or any PostgreSQL client (e.g., DBeaver, DataGrip).
3. Connect to a PostgreSQL database.
4. Execute the `sales_analytics.sql` file in the Query Tool. The script automatically sets up the mock schema, inserts sample data, and is ready for executing the analytical queries.



# 🚀 PostgreSQL Performance Optimization & Indexing

## 📖 Overview
This repository contains the practical implementation for **Day 16 of the Backend Engineering Protocol**. The primary focus is on understanding database performance, specifically how to generate large datasets, analyze query execution plans, and optimize slow queries using **B-tree indexes**.

## 🛠️ Features & Tasks Completed
- **Data Generation:** Created a `users` table and populated it with **1,000,000 rows** of mock data using PostgreSQL's native `generate_series()` function.
- **Performance Analysis:** Used `EXPLAIN ANALYZE` to measure the execution time of a sequential scan (slow query) before indexing.
- **B-tree Indexing:** Created a B-tree index on the `username` column to optimize search operations.
- **100x Speed Optimization:** Compared query execution plans, proving the transition from a slow **Seq Scan** to a lightning-fast **Index Scan**.
- **Code Refactoring:** Improved query efficiency by replacing `SELECT *` with explicit column selections (`SELECT id, username`) to save memory and bandwidth.

## 🧠 Deep Theory Covered
- **Indexes (B-tree):** How balanced trees work under the hood to prevent full table scans.
- **EXPLAIN ANALYZE:** The difference between query estimation (`EXPLAIN`) and actual execution metrics (`ANALYZE`).
- **Database Normalization:** Principles of organizing tables to reduce redundancy (1NF: Atomicity, 2NF: No partial dependency, 3NF: No transitive dependency).

## 💻 How to Run
1. Open pgAdmin, DBeaver, or the `psql` terminal.
2. Connect to your PostgreSQL database.
3. Execute the SQL commands from the `postgres_indexing.sql` file sequentially.
4. Observe the `Execution Time` difference in the output console before and after creating the index.
  



