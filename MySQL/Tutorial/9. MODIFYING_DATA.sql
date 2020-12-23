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

/* *********************** INSERT INTO SELECT ***************************** */

/* First, let's create a new table called suppliers. */
CREATE TABLE suppliers (
	supplierNumber INT AUTO_INCREMENT,
	supplierName VARCHAR(50) NOT NULL,
	phone VARCHAR(50),
	addressLine1 VARCHAR(50),
	addressLine2 VARCHAR(50),
	city VARCHAR(50),
	state VARCHAR(50),
	postalCode VARCHAR(50),
	country VARCHAR(50),
	customerNumber INT,
	PRIMARY KEY(supplierNumber)
);

/* Following query finds all customers who locate in California, USA. */
SELECT
	customerNumber,
	customerName,
	phone,
	addressLine1,
	addressLine2,
	city,
	state,
	postalCode,
	country
FROM
	customers
WHERE
	country = 'USA' AND
	state = 'CA';

/* Now, use the INSERT INTO... SELECT statement to insert customers who locate 
in California USA from the customers table into the suppliers table. */
INSERT INTO suppliers (
	supplierName,
	phone,
	addressLine1,
	addressLine2,
	city,
	state,
	postalCode,
	country,
	customerNumber
)
SELECT
	customerName,
	phone,
	addressLine1,
	addressLine2,
	city,
	state,
	postalCode,
	country,
	customerNumber
FROM
	customers
WHERE
	country = 'USA' AND
	state = 'CA';

/* Using SELECT statement in the VALUES list */
/*First, create a new table called stats. */
CREATE TABLE stats (
	totalProduct INT,
	totalCustomer INT,
	totalOrder INT
);

/* Second, use the INSERT statement to insert values that come from the SELECT statements. */
INSERT INTO stats(totalProduct, totalCustomer, totalOrder)
VALUES(
	(SELECT COUNT(*) FROM products),
	(SELECT COUNT(*) FROM customers),
	(SELECT COUNT(*) FROM orders)
);

/* *********************** INSERT IGNORE ***************************** */

/* When using the INSERT statement to add multiple rows to a table and if an error occurs during the processing, 
MySQL terminates the statement and returns an error. As a result, no rows are inserted into the table. However,
if using the INSERT IGNORE statement, the rows with invalid data that cause the error are ignored and the rows
with valid data are inserted in the table. */

/* Let's create a new table called subscribers for the practice */
CREATE TABLE subscribers (
	id INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(50) NOT NULL UNIQUE
);

/* The UNIQUE constraint ensures that no duplicate email exists in the email column. */

/* Following statement inserts a new row in the subscribers table. */
INSERT INTO subscribers(email)
VALUES('john.doe@gmail.com');

/* Let's execute another statement that insets two rows into the subscribers table. */
INSERT INTO subscribers(email)
VALUES('john.doe@gmail.com'),
	  ('jane.smith@gmail.com'); 
/* It returns an error. As we have marked our subscribers table with UNIQUE keyword,
the email john.doe@gmail.com violates the UNIQUE constraint. However, if using the
INSERT IGNORE statement the duplicate row will be ignored. */
INSERT IGNORE INTO subscribers(email)
VALUES('john.doe@gmail.com'),
	  ('jane.smith@gmail.com');

/* *********************** INSERT IGNORE and STRICT ***************************** */

/* When the strict mode is on, MySQL returns an error and aborts the INSERT statement if you try to insert invalid 
values int a table. However, if you use the INSTANT IGNORE statement, MySQL will issue a warning instead of an error.
In addition, it will try to adjust the values to make them valid before adding the value to the table. */

/* Create a new table named tokens to demo. */
CREATE TABLE tokens(
	s VARCHAR(6)
);
/* In this table, the column s accepts only string whose lengths are less than or equal to 6.

Second, insert a string whose length is seven into the tokens table. */
INSERT INTO tokens VALUES('abcdefg'); 
/* MySQL issues an error because the strict mode is on.

Now, use the INSERT IGNORE statement to insert the same string. */
INSERT IGNORE INTO tokens VALUES('abcdefg');
/* MySQL truncated data before inserting it into the tokens table. */

/* *********************** UPDATE ***************************** */
