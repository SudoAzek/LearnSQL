/* MODIFYING DATA */

/* *********************** INSERT ***************************** */

/* Create a table named tasks for practicing the INSERT statement. */
CREATE TABLE IF NOT EXISTS tasks (
	task_id INT AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
	start_date DATE,
	due_date DATE,
	priority TINYINT NOT NULL DEFAULT 3,
	decription TEXT,
	PRIMARY KEY (task_id)
);

/* Simple INSERT */
/* Following statement inserts a new row into the tasks table. */
INSERT INTO tasks(title, priority)
VALUES('Learing MySQL INSERT Statement', 1);

/* This query returns data from the tasks table. */
SELECT * FROM tasks;

/* Inserting rows using default value. */
/* If it's needed to insert a default value into a column, just ignore the column
 name while inserting or indicate it with DEFAULT keyword in the VALUES clause. */
INSERT INTO tasks(title, priority)
VALUES('Understanding DEFAULT keyword in INSERT statement', DEFAULT);

/* Inserting dates into the table. */
/* To insert a literal date value into a column, use the following format 'YYYY-MM-DD' */

/* Following statement inserts a new row to the tasks table with the start and due date values. */
INSERT INTO tasks(title, start_date, due_date)
VALUES('Inserting date into table', '2020-01-09', '2020-12-22');

/* It is possible to use expressions in the VALUES clause. The following statement adds a new task
using the current date for start date and due date columns. */
INSERT INTO tasks(title, start_date, due_date)
VALUES('Use current date for the task', CURRENT_DATE(), CURRENT_DATE());

/* Inserting multiple rows */
/* Following statement inserts three rows into the tasks table. */
INSERT INTO tasks(title, priority)
VALUES
	('My first task', 1),
	('It is the second task', 2),
	('This is the second task of the week', 3);

/* This statement shows the current value of the max_allowed_packet variable. */
SHOW VARIABLES LIKE 'max_allowed_packet';

/* To set a new value for the max_allowed_packet variable, use the following statement, where 
size is an integer that represents the number of maximum allowed packet size in bytes. */
SET GLOBAL max_allowed_packet = size;

/* Create a new table called projects to show more demonstrations of multiple rows insert. */
CREATE TABLE projects(
	project_id INT AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	start_date DATE,
	end_date DATE,
	PRIMARY KEY(project_id)	
);

/* Use the INSERT multiple rows statement to insert two rows int the projects table. */
INSERT INTO
	projects(name, start_date, end_date)
VALUES
	('AI for Education', '2019-08-01', '2019-12-31'),
	('ML for Marketing', '2020-03-21', '2020-12-22');

/* When multiple rows inserted, use the LAST_INSERT_ID() fuction to get the last inserted id of an 
AUTO_INCREMENT column, it can get the id of the first inserted row only, not the id of the last inserted row. */
SELECT LAST_INSERT_ID();

