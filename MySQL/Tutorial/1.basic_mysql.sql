/* Querying data */
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


/* Sorting data */
/* Using MySQL ORDER BY clause to sort values in one column */
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname;

/* Using the DESC after the contactLastname column in the ORDER BY clause 
will sort customers by the last name in the descending order */
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC;

/* Using MySQL ORDER BY cluase to sort values in multiple columns */
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC,
	contactFirstname ASC;

/* Using MySQL ORDER BY to sort a result set by an expression. */
SELECT
	orderNumber,
	orderLineNumber,
	quantityOrdered * priceEach
FROM
	orderDetails
ORDER BY
	quantityOrdered * priceEach DESC;

/* To make the query more readible, assign the expression in the SELECT clause as a column alies and use that column alias in the ORDER BY clase */
SELECT
	orderNumber,
	orderLineNumber,
	quantityOrdered * priceEach AS subtotal
FROM
	orderDetails
ORDER BY subtotal DESC;

/* Using MySQL ORDER BY to sort data using a cutom list */
SELECT
	orderNumber,
	status
FROM
	orders
ORDER BY
	FIELD(status
		,'In Process'
		,'On Hold'
		,'Cancelled'
		,'Resolved'
		,'Disputed'
		,'Shipped');

