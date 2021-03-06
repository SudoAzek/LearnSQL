
-- FILTERING DATA

-- *********************** WHERE *****************************

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


-- *********************** SELECT DISTINCT *****************************

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

-- *********************** AND *****************************

/* In MySQL, zero is considered FALSE and non-zero is treated as TRUE. */

/* When evaluating an expression that has the AND operator, MySQL stops evaluating the remaining parts 
of the expression whenever it can determine the result. This function called short-curcuit evaluation. */
SELECT 1 = 0 AND 1 / 0;

/* Following statement uses the AND operator to find customers who locate in California(CA), USA. */
SELECT
	customername,
	country,
	state
FROM
	customers
WHERE
	country = 'USA' AND state = 'CA';

/* By using the AND operator, it's possible to combine more than two Boolean expressions. For example, the 
following query return the customers who locate in California, USA, and have the credit limit greater than 100K. */
SELECT
	customername,
	country,
	state,
	creditLimit
FROM
	customers
WHERE
	country = 'USA'
AND state = 'CA'
AND creditLimit > 100000;

-- *********************** OR *****************************

/* MySQL uses short-circuit evaluation for the OR operator, too. So, MySQL stops evaluating the remaining 
parts of the statement when it can determine the result. */
SELECT 1 = 1 OR 1 / 0;

/* When using more than one logical operator in an expression, MySQL always evaluates the OR operators after the AND operators. This is called 
operator precendence which determines the order of evaluation of the operators. MySQL evaluates the operator with higher precendece first. */
SELECT TRUE OR FALSE AND FALSE;

/* To change the order of evaluation, using parentheses comes handy. */
SELECT(TRUE OR FALSE) AND FALSE;

/* To get the customers who locate in the USA or France, should use the OR operator in the WHERE clause. */
SELECT
	customername,
	country
FROM
	customers
WHERE 
	country = 'USA' OR
	country = 'France';

/* Following statement returns the customers who locate in the USA or France and have a credit limit greater than 100,000. */
SELECT
	customername,
	country,
	creditLimit
FROM
	customers
WHERE
	(country = 'USA' OR country = 'France')
	AND creditLimit > 100000;

/* Notice that if parentheses not used, the query will return the customers who lacate in the USA or the 
customers who locate in France with credit limit greated than 10K */
SELECT
	customername,
	country,
	creditLimit
FROM
	customers
WHERE country = 'USA'
	OR country = 'France'
	AND creditLimit > 10000;

-- *********************** IN *****************************
/* The IN operator allows to determine if a specified value matches any value in a set of values or returned by a subquery */

-- To find the offices that locate in the U.S. and France, use the IN operator as the following query:
SELECT
	officeCode
	,city
	,phone
	,country
FROM
	offices
WHERE
	country IN('USA', 'France');

-- Can achieve the same result with the OR operator as the following query:
SELECT
	officeCode
	,city
	,phone
	,country
FROM
	offices
WHERE
	country = 'USA' OR country = 'France';

/* In case the list has many values, need to construct a very long statement with multiple OR operators. Hence, the IN operator
allowsto shorten the query and make it more readable.

To get offices that do not locate in USA and France, can use NOT IN */