-- Triggers and Events

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

DELIMITER $$
CREATE TRIGGER parks_and_recreation.employee_insert
	BEFORE INSERT ON  parks_and_recreation.employee_salary
    FOR EACH ROW
BEGIN
	 INSERT INTO parks_and_recreation.employee_demographics(employee_id,
     first_name, last_name)
	 VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
 END $$
 DELIMITER ;

INSERT INTO parks_and_recreation.employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Chaithanya','Poojary', 'Data Analyst', 1000000,NULL);

-- EVENTS

SELECT * 
FROM parks_and_recreation.employee_demographics;

DELIMITER $$
CREATE EVENT parks_and_recreation.delete_retirees
ON SCHEDULE EVERY 30 second
DO 
BEGIN
	DELETE 
	FROM parks_and_recreation.employee_demographics
	WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event%';











