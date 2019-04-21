/**
  * Returns the list of active non-admin users
  *
  * @author cvaldezissc
  * @returns table Result of Query .
  */



USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_users_get`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `sp_users_get`(
)
BEGIN


SELECT
	`tb_users`.`id` AS `id`
	, `tb_users`.`full_name` AS `fullName`
    , `tb_users`.`email` AS `email`
    , CASE WHEN `tb_users`.`is_admin` = 1 THEN 'YES' ELSE 'NO' END AS `isAdmin`
FROM
	`rpay`.`tb_users`
FORCE
    INDEX(`ix_users_06`)
WHERE
	`tb_users`.`is_admin` = 0
    AND
    `tb_users`.`status` = 1
ORDER BY
	`tb_users`.`full_name`;

END$$
DELIMITER ;