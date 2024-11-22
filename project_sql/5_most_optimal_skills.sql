/*
Q: What are the most optimal skills to learn (High Demand and High Pay)?
- ID skills in high demand associated with high avg salaries for Data Analyst roles
- Focus on NYC roles removing NULL salary values
- Why? This will offer insights into which skills will both pay well and have
    a lot of job openings that demand that skill. */

WITH skills_demand AS (
        SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'New York, NY' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
    ), skills_avg_salary AS (
        SELECT 
        skills_dim.skill_id,
        ROUND(AVG(salary_year_avg),0) as avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'New York, NY' AND
        salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
    )

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN skills_avg_salary ON skills_demand.skill_id = skills_avg_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25