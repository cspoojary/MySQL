-- Changing rows with UPDATE and DELETE

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT);

    
CREATE TABLE diary_logs01 (
    id INTEGER PRIMARY KEY auto_increment,
    user_id INTEGER,
    date TEXT,
    content TEXT
    );
    
/* After user submitted their new diary log */
INSERT INTO diary_logs01 (user_id, date, content) VALUES (1, "2015-04-01",
    "I had a horrible fight with OhNoesGuy and I buried my woes in 3 pounds of dark chocolate.");
    
INSERT INTO diary_logs01 (user_id, date, content) VALUES (1, "2015-04-02",
    "We made up and now we're best friends forever and we celebrated with a tub of ice cream.");

SELECT * FROM diary_logs01;

UPDATE diary_logs01 SET content = "I had a horrible fight with OhNoesGuy" WHERE id = 1;

-- if we don"t know specific id then We can also use other known items
UPDATE diary_logs01 SET content = "I had a horrible fight with OhNoesGuy"
WHERE user_id = 1 AND date = "2015-04-01" ;

-- Recheqing is it changed.
SELECT * FROM diary_logs01;

DELETE FROM diary_logs01 WHERE id = 1;

SELECT * FROM diary_logs01;

-- recheck when you are upadting or deletimg data becuase 
-- if you deleted randomly you can face the challenge of loosing data.

-- CHALLENGES
/* 
We've created a database for a documents app, with rows for each document 
with it's title, content, and author.
*/

CREATE table documents (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title TEXT,
    content TEXT,
    author TEXT);
    
INSERT INTO documents (author, title, content)
    VALUES ("Puff T.M. Dragon", "Fancy Stuff", "Ceiling wax, dragon wings, etc.");
INSERT INTO documents (author, title, content)
    VALUES ("Puff T.M. Dragon", "Living Things", "They're located in the left ear, you know.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Pirate Recipes", "Cherry pie, apple pie, blueberry pie.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Boat Supplies", "Rudder - guitar. Main mast - bed post.");
INSERT INTO documents (author, title, content)
    VALUES ("Jackie Paper", "Things I'm Afraid Of", "Talking to my parents, the sea, giant pirates, heights.");

SELECT * FROM documents;

/*
In this first step, use UPDATE to change the author to 'Jackie Draper' for all rows where it's currently 'Jackie Paper'.
 Then re-select all the rows to make sure the table changed like you expected.
*/
UPDATE documents SET author = 'Jackie Draper' where author = "Jackie Paper";

select * from documents;

/*

Now you'll delete a row, being very careful not to delete all the rows. Only delete the row where the title is 'Things I'm Afraid Of'.
Then re-select all the rows to make sure the table changed like you expected.
 */
DELETE FROM documents where title = "Things I'm Afraid Of";

select * from documents;

-------------------------------------------------------------------------------------------
-- Altering tables after creation.

CREATE TABLE diary_logs02 (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    date TEXT,
    content TEXT
    );
    
/* After user submits a diary log */
INSERT INTO diary_logs02 (id,user_id, date, content) VALUES (1, 1, "2015-04-02",
    "OhNoesGuy and I made up and now we're best 
    friends forever and we celebrated with a tub of ice cream.");
    
ALTER TABLE diary_logs02 ADD emotion VARCHAR(255) DEFAULT 'unknown';

INSERT INTO diary_logs02 (id, user_id, date, content, emotion) VALUES (2, 1, "2015-04-03", "We went to Disneyland!", "Happy");

SELECT * FROM diary_logs02 ;










