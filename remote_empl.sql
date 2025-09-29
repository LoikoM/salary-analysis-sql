-- Do fully remote employees earn more than on-site employees?
-- This query compares the average salaries of employees based on their remote work ratio.
-- remote_ratio = 0 indicates on-site, 50 is hybrid, and 100 is fully remote.

SELECT 
    remote_ratio,
    ROUND(AVG(salary_in_usd), 2) AS avg_salary,  -- Average salary for each remote work category
    COUNT(*) AS num_employees  -- Count of employees in each category
FROM salaries s
GROUP BY remote_ratio
ORDER BY avg_salary DESC;