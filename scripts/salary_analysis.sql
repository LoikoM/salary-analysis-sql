
--Salary Analysis SQL Queries

-- Description: This file contains a collection of SQL queries to analyze employee salaries 
-- based on various dimensions such as job title, experience level, remote work, and more.

-- 1) Average salary by job title
-- 2) Average salary by experience level
-- 3) Salary comparison: Remote vs On-site employees
-- 4) Top 5 job titles with highest salaries
-- 5) Salary difference between managerial and technical roles
-- 6) Roles with an average salary above the overall average
-- 7) Salary distribution by contract type

---------------------


-- 1) Average salary for each job title
-- It helps to understand the general compensation for different roles in the company.

SELECT 
	job_title
	, ROUND (AVG(salary_in_usd)) AS avg_salary
FROM salaries s 
GROUP BY job_title 
ORDER BY avg_salary DESC;



-- 2) Average salary by experience level
-- This query calculates the average salary for each experience level (e.g. entry, mid, senior).
-- It helps to analyze the relationship between experience and compensation.
SELECT 
	experience_level
	, COUNT(*) AS num_employees  -- Counting number of employees for each experience level
	, ROUND (AVG(salary_in_usd), 2) AS avg_salary -- Average salary for each experience level
FROM salaries s 
GROUP BY experience_level
ORDER BY avg_salary  DESC;


-- 3) Do fully remote employees earn more than on-site employees?
-- This query compares the average salaries of employees based on their remote work ratio.
-- remote_ratio = 0 indicates on-site, 50 is hybrid, and 100 is fully remote.

SELECT 
    remote_ratio
    , ROUND(AVG(salary_in_usd), 2) AS avg_salary  -- Average salary for each remote work category
    , COUNT(*) AS num_employees  -- Count of employees in each category
FROM salaries s
GROUP BY 1
ORDER BY 2 DESC;


-- 4) Top 5 job titles with the highest salaries
-- This query retrieves the highest salaries for the top 5 job titles.
-- It provides insight into which positions are the most lucrative.

SELECT 
    job_title
    , MAX(salary_in_usd) AS max_salary  -- Maximum salary for each job title
FROM salaries s
GROUP BY job_title
ORDER BY max_salary DESC
LIMIT 5;


-- 5) Salary difference between managerial and technical roles
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


-- 6) Roles with an average salary above the overall average
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



-- 7) Salary distribution by contract type (FT, PT, CT)
-- This query calculates the average salary based on employment type (Full-time, Part-time, Contract, etc.).
-- It helps to understand how employment type influences salary.

SELECT 
    employment_type  -- Type of employment (Full-time, Part-time, etc.)
    , ROUND(AVG(salary_in_usd), 2) AS avg_salary  -- Average salary for each employment type
    , COUNT(*) AS num_employees  -- Number of employees for each employment type
FROM salaries s
GROUP BY employment_type;
