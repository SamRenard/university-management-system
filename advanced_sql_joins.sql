/*
  =============================================================================
  Day 13: Advanced SQL (PostgreSQL) - Joins
  Author: [Sam Renard]
  Description: Demonstrating the use of INNER JOIN, LEFT JOIN, and GROUP BY 
               using a 3-table relational database (Teachers -> Courses -> Students).
  =============================================================================
*/

-- =========================================
-- 1. SCHEMA CREATION
-- =========================================

-- Create 'teachers' table
CREATE TABLE teachers (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

-- Create 'courses' table with a foreign key linking to 'teachers'
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    teacher_id INT REFERENCES teachers(id) ON DELETE SET NULL
);

-- Create 'students' table with a foreign key linking to 'courses'
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    course_id INT REFERENCES courses(id) ON DELETE SET NULL
);

-- =========================================
-- 2. SEEDING DATA
-- =========================================

INSERT INTO teachers (full_name) VALUES 
('Dr. Alan Turing'), 
('Grace Hopper'), 
('Linus Torvalds');

INSERT INTO courses (course_name, teacher_id) VALUES 
('Backend Engineering (PostgreSQL)', 1), 
('Frontend Development (React)', 2), 
('Mobile App Development', NULL); -- Course assigned to no teacher yet

INSERT INTO students (full_name, course_id) VALUES 
('Alice Smith', 1), 
('Bob Jones', 1), 
('Charlie Brown', 2), 
('Diana Prince', NULL); -- Student not enrolled in any course yet

-- =========================================
-- 3. QUERIES & ANALYSIS
-- =========================================

-- Query 1: Retrieve a full list of enrolled students, their courses, and teachers (INNER JOIN)
-- Refactored: Using aliases (s, c, t) for cleaner and more readable code
SELECT 
    s.full_name AS student_name, 
    c.course_name, 
    t.full_name AS teacher_name
FROM students s
INNER JOIN courses c ON s.course_id = c.id
INNER JOIN teachers t ON c.teacher_id = t.id;


-- Query 2: Retrieve all students and their courses, including unassigned students (LEFT JOIN)
SELECT 
    s.full_name AS student_name, 
    COALESCE(c.course_name, 'Not Enrolled') AS course_status
FROM students s
LEFT JOIN courses c ON s.course_id = c.id;


-- Query 3: Calculate the total number of students per teacher (Multiple JOINS + Aggregation)
SELECT 
    t.full_name AS teacher_name, 
    COUNT(s.id) AS total_students
FROM teachers t
INNER JOIN courses c ON t.id = c.teacher_id
INNER JOIN students s ON c.id = s.course_id
GROUP BY t.full_name
ORDER BY total_students DESC;