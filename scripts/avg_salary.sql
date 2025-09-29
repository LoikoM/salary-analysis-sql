-- 1) Average salary for each job title
-- It helps to understand the general compensation for different roles in the company.

SELECT 
	job_title
	, ROUND (AVG(salary_in_usd)) AS avg_salary
FROM salaries s 
GROUP BY job_title 
ORDER BY avg_salary DESC;
