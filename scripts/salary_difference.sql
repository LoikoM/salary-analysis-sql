-- Salary difference between managerial and technical roles
-- This query classifies roles into managerial and technical based on job title and calculates the average salary for each group.

SELECT 
    CASE 
        WHEN job_title LIKE '%Manager%' OR job_title LIKE 'Head%' 
        THEN 'Managerial'  -- Roles containing "Manager" or "Head" are classified as managerial
        ELSE 'Technical'   -- All other roles are classified as technical
    END AS role_type
    , ROUND(AVG(salary_in_usd), 2) AS avg_salary  -- Average salary for each role type
FROM salaries
GROUP BY role_type;

