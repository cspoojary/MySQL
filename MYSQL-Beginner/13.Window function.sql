-- Window functions

SELECT dem.first_name , dem.last_name, gender, AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_demographics dem 
JOIN parks_and_recreation.employee_salary sal
       ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name , dem.last_name, gender;


SELECT dem.first_name , dem.last_name, gender, AVG(salary) OVER( PARTITION BY gender )
FROM parks_and_recreation.employee_demographics dem 
JOIN parks_and_recreation.employee_salary sal
       ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name , dem.last_name, gender, 
SUM(salary) OVER( PARTITION BY gender )
FROM parks_and_recreation.employee_demographics dem 
JOIN parks_and_recreation.employee_salary sal
       ON dem.employee_id = sal.employee_id
;

SELECT dem.first_name , dem.last_name, gender, salary,
SUM(salary) OVER( PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM parks_and_recreation.employee_demographics dem 
JOIN parks_and_recreation.employee_salary sal
       ON dem.employee_id = sal.employee_id
;