-- QUESTIONS AND SQL QUERIES

-- 1. What is the gender breakdown of employees in the company?
SELECT gender, count(*) AS count
FROM projects..hr3
WHERE age >=18 AND termdate IS NULL
Group BY gender;

-- 2. What is the race/ethnicity breakdown of employees in the company?
SELECT race, count(*) AS count
FROM projects..hr3
WHERE age >=18 AND termdate IS NULL
Group BY race
ORDER BY count DESC;
-- 3. What is the age distribution of employees in the company?
SELECT 
    age_group,
    COUNT(*) AS count
FROM (
    SELECT 
        CASE 
            WHEN age >= 18 AND age <= 24 THEN '18-24'
            WHEN age >= 25 AND age <= 34 THEN '25-34'
            WHEN age >= 35 AND age <= 44 THEN '35-44'
            WHEN age >= 45 AND age <= 54 THEN '45-54'
            WHEN age >= 55 AND age <= 64 THEN '55-64'
            ELSE '65+'
        END AS age_group
    FROM projects..hr3
    WHERE age >= 18 AND termdate IS NULL
) AS age_groups
GROUP BY age_group
ORDER BY age_group;

-- 4. How many employees work at headquarters versus remote locations?
SELECT location, count(*) AS count
FROM projects..hr3
WHERE age >= 18 AND termdate IS NULL
GROUP BY location

-- 5. What is the average length of employment for employees who have been terminated?
SELECT 
    AVG(DATEDIFF(day, hire_date, termdate)) / 365.0 AS avg_length_employment
FROM projects..hr3
WHERE 
    termdate <= GETDATE() AND
    termdate IS NOT NULL AND
    age >= 18;

-- 6. How does the gender distribution vary across departments and job titles?
SELECT department, gender, count(*) AS count
FROM projects..hr3
WHERE age >= 18 AND termdate IS NULL
GROUP BY department, gender
ORDER BY department;

-- 7. What is the distribution of job titles across the company?
SELECT jobtitle, count(*) AS count
FROM projects..hr3
WHERE age >= 18 AND termdate IS NULL
GROUP BY jobtitle
ORDER BY jobtitle DESC;

