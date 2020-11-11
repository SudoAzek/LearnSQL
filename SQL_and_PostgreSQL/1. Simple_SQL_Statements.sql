/* Creating a table */
CREATE TABLE cities (
  name VARCHAR(50),
  country VARCHAR(50),
  population INTEGER,
  area INTEGER
);


/* Inserting a single data row into a table */
INSERT INTO
  cities (name, country, population, area)
VALUES
  ('Tokyo', 'Japan', 38505000, 8223);


/* Inserting multiple data rows into a table */
INSERT INTO
  cities (name, country, population, area)
VALUES
  ('Delhi', 'India', 28125000, 2240),
  ('Shanghai', 'China', 22125000, 4015),
  ('Sao Paulo', 'Brazil', 20935000, 3043);

/* Querying all data rows and columns from a table */
SELECT
  *
FROM
  cities;

/* Retrieving the specified data columns from a table */
SELECT
  name,
  country
FROM
  cities;

/* Do specific calculations or oparations with columns of a table */
SELECT
  name,
  population / area
FROM
  cities;

/* Renaming a calculated columen of a table with AS operator */
SELECT
  name,
  population / area AS population_density
FROM
  cities;

/* Joining two Strings by || (tube) operator from columns of a table */
SELECT
  name || ', ' || country AS location
FROM
  cities;

/* Joining two String using CONCAT() from columns of a table */
SELECT
  CONCAT(name, ', ', country) AS location
FROM
  cities;

/* Fomatting Strings to uppercase using UPPER() */
SELECT
  CONCAT(UPPER(name), ', ', UPPER(country)) AS location
FROM
  cities;

SELECT
  UPPER(CONCAT(name, ', ', country)) AS location
FROM
  cities;
