/* Deleting Records in a table */
/* Creating a table */
CREATE TABLE phones (
  name VARCHAR(50),
  manufacturer VARCHAR(50),
  price INTEGER,
  units_sold INTEGER
);

/* Inserting multiple data rows into a table */
INSERT INTO
  phones (name, manufacturer, price, units_sold)
VALUES
  ('N1280', 'Nokia', 199, 1925),
  ('Iphone 4', 'Apple', 399, 9436),
  ('Galaxy S', 'Samsung', 299, 2359),
  ('S5620 Monte', 'Samsung', 250, 2385),
  ('N8', 'Nokia', 150, 7543),
  ('Droid', 'Motorola', 150, 8395),
  ('Wave S8500', 'Samsung', 175, 9259);

/* The First query solution */
DELETE FROM phones
WHERE
  manufacturer = 'Samsung';

/* The Second query solution */
SELECT * FROM phones;