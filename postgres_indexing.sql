-- ==============================================================================
-- DAY 16: Advanced SQL (PostgreSQL) - Performance Optimization & Indexing
-- Description: Generating 1M rows of test data, analyzing query performance 
--              before and after applying a B-Tree Index, and code refactoring.
-- Author: [Sam Renard]
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- STEP 1: Create the target table for performance testing
-- ------------------------------------------------------------------------------
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ------------------------------------------------------------------------------
-- STEP 2: Generate 1,000,000 rows of mock data
-- Using PostgreSQL's native generate_series() function for fast bulk insertion.
-- ------------------------------------------------------------------------------
INSERT INTO users (username, email)
SELECT 
    'user_' || i, 
    'user_' || i || '@example.com'
FROM generate_series(1, 1000000) AS i;

-- ------------------------------------------------------------------------------
-- STEP 3: Analyze the Slow Query (Before Indexing)
-- Expected output: Sequential Scan (Seq Scan) forcing the DB to read every row.
-- Execution time will be relatively high.
-- ------------------------------------------------------------------------------
EXPLAIN ANALYZE 
SELECT * FROM users 
WHERE username = 'user_999999';

-- ------------------------------------------------------------------------------
-- STEP 4: Apply a B-Tree Index
-- Creating an index on the 'username' column to optimize search queries.
-- ------------------------------------------------------------------------------
CREATE INDEX idx_users_username ON users(username);

-- ------------------------------------------------------------------------------
-- STEP 5: Analyze the Fast Query (After Indexing)
-- Expected output: Index Scan. The DB directly finds the row using the B-Tree.
-- Execution time should be approximately 100x faster.
-- ------------------------------------------------------------------------------
EXPLAIN ANALYZE 
SELECT * FROM users 
WHERE username = 'user_999999';

-- ------------------------------------------------------------------------------
-- STEP 6: Refactoring (Continuous Improvement)
-- Refactor reason: Using 'SELECT *' is a bad practice in production because it 
-- fetches unnecessary columns, wasting memory and network bandwidth.
-- Solution: Explicitly select only the required columns.
-- ------------------------------------------------------------------------------
EXPLAIN ANALYZE 
SELECT id, username 
FROM users 
WHERE username = 'user_999999';

-- ==============================================================================
-- END OF SCRIPT
-- ==============================================================================