SELECT 
    skills,
    ROUND(AVG(job_postings_fact.salary_year_avg)) AS skill_avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title_short = 'Data Analyst' AND 
    job_postings_fact.job_location LIKE '%TX' AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY skill_avg_salary DESC
LIMIT 25

/*
Got it 👍 — looking at your **Top 25 highest-paying data analyst skills list**, here are some quick insights and trends:

---

### 🔹 1. **Cloud & Modern Data Warehousing Dominate the Top**

* **BigQuery (\$210K), GCP (\$141K), Redshift (\$131K), Snowflake (\$129K), Databricks (\$120K)** are all high up.
* This shows that **cloud-native data skills** (especially Google Cloud and AWS ecosystems) are in strong demand.
* Companies are paying a premium for analysts who can manage **large-scale, cloud-based analytics platforms**.

---

### 🔹 2. **Data Engineering Tools Pay More than Pure Analytics**

* **Airflow (\$209K), Kafka (\$139K), Spark/PySpark (\~\$136K–139K), Hadoop (\$125K)**
* These are traditionally **data engineering tools**, not core analyst tools.
* Suggests the line between **Data Analyst vs. Data Engineer is blurring** — high-paying analyst roles often require engineering skills.

---

### 🔹 3. **SQL Is Still King, but Cloud SQL Pays More**

* **MySQL (\$147K)** is surprisingly high, beating out many newer tools.
* But notice how **BigQuery + Snowflake + Redshift** are also at the top — showing a shift from **classic SQL to cloud-based analytics databases**.

---

### 🔹 4. **Visualization & BI Tools Lag Slightly Behind**

* **Looker (\$133K)** is the only BI tool in the top 10.
* Traditional BI tools (Tableau, Power BI) don’t show up here, meaning the **highest-paying analyst roles are more technical**, less dashboard-heavy.

---

### 🔹 5. **Programming & Scripting Skills Add Value**

* **Scala (\$119K), Perl (\$119K), Shell (\$116K), Node.js (\$123K), Angular (\$119K)**
* Strong salaries for general-purpose languages show employers value **analysts who can script, automate, and build data apps** — not just query and visualize.

---

### 🔹 6. **Governance, Compliance & Collaboration Are Growing**

* **GDPR (\$125K), Confluence (\$130K), Jira (\$123K)**
* This suggests **data governance + project management tools** are becoming more valuable — analysts who understand **privacy regulations** or can work across teams earn more.

---

### 🔹 7. **Legacy Tech Still Pays Surprisingly Well**

* **MATLAB (\$143K), Perl (\$119K), Unix (\$113K), Phoenix (\$113K)**
* Some older/legacy skills are still highly paid because **fewer people know them, but certain industries still rely on them** (e.g., finance, scientific computing, legacy enterprise systems).

---

✅ **Big Picture Trend:**
The highest-paying “Data Analyst” roles are **hybrid roles**, leaning toward **Data Engineering, Cloud Analytics, and Advanced Programming** — not just reporting/visualization. Analysts who can **design pipelines, handle big data, and work in the cloud** are paid much more than those who focus only on dashboards.

---

Do you want me to create a **grouped visualization (like clusters of skills → Cloud, BI, Engineering, Programming, Governance)** so you can clearly see which categories dominate in pay?

*/