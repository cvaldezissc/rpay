/**
  * list of a specific user in the database
  *
  * @author cvaldezissc
  * @param int p_user_id [User ID created in the database (returned when a new user is created)]
  * @returns table Result of Query .
  */


USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_users_getbyid`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost`
PROCEDURE `sp_users_getbyid`(
	in p_user_id int
)
BEGIN

SELECT
	`tb_users`.`id` AS `id`
	, `tb_users`.uuid AS `uuid`
    , `tb_users`.`full_name` AS `fullName`
    , `tb_users`.`email` AS `email`
    , CASE `tb_users`.`is_admin` WHEN 1 THEN 'YES' WHEN 0 THEN 'NO' ELSE 'UNKNOWN' END AS `isAdmin`
    , CASE `tb_users`.`status` WHEN 1 THEN 'ACTIVE' WHEN 0 THEN 'INACTIVE' ELSE 'INACTIVE' END AS `status`
FROM
	`rpay`.`tb_users` FORCE INDEX(`PRIMARY`)
WHERE
	`tb_users`.`id` = p_user_id;

END$$
DELIMITER ;