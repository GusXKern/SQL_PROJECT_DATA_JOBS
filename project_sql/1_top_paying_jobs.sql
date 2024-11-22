/*
Q: What are the top paying data analyst jobs?
- ID top 50 that are based in NYC
- Remove NULLS
- Why? To highlight the top-paying opportunities for Data Analysts! */

SELECT
job_postings_fact.job_id,
job_postings_fact.job_title,
job_postings_fact.job_location,
job_postings_fact.job_schedule_type,
job_postings_fact.salary_year_avg,
job_postings_fact.job_posted_date,
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

