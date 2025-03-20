SELECT Industry,
	   FORMAT(MIN(CAST((SUBSTRING_INDEX(salary_range, "-", 1)) AS UNSIGNED)), 0) AS Lowest_Salary,
       FORMAT(MAX(CAST((SUBSTRING_INDEX(salary_range, "-", -1)) AS UNSIGNED)), 0) AS Highest_Salary
FROM job_postings
WHERE Salary_Range LIKE '%-%'
GROUP BY Industry
ORDER BY Highest_Salary DESC;