
/* Access all data from the users table */
SELECT * FROM users;

/* Try inserting a photo that is tied to a user that doesn't exist */
INSERT INTO
  photos (url, user_id)
VALUES
  ('http://jpg', 9999);
/* Results to the following error message from PostgreSQL :
insert or update on table "photos" violates foreign key constraint "photos_user_id_fkey" */


/* Trying to insert a photo that isn't tied to any user with NULL value */
INSERT INTO
  photos (url, user_id)
VALUES
  ('http://jpg', NULL);
/* With a NULL value it succesfully inserts the row to the table but without any relation to a FOREIGN KEY; */


/* What happens if you try to delete a user when there are photos being referenced from the user? 
Because of dangling keys or references the following error message will be shown: 
update or delete on table "users" violates foreign key constraint "photos_user_id_fkey" on table "photos" */
DELETE FROM
  users
WHERE
  id = 1;


/* Table of users to relate to the later to be created table of photos */
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
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

/* ---------------------- Create table of photos with user_id reference on condition ON DELETE CASCADE ---------------------- */
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

/* Try inserting images into photos table */
INSERT INTO
  photos (url, user_id)
VALUES
  ('http://one.jpg', 4),
  ('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

/* Try deleting user with PRIMARY KEY = 1. Because we have defined ON DELETE CASCADE, 
now we can delete related data in other tables of user with id = 1 */
DELETE FROM
  users
WHERE
  id = 1;

/* Check whether if the date persists on the photos table related to the user with PRIMARY_KEY = 1 */
SELECT
  *
FROM
  photos;
/* ---------------------------------------------------------------------------------------------------------------------------*/

/* ---------------------- Create table of photos with user_id reference on condition ON DELETE SET NULL --------------------- */
CREATE TABLE photos (
  id SERIAL PRIMARY KEY,
  url VARCHAR(200),
  user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);

/* Try inserting images into photos table */
INSERT INTO
  photos (url, user_id)
VALUES
  ('http://one.jpg', 4),
  ('http://two.jpg', 1),
  ('http://25.jpg', 1),
  ('http://36.jpg', 1),
  ('http://754.jpg', 2),
  ('http://35.jpg', 3),
  ('http://256.jpg', 4);

/* Try deleting user with PRIMARY KEY = 4. Because we have defined ON DELETE SET NULL, 
now we can delete related data in other tables of user with id = 4 */
DELETE FROM
  users
WHERE
  id = 4;

/* Check whether if the date persists on the photos table related to the user with PRIMARY_KEY = 4 */
SELECT
  *
FROM
  photos;
/* ---------------------------------------------------------------------------------------------------------------------------*/

