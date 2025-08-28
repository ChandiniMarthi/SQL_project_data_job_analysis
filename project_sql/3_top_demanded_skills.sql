SELECT 
    skills,
    COUNT(job_postings_fact.job_id) AS skills_demand
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' AND 
    job_postings_fact.job_location LIKE '%TX'
GROUP BY skills
ORDER BY skills_demand DESC
LIMIT 5