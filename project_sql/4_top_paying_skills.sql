SELECT
    skills,
    ROUND(AVG(salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY 
    average_salary DESC
LIMIT 25

/*
Rare languages pay the most — Assembly, Rust, Clojure, and Julia
top the list simply because so few people have these skills in a data context, driving salaries above $170K.

Specialist databases over standard ones — MongoDB, Neo4j, Redis, and Cassandra all feature,
while common tools like MySQL/PostgreSQL don't appear. Niche DB expertise is where the premium lies.

Infrastructure ownership is rewarded — Kubernetes, Splunk, and VMware showing up signals that
engineers who can handle deployment and monitoring alongside pipelines earn significantly more.

Mainstream skills are near the bottom — Kafka and Kubernetes sit at the lower end of this top-25 list (~$150–158K),
confirming they're well-paid but increasingly commoditised compared to rarer alternatives.

Ignore the outliers — Zoom, Trello, and jQuery likely reflect tiny sample sizes rather than real trends.
Don't pivot your career toward Trello expertise just yet.
*/