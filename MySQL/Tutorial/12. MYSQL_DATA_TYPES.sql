/* MYSQL DATA TYPES */

/* ****** MYSQL NUMERIC DATA TYPES ****** */

/* The following table shows the summary of numberic types in MySQL:
	TINYINT		-	A very small integer
	SMALLINT	-	A small integer
	MEDIUMINT	- 	A medium-sized integer
	INT 		-	A standard integer
	BIGINT		- 	A large integer
	DECIMAL		- 	A fixed-point number
	FLOAT		-	A single-precision floating point number
	DOUBLE		- 	A double-precision floating point number
	BIT 		- 	A bit field

/* ****** MYSQL BOOLEAN DATA TYPE ****** */

/* MySQL doesn't have the built-in BOOLEAN or BOOL data type. To represent boolean values, MySQL
uses the smallest integer type which is TINYINT(1). In other words, BOOLEAN and BOOL are synonyms
for TINYINT(1).

/* ****** MYSQL STRING DATA TYPES ****** */

/* In MySQL, a string can hold anything from plain text to binary data such as images or files.
Strings can be compared and searched based on pattern matching by using the LIKE operator, regular
expressions, and full-text search.

The following table shows the string date types in MySQL:
	CHAR		-	A fixed-length nonbinary (character) string
	VARCHAR		-	A variable-length non-binary string
	BINARY 		-	A fixed-length binary string
	VARBINARY	- 	A variable-length binary string
	TINYBLOB	-	A very small BLOB (binary large object)
	BLOB		-	A small BLOB
	MEDIUMBLOB	- 	A medium-sized BLOB
	LONGBLOB	-	A large BLOB
	TINYTEXT	-	
	TEXT
	MEDIUMTEXT
	LONGTEXT
	ENUM
	SET