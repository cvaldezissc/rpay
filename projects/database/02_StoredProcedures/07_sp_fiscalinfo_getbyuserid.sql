/**
  * gets the fiscal information of a user
  *
  * @author cvaldezissc
  * @param int p_user_id [User ID created in the database (returned when a new user is created)]
  * @returns table Result of Query .
  */


USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_fiscalinfo_getbyuserid`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost`
PROCEDURE `sp_fiscalinfo_getbyuserid`(
	IN p_user_id int
	, IN p_user_uuid varchar(40)
)
BEGIN


    SELECT
        `tb_fiscalinfo`.`id`,
        `tb_fiscalinfo`.`user_id`,
        `tb_fiscalinfo`.`user_uuid`,
        `tb_fiscalinfo`.`rfc`,
        `tb_fiscalinfo`.`business_name`,
        `tb_fiscalinfo`.`responsible_fullname`,
        `tb_fiscalinfo`.`creation_date`,
        `tb_fiscalinfo`.`modification_date`,
        `tb_fiscalinfo`.`status`,
        `tb_users`.`id`,
        `tb_users`.`uuid`,
        `tb_users`.`full_name`,
        `tb_users`.`email`,
        `tb_users`.`password`,
        `tb_users`.`is_admin`,
        `tb_users`.`creation_date`,
        `tb_users`.`modification_date`,
        `tb_users`.`status`
    FROM `rpay`.`tb_fiscalinfo`
    FORCE INDEX(`tb_fiscalinfo`.`ix_fiscalinfo_02`)
    INNER JOIN `rpay`.`tb_users` ON `tb_fiscalinfo`.`id` = `tb_users`.`id`
    WHERE
        `tb_fiscalinfo`.`user_id` = 4
        AND
        `tb_fiscalinfo`.`user_uuid` = 'a5a74572-63e3-11e9-bb13-dc592bc972de'

    ;




END$$
DELIMITER ;