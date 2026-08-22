-- ==============================================================================
-- Script: monthly_growth_analysis.sql
-- Description: Analyzes month-over-month (MoM) enrollment growth using the LAG function.
-- Author: [Sam Renard]
-- ==============================================================================

WITH MonthlyStats AS (
    -- Assuming a table named 'enrollments' with a date column 'enrollment_date'
    SELECT 
        DATE_TRUNC('month', enrollment_date) AS report_month,
        COUNT(student_id) AS total_enrollments
    FROM 
        enrollments
    GROUP BY 
        DATE_TRUNC('month', enrollment_date)
),
GrowthAnalysis AS (
    SELECT 
        report_month,
        total_enrollments,
        -- Fetch the previous month's enrollment count
        LAG(total_enrollments, 1) OVER (ORDER BY report_month) AS prev_month_enrollments
    FROM 
        MonthlyStats
)
SELECT 
    report_month,
    total_enrollments,
    prev_month_enrollments,
    -- Calculate the growth percentage safely
    ROUND(
        ((total_enrollments - prev_month_enrollments)::NUMERIC / prev_month_enrollments) * 100, 2
    ) AS growth_percentage
FROM 
    GrowthAnalysis;