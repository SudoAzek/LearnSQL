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
	BIT 		- 	A bit field */

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
	TINYTEXT	-	A very small non-binary string
	TEXT 		- 	A small non-binary string
	MEDIUMTEXT	- 	A medium-sized non-binary string
	LONGTEXT	-	A large non-binary string
	ENUM		- 	An enumeration; each column value may be assigned one enumeration member
	SET			-	A set; each column value may be assigned zero or more SET members */

/* ****** MYSQL DATE AND TIME DATA TYPES ****** */

/* MySQL provides types for date and time as well as the combination of date and time. In addition,
MySQL supports the timestamp date type for tracking the changes in a row of a table. If just wanted
to store years without dates and months, it's possible to use the YEAR data type. 

The following table illustrates the MySQL date and time date types:
	DATE 		-	A date value in CCYY-MM-DD format
	TIME 		-	A time value in hh:mm:ss format
	DATETIME 	-	A date and time value in CCYY-MM-DD hh:mm:ss format
	TIMESTAMP 	-	A timestamp value in CCYY-MM-DD hh:mm:ss format
	YEAR 		-	A year value in CCYY or YY format */

/* ****** MYSQL SPATIAL DATA TYPES ****** */

/* MySQL supports many spatial date types that contain various kinds of geometrical and georaphical
values as shown in the following table:
	GEOMETRY 			-	A spatial value of any type
	POINT 				- 	A point(a pair of X-Y coordinates)
	LINESTRING			-	A curve(one or more POINT values)
	POLYGON				-	A polygon
	GEOMETRYCOLLECTION	-	A collection of GEOMETRY values
	MULTILINESTRING		-	A collection of LINESTRING values
	MULTIPOINT			-	A collection of POINT values
	MULTIPOLYGON		- 	A collection of POLYGON values

/* ****** MYSQL JSON DATA TYPE ****** */

/* MySQL supported a native JSON data type since version 5.7.8 that allows to store and manage JSON
documents more effectively. The native JSON data type provides automatic validation of JSON documents
and optimal storate format. */


/* ****** MYSQL INT DATA TYPE ****** */

/* First, create a new table named items with an integer column as the primary key: */
CREATE TABLE items (
	item_id INT AUTO_INCREMENT PRIMARY KEY,
	item_text VARCHAR(255)
);

/* It's possible to use either INT or INTEGER in the CREATE TABLE statement above because they are 
interchangeable. Whenever a new row inserted into the items table, the value of the item_id column is
increased by 1.

Next, the following INSERT statement inserts three rows into the items table. */
INSERT INTO
	items(item_text)
VALUES
	('laptop'),
	('mouse'),
	('headphones');

/* After that, insert a new row whose value of the item_id column is specified explicitly */
INSERT INTO items(item_id, item_text)
VALUES(10, 'Server');

/* Since the current value of the item_id column is 10, the sequence is reset to 11. if a new row
inserted, the AUTO_INCREMENT column will use 11 as the next value. */
INSERT INTO items(item_text)
VALUES('Router');

/* ****** MYSQL UNSIGNED INT DATA TYPE ****** */