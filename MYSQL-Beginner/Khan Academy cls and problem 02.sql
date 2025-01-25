CREATE TABLE exercise_logs3
    (id INTEGER PRIMARY KEY AUTO_INCREMENT,
    type TEXT,
    minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);

INSERT INTO exercise_logs3(type, minutes, calories, heart_rate) VALUES ("biking", 30, 100, 110);
INSERT INTO exercise_logs3(type, minutes, calories, heart_rate) VALUES ("biking", 10, 30, 105);
INSERT INTO exercise_logs3(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 200, 120);
INSERT INTO exercise_logs3(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 165, 120);
INSERT INTO exercise_logs3(type, minutes, calories, heart_rate) VALUES ("tree climbing", 30, 70, 90);
INSERT INTO exercise_logs3(type, minutes, calories, heart_rate) VALUES ("tree climbing", 25, 72, 80);
INSERT INTO exercise_logs3(type, minutes, calories, heart_rate) VALUES ("rowing", 30, 70, 90);
INSERT INTO exercise_logs3(type, minutes, calories, heart_rate) VALUES ("hiking", 60, 80, 85);

SELECT * FROM exercise_logs3;

SELECT COUNT(*) FROM exercise_logs3 WHERE heart_rate > 220 - 30;

/** 50 - 90% MAX */
SELECT COUNT(*) FROM exercise_logs3 WHERE heart_rate >= ROUND(0.50 * (220 -30))
AND heart_rate <= ROUND(0.90 * (220 -30));

/* CASE */
SELECT type,heart_rate,
	CASE
		WHEN heart_rate > 220 - 30 THEN "Above max"
        WHEN heart_rate > ROUND(0.90 * (220 - 30)) THEN "Above target"
        WHEN heart_rate > ROUND(0.50 * (220 - 30)) THEN "Within target"
        ELSE "Below target"
	END AS "hr_zone"
 FROM exercise_logs3;
 -- it show through the column
 
 SELECT COUNT(*),
	CASE
		WHEN heart_rate > 220 - 30 THEN "Above max"
        WHEN heart_rate > ROUND(0.90 * (220 - 30)) THEN "Above target"
        WHEN heart_rate > ROUND(0.50 * (220 - 30)) THEN "Within target"
        ELSE "Below target"
	END AS "hr_zone"
 FROM exercise_logs3
 GROUP BY hr_zone;
 -- it show the count of different case is satisfying.

-- Challenges
/** We've created a database to track student grades,
 with their name, number grade, and what percent of activities they've completed.
 
CREATE TABLE student_grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    number_grade INTEGER,
    fraction_completed REAL);
    
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winston", 90, 0.805);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winnefer", 95, 0.901);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winsteen", 85, 0.906);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Wincifer", 66, 0.7054);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winster", 76, 0.5013);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winstonia", 82, 0.9045);
**/

CREATE TABLE student_grades (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    number_grade INTEGER,
    fraction_completed REAL);
    
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winston", 90, 0.805);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winnefer", 95, 0.901);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winsteen", 85, 0.906);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Wincifer", 66, 0.7054);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winster", 76, 0.5013);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winstonia", 82, 0.9045);

/** STEP 1
 In this first step, select all of the rows, and display the name, number_grade, and percent_completed,
 which you can compute by multiplying and rounding the fraction_completed column.
**/
SELECT * FROM student_grades;

SELECT name, number_grade,ROUND(fraction_completed * 100) AS percent_completed FROM student_grades;

/**
Now, this step is a little tricky. The goal is a table that shows how many students have
earned which letter_grade. You can output the letter_grade by using CASE with the number_grade column,
outputting 'A' for grades > 90, 'B' for grades > 80, 'C' for grades > 70, and 'F' otherwise. Then 
you can use COUNT with GROUP BY to show the number of students with each of those grades.
**/

SELECT 
    CASE 
        WHEN number_grade > 90 THEN 'A'
        WHEN number_grade > 80 THEN 'B'
        WHEN number_grade > 70 THEN 'C'
        ELSE 'F'
    END AS letter_grade,
    COUNT(*) AS student_count
FROM 
    student_grades
GROUP BY 
    letter_grade
ORDER BY 
    letter_grade;
    
-- PROJECT:Data dig
/**Pick one of those data sets or create a data set like that, and use advanced SELECT
 queries to discover things about the data. What sort of questions might one have about
 that data, like if they were using it for an app or a business idea? Here are some ideas:

What are average, max, and min values in the data?
What about those numbers per category in the data (using HAVING)?
What ways are there to group the data values that don’t exist yet (using CASE)?
What interesting ways are there to filter the data (using AND/OR)?
**/

select * from student_grades;

-- 1.Advanced SQL Queries and Insights:
-- Question: What are the average, maximum, and minimum number_grade values in the dataset?
SELECT 
    AVG(number_grade) AS average_grade, 
    MAX(number_grade) AS max_grade, 
    MIN(number_grade) AS min_grade
FROM 
    student_grades;

-- 2. Averages Per Letter Grade (Using HAVING
-- Question: What is the average number_grade for each letter grade, and which letter grade has more than one student?

SELECT 
    CASE 
        WHEN number_grade > 90 THEN 'A'
        WHEN number_grade > 80 THEN 'B'
        WHEN number_grade > 70 THEN 'C'
        ELSE 'F'
    END AS letter_grade,
    AVG(number_grade) AS average_grade,
    COUNT(*) AS student_count
FROM 
    student_grades
GROUP BY 
    letter_grade
HAVING 
    student_count > 1;

-- 3. Group by Custom Categories (Using CASE)
-- Question: Group students by custom completion categories: "High Completion" (> 80%),
--  "Medium Completion" (50–80%), and "Low Completion" (< 50%).

SELECT 
    CASE 
        WHEN fraction_completed > 0.8 THEN 'High Completion'
        WHEN fraction_completed >= 0.5 THEN 'Medium Completion'
        ELSE 'Low Completion'
    END AS completion_category,
    COUNT(*) AS student_count
FROM 
    student_grades
GROUP BY 
    completion_category;

-- 4. Filter Data (Using AND/OR)
-- Question: Which students have a number_grade above 80 but less than 90, and a fraction_completed greater than 90%?

SELECT 
    name, 
    number_grade, 
    ROUND(fraction_completed * 100, 2) AS percent_completed
FROM 
    student_grades
WHERE 
    number_grade > 80 AND number_grade < 90
    AND fraction_completed > 0.9;
    
    
