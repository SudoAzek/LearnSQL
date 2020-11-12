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


/* Querying data with filters using comparison math operators */
SELECT
  name,
  area
FROM
  cities
WHERE
  area > 4000;

 /* Querying data with filters using BETWEEN operator */
SELECT
  name,
  area
FROM
  cities
WHERE
  area BETWEEN 2000 AND 4000;

 /* Querying data with filters using IN operator */
SELECT
  name,
  area
FROM
  cities
WHERE
  name IN ('Delhi', 'Shanghai');

 /* Querying data with filters using NOT IN operator */
SELECT
  name,
  area
FROM
  cities
WHERE
  name NOT IN ('Delhi', 'Shanghai');

 /* Querying data with filters using compound operators */
 SELECT
  name,
  area
FROM
  cities
WHERE
  area NOT IN (3043, 8223) AND name = 'Delhi';

 /* ----------- */
SELECT
  name,
  area
FROM
  cities
WHERE
  area NOT IN (3043, 8223)
  OR name = 'Delhi'
  OR name = 'Tokyo';

 /* Using comparison with calculated columns */
SELECT
  name,
  population / area AS population_density
FROM
  cities
WHERE
  population / area > 6000;

 /* Updating records */
UPDATE
  cities
Set
  population = 39505000
WHERE
  name = 'Tokyo';

 /* Deleting records */
DELETE FROM
  cities
WHERE
  name = 'Shanghai';