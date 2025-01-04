-- Joins

SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT * 
FROM parks_and_recreation.employee_salary;

SELECT * 
FROM parks_and_recreation.employee_demographics
INNER JOIN parks_and_recreation.employee_salary
    ON employee_demographics.employee_id = employee_salary.employee_id
;

SELECT * 
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
    ON dem.employee_id = sal.employee_id
;