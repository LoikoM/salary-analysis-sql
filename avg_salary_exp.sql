--  Average salary by experience level
-- This query calculates the average salary for each experience level (e.g. entry, mid, senior).
-- It helps to analyze the relationship between experience and compensation.
SELECT 
	experience_level
	, COUNT(*) AS num_employees
	, ROUND (AVG(salary_in_usd), 2) AS avg_salary
FROM salaries s 
GROUP BY experience_level
ORDER BY avg_salary  DESC;