/**
  * Query to verify the current users in the database.
  *
  * @author cvaldezissc
  * @lastModified Apr 16 2019
  */

SELECT
    user
FROM
    mysql.user
GROUP BY
    user;