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
