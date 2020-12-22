
/* FILTERING DATA */

/* *********************** WHERE ***************************** */

/* Using MySQL WHERE clause to find all employees whose job titles are 'Sales Rep'. */
SELECT
	lastName,
	firstName,
	jobTitle
FROM
	employees
WHERE jobTitle = 'Sales Rep';

/* Using MySQL WHERE clause with AND operator. */
SELECT
	lastName,
	firstName,
	jobTitle,
	officeCode
FROM
	employees
WHERE
	jobTitle = 'Sales Rep' AND officeCode = 1;

/* Using MySQL WHERE clause with OR operator. */
SELECT
	lastName,
	firstName,
	jobTitle,
	officeCode
FROM
	employees
WHERE
	jobTitle = 'Sales Rep' OR
	officeCode = 1
ORDER BY
	officeCode,
	jobTitle;

/* Using MySQL WHERE with BETWEEN operator. */
SELECT
	lastName,
	firstName,
	officeCode
FROM
	employees
WHERE
	officeCode BETWEEN 1 AND 3
ORDER BY officeCode; 

/* Using MySQL WHERE with the LIKE operator. */
SELECT
	firstName,
	lastName
FROM
	employees
WHERE
	lastName LIKE '%son'
ORDER BY firstName;

/* Using MySQL WHERE clause with the IN operator. */
SELECT
	firstName,
	lastName,
	officeCode
FROM
	employees
WHERE
	officeCode IN (1, 2, 3)
ORDER BY
	officeCode;

/* Using MySQL WHERE cluase with the IS NULL operator. */
SELECT
	lastName,
	firstName,
	reportsTo
FROM
	employees
WHERE
	reportsTo IS NULL;

/* Using MySQL WHERE clause with comparison operators. */
SELECT
	lastName,
	firstName,
	jobTitle
FROM
	employees
WHERE
	jobTitle <> 'Sales Rep';

/* Following query finds employees whose office code is greater than 5. */
SELECT
	lastName,
	firstName,
	officeCode
FROM
	employees
WHERE
	officeCode > 5;

/* Following query finds employees with office code less than or equal to 4 (<=4) */
SELECT
	lastName,
	firstName,
	officeCode
FROM
	employees
WHERE
	officeCode <= 4;


/* *********************** SELECT DISTINCT ***************************** */

/* When querying data from a table, you may get dublicate rows. In order to remove 
these duplicate rows, can use the DISTINCT clause in the SELECT statement */

SELECT
	DISTINCT lastName
FROM
	employees
ORDER BY
	lastName;

/* MySQL DISTINCT and NULL values */

/* If a column has NULL values using the DISTINCT clause for that column, MySQL keeps
 only one NULL value because DISTINCT treats all NULL values as the same value. */

SELECT DISTINCT state 
FROM customers;

/* MySQL DISTINCT with multiple columns */

/* Can use the DISTINCT clause with more than one column. In this case, MySQL uses the 
combination of values in these columns to determine the uniqueness of the row in the result set. */

SELECT DISTINCT
	state, city
FROM
	customers
WHERE 
	state IS NOT NULL
ORDER BY
	state,
	city;

/* DISTINCT clause vs. GROUP BY clause */

/* If you use the GROUP BY clause in the SELECT statement without using aggregate 
functions, the GROUP BY clause behaves like the DISTINCT cluase. */

SELECT
	state
FROM
	customers
GROUP BY state;

/* Is similar to... */
SELECT DISTINCT
	state
FROM
	customers;

/* MySQL DISCTINCT and aggregate functions */
SELECT
	COUNT(DISTINCT state)
FROM
	customers
WHERE
	country = 'USA';

/* MySQL DISTINCT with LIMIT clause */
/* In case use the DISTINCT clause with the LIMIT clause, MySQL immediately stops 
searching when it finds the number of unique rows specified in the LIMIT clause. */

SELECT DISTINCT
	state 
FROM
	customers
WHERE
	state IS NOT NULL
LIMIT 5;

