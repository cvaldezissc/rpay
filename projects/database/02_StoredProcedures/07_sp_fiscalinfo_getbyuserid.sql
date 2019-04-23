/**
  * gets the fiscal information of a specific user
  *
  * @author cvaldezissc
  * @param int p_user_id [User ID created in the database ]
  * @param int p_user_uuid [User Unique ID created in the database]
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
        `tb_fiscalinfo`.`id`
            , `tb_fiscalinfo`.`user_id`
            , `tb_fiscalinfo`.`user_uuid`
            , `tb_fiscalinfo`.`rfc`
            , `tb_fiscalinfo`.`business_name`
            , `tb_fiscalinfo`.`responsible_fullname`
            , `tb_fiscalinfo`.`creation_date`
            , `tb_fiscalinfo`.`modification_date`
            , `tb_fiscalinfo`.`status`
            , `tb_users`.`id`
            , `tb_users`.`uuid`
            , `tb_users`.`full_name`
            , `tb_users`.`email`
            , `tb_users`.`password`
            , `tb_users`.`is_admin`
            , `tb_users`.`creation_date`
            , `tb_users`.`modification_date`
            , `tb_users`.`status`
    FROM `rpay`.`tb_fiscalinfo`
    INNER JOIN `rpay`.`tb_users`
        ON `tb_fiscalinfo`.`id` = `tb_users`.`id`
    WHERE
        `tb_fiscalinfo`.`user_id` = p_user_id
        AND
        `tb_fiscalinfo`.`user_uuid` = p_user_uuid
        AND
        `tb_fiscalinfo`.`user_uuid` = 1

    ;




END$$
DELIMITER ;