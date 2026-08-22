-- ==============================================================================
-- Script: course_leaderboard.sql
-- Description: Calculates the top 3 students for each course using Window Functions.
-- Author: [Sam Renard]
-- ==============================================================================

WITH RankedStudents AS (
    SELECT 
        course_name,
        student_name,
        score,
        -- DENSE_RANK is used to avoid skipping ranks if students have the exact same score
        DENSE_RANK() OVER (PARTITION BY course_name ORDER BY score DESC) AS rank_position
    FROM 
        exam_results
)
SELECT 
    course_name,
    student_name,
    score,
    rank_position
FROM 
    RankedStudents
WHERE 
    rank_position <= 3;