SELECT Industry, Required_Experience, COUNT(*) AS Total_Applications, COUNT(CASE WHEN ja.Status = 'Hired' THEN 1 END) AS Hired,
	   CONCAT(ROUND((COUNT(CASE WHEN ja.Status = 'Hired' THEN 1 END) / COUNT(*)) * 100, 1), "%") AS Success_Rate
FROM job_postings AS jp
INNER JOIN job_applications AS ja ON jp.Job_ID = ja.Job_ID
GROUP BY Industry, Required_Experience
ORDER BY ROUND((COUNT(CASE WHEN ja.Status = 'Hired' THEN 1 END) / COUNT(*)) * 100, 1) DESC;
