-- Union

SELECT first_name, last_name 
FROM parks_and_recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name , 'Old' AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 50
UNION
SELECT first_name, last_name , 'Highly Paid Employee' AS Label
FROM parks_and_recreation.employee_salary
WHERE salary > 70000;