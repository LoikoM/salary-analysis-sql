-- Salary distribution by contract type (FT, PT, CT)
-- This query calculates the average salary based on employment type (Full-time, Part-time, Contract, etc.).
-- It helps to understand how employment type influences salary.

SELECT 
    employment_type  -- Type of employment (Full-time, Part-time, etc.)
    , ROUND(AVG(salary_in_usd), 2) AS avg_salary  -- Average salary for each employment type
    , COUNT(*) AS num_employees  -- Number of employees for each employment type
FROM salaries s
GROUP BY employment_type;
