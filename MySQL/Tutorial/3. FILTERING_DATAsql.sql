
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
