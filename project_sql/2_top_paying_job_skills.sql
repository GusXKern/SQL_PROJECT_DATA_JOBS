/*
Q: What skills are required for the top-paying data analyst jobs?
-Use the top 50 highest paying D.A. jobs from the 1st Query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills.
    helping job seekers understand which skills they need to develop.
*/

WITH top_skills AS
    (SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.salary_year_avg,
    company_dim.name
    FROM
    job_postings_fact
    LEFT JOIN company_dim ON
    job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst' AND 
    job_location = 'New York, NY' AND 
    salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 50
    )

SELECT
    top_skills.*,
    skills
FROM top_skills
INNER JOIN skills_job_dim ON top_skills.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;