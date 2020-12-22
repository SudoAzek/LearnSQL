/* QUERYING DATA */

/* *********************** SELECT ***************************** */

/* Using the MySQL SELECT statement to retrive data from a single column */
SELECT lastName
FROM employees;

/* Using the MySQL SELECT statement to query data from multiple columns */
SELECT
	lastName,
	firstName,
	jobTitle
FROM
	employees;

/* Using the MySQL SELECT statement to retrieve data from all columns */
SELECT * FROM employees;