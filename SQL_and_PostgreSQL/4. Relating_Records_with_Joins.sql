
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


/* Dangling keys, references 
*/

DELETE FROM
  users
WHERE
  id = 1;
