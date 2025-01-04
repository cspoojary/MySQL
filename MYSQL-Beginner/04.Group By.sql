--  Group By

SELECT * 
FROM parks_and_recreation.employee_demographics
;

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;

SELECT occupation, salary
FROM parks_and_recreation.employee_salary
GROUP BY occupation, salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;
