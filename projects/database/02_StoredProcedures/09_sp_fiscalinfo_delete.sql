/**
  * Deletes logically fiscaldata from a user.
  *
  * @author cvaldezissc
  * @param int p_userid [User ID]
  * @param varchar p_uuid [Unique Identifier from the user]
  * @returns row just updated user.
  */

USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_users_delete`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `rpay`.`sp_users_delete`(
    IN p_userid                     INT(11)
    , IN p_user_uuid                VARCHAR(50)
)
BEGIN

    UPDATE `rpay`.`tb_fiscalinfo`
    USE INDEX(ix_fiscalinfo_02)
    SET
        `status` = 0
    WHERE
        `user_id` = p_userid
    AND
        `uuid`=    p_user_uuid
;


CALL `rpay`.`sp_users_getbyid`(p_userid);

END$$
DELIMITER ;