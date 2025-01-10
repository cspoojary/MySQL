-- Stored Procedure

SELECT * 
FROM parks_and_recreation.employee_salary;

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE parks_and_recreation.large_salary()
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

CALL large_salary();


DELIMITER $$
CREATE PROCEDURE parks_and_recreation.large_salary01()
BEGIN
	SELECT * 
	FROM parks_and_recreation.employee_salary
	WHERE salary >= 50000;
	SELECT * 
	FROM parks_and_recreation.employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL parks_and_recreation.large_salary01();

DELIMITER $$
CREATE PROCEDURE parks_and_recreation.large_salary02(huggymuffin INT)
BEGIN
	SELECT salary
	FROM parks_and_recreation.employee_salary
    WHERE employee_id = huggymuffin
    ;
END $$
DELIMITER ;

CALL parks_and_recreation.large_salary02(1);
