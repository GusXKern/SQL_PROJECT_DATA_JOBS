/*most in demand skills for a Data Analyst?
-Join job postings to inner join; similar to Q2
-ID the top 10 in-demand skills for a data analyst in NYC
-Focus on all Data Analyst postings
-Why? Shows us the five most in-demand skills to help steer learning.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'New York, NY'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 10