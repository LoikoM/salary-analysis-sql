-- Top 5 job titles with the highest salaries
-- This query retrieves the highest salaries for the top 5 job titles.
-- It provides insight into which positions are the most lucrative.

SELECT 
    job_title,
    MAX(salary_in_usd) AS max_salary  -- Maximum salary for each job title
FROM salaries s
GROUP BY job_title
ORDER BY max_salary DESC
LIMIT 5;
