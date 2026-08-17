-- ============================================
-- University Management System
-- PostgreSQL Database Schema
-- ============================================

-- Create the students table.
-- Each student has a unique ID, name, email, and age.
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    age INTEGER
);

-- Create the courses table.
-- Each course has a unique ID, name, and description.
CREATE TABLE courses (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create the enrollments table.
-- This table connects students with the courses they attend.
CREATE TABLE enrollments (
    id INTEGER PRIMARY KEY,
    student_id INTEGER REFERENCES students(id),
    course_id INTEGER REFERENCES courses(id)
);

-- Prevent a student from enrolling in the same course more than once.
ALTER TABLE enrollments
ADD CONSTRAINT unique_student_course
UNIQUE (student_id, course_id);

-- Insert sample students.
INSERT INTO students (id, name, email, age)
VALUES
(1, 'Ali', 'ali@example.com', 20),
(2, 'Leyla', 'leyla@example.com', 21),
(3, 'Murad', 'murad@example.com', 19);

-- Insert sample courses.
INSERT INTO courses (id, name, description)
VALUES
(1, 'Python', 'Python programming fundamentals'),
(2, 'PostgreSQL', 'Database and SQL fundamentals'),
(3, 'FastAPI', 'Building APIs with Python');

-- Insert student-course enrollments.
INSERT INTO enrollments (id, student_id, course_id)
VALUES
(1, 1, 2),
(2, 1, 3),
(3, 2, 2),
(4, 3, 1);