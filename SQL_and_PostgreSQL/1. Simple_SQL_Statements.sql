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

/* Retrieve all data rows and columns from a table */
SELECT
  *
FROM
  cities;

/* R


