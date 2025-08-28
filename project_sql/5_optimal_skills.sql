WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(job_postings_fact.job_id) AS skills_demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_postings_fact.job_title_short = 'Data Analyst' AND 
        job_postings_fact.job_location LIKE '%TX' AND
        job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
 ), avg_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg)) AS skill_avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_postings_fact.job_title_short = 'Data Analyst' AND 
        job_postings_fact.job_location LIKE '%TX' AND
        job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id
 )

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand_count,
    skill_avg_salary
FROM skills_demand
INNER JOIN avg_salary ON skills_demand.skill_id = avg_salary.skill_id
ORDER BY skill_avg_salary DESC, skills_demand_count DESC
LIMIT 25

--consice code

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg)) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
GROUP BY skills_dim.skill_id
HAVING COUNT(skills_job_dim.job_id) > 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 25