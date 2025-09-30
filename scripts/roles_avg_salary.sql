-- Roles with an average salary above the overall average
-- This query retrieves the job titles whose average salary is higher than the global average salary.
-- It helps to identify high-paying roles.

WITH GlobalAvg AS (
    SELECT AVG(salary_in_usd) AS avg_global_salary
    FROM salaries
)
SELECT 
    job_title
    , ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM salaries s, GlobalAvg g
GROUP BY job_title
HAVING AVG(salary_in_usd) > g.avg_global_salary
ORDER BY avg_salary DESC;

