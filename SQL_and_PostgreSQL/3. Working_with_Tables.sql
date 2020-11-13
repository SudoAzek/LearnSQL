/* Table of users to relate to the later to be created table of photos */
CREATE TABLE users (
  id SERIAL PRIMARY KEY
  username VARCHAR(50)
);

/* Insert data into users table */

INSERT INTO
  users (username)
VALUES
  ('monohan93'),
  ('pferrer'),
  ('si93onis'),
  ('99stroman');

/* Access all data from the users table */
SELECT * FROM users;

/* Create a table of photos with a reference to the table of users */
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id)
);

/* Insert data into the table of photos; Only url and user_id should be inserted. Id will be generated automatically. */
INSERT INTO
  photos (url, user_id)
VALUES
  ('http://one.jpg', 4);

/* Access all data from the photos table */
SELECT * FROM photos;

 /* Insert data into photos table */
INSERT INTO
  photos (url, user_id)
VALUES
  ('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

/* Access all data from the photos table related to user_id = 4 */
SELECT * FROM photos WHERE user_id = 4;

/* List all photos with details about the associated user for each */
SELECT
  *
FROM
  photos
  JOIN users ON users.id = photos.user_id;

/* Or only with url and username */
SELECT
  url,
  username
FROM
  photos
  JOIN users ON users.id = photos.user_id;