/**
  * Updates user's data with the parameters of information.
  *
  * @author cvaldezissc
  * @param int p_userid [User ID]
  * @param varchar p_uuid [Unique Identifier from the user]
  * @param varchar p_full_name [New Name of the user]
  * @param varchar p_email [new email]
  * @param varchar p_password [If needed, password too]
  * @returns row just updated user.
  */

USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_users_update`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `rpay`.`sp_users_update`(
    IN p_userid         INT(11)
    , IN p_uuid         VARCHAR(50)
	, IN p_full_name 	VARCHAR(100)
    , IN p_email 		VARCHAR(45)
    , IN p_password 	VARCHAR(45)
)
BEGIN


    UPDATE
        `rpay`.`tb_users`
        USE
            INDEX(ix_users_07)
        SET
              `tb_users`.`full_name` = p_full_name
            , `tb_users`.`email`     = p_email
            , `tb_users`.`password`  = (SELECT SHA1(p_password))
        WHERE
            `id` = p_userid
            AND`uuid` = p_uuid

    ;




CALL `rpay`.`sp_users_getbyid`(p_userid);

END$$
DELIMITER ;