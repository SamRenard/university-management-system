-- ==========================================
-- PostgreSQL Basic Exercises (pgexercises.com)
-- ==========================================

-- 1. Retrieve all information from the facilities table
SELECT * 
FROM cd.facilities;

-- 2. Retrieve specific columns from the facilities table
SELECT name, membercost 
FROM cd.facilities;

-- 3. Retrieve facilities that charge a fee to members
SELECT * 
FROM cd.facilities 
WHERE membercost > 0;

-- 4. Retrieve facilities that charge a fee and are inexpensive compared to their monthly maintenance
SELECT facid, name, membercost, monthlymaintenance 
FROM cd.facilities 
WHERE membercost > 0 
  AND membercost < (monthlymaintenance / 50.0);

-- 5. Retrieve facilities containing the word 'Tennis' in their name
SELECT * 
FROM cd.facilities 
WHERE name LIKE '%Tennis%';

-- 6. Retrieve facilities with specific IDs (1 and 5)
SELECT * 
FROM cd.facilities 
WHERE facid IN (1, 5);

-- 7. Classify facilities as 'cheap' or 'expensive' based on maintenance cost
SELECT name, 
       CASE 
           WHEN (monthlymaintenance > 100) THEN 'expensive' 
           ELSE 'cheap' 
       END AS cost 
FROM cd.facilities;

-- 8. Retrieve members who joined after a specific date (September 2012)
SELECT memid, surname, firstname, joindate 
FROM cd.members 
WHERE joindate >= '2012-09-01';

-- 9. Retrieve a unique, alphabetically sorted list of member surnames (Limited to 10)
SELECT DISTINCT surname 
FROM cd.members 
ORDER BY surname 
LIMIT 10;

-- 10. Combine member surnames and facility names into a single list
SELECT surname 
FROM cd.members 
UNION 
SELECT name 
FROM cd.facilities;

-- 11. Retrieve the join date of the last registered member
SELECT MAX(joindate) AS latest_join_date 
FROM cd.members;

-- 12. Retrieve the first and last name of the last registered member
SELECT firstname, surname, joindate 
FROM cd.members 
WHERE joindate = (SELECT MAX(joindate) FROM cd.members);