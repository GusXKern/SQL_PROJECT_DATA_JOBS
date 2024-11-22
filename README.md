# Introduction
Focusing on Data Analyst roles in New York, NY, this project explores top-paying jobs, in-demand skills, and where high demand meets high salary in data analytics.

Check out the SQL querys I used here: [project_sql folder](/project_sql/)
# Background
This project uses data taken from the SQL Course of [Luke Barousse](https://lukebarousse.com/sql). It comes from a quest to navigate the data analyst job market more effectively by streamlining others work to find optimal jobs.

It's packed with insights on job titles, salaries, locations, and essential skills.
# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
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
```

**Key Insights from the Data**:

- **Top Salaries**:
The highest-paying job is offered by Coda Search│Staffing for a Data Sector Analyst role at a hedge fund, with an average annual salary of $240,000.
The second-highest salaries are tied at approximately $239,777.5, both for roles at TikTok as Investigations and Insights Lead Data Analysts.

- **Industry Representation**:
Finance and Hedge Funds dominate the higher salary brackets, emphasizing the premium placed on data analysis in these sectors.
Tech Companies like TikTok and Meta also offer competitive salaries.

- **Consistency Across Roles**:
TikTok appears multiple times in the list with high-paying roles, showing a strong investment in data-driven decision-making.

- **Salary Range**:
Top 10 salaries range from $180,000 to $240,000, showcasing a premium for niche expertise in sectors like finance, tech, and compliance.
Job Schedule:

All top-paying roles are full-time, reflecting the demand for dedicated expertise in these fields.

![Top Paying Roles](assets\q1.png)
*Bar graph visualizing the salary for the top 8 salaries for data analysts; ChatGPT generated this graph from my SQL query results*

### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.
```sql
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
    LIMIT 25
    )

SELECT
    top_skills.*,
    skills
FROM top_skills
INNER JOIN skills_job_dim ON top_skills.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
**Key Insights From the Data**:

- **Top Skills**:
SQL and Data Analysis are the most frequently required skills, indicating their foundational importance in data analyst roles. Python, Excel, and Statistics also rank highly, showing their widespread application in data analysis tasks.

- **Visualization Tools**:
Tools like Tableau and Power BI are frequently mentioned, underscoring the demand for proficiency in presenting data insights visually.

- **Emerging Skills**:
Machine Learning and Cloud Computing are becoming increasingly relevant, reflecting the integration of advanced analytics and cloud-based solutions in data analysis.

- **Soft Skills**:
Skills such as Communication Skills, Problem Solving, and Critical Thinking are crucial, highlighting the importance of conveying insights and solving business problems effectively.

![Most Demanded Skills](assets\q2.png)
*Bar graph visualizing the count of skills for the top 25 paying jobs for data analysts; ChatGPT generated this graph from my SQL query results*

# What I Learned

From working on this project, I've learned many important basic and advanced SQL skills:

- **🧩 Complex Query Crafting:** Mastered the art of advanced SQL, merging tables and wielding WITH clauses to make temporary results sets.
- **📊 Data Aggregation:** Used GROUP BY and aggregate functions like COUNT() and AVG() to find key insights in the data.
- **💡 Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Insights
From the analysis, several general insights emerged:

1. **Top-Paying Data Analyst Jobs**: The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,000!
2. **Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries**: Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.
5. **Optimal Skills for Job Market Value**: SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.