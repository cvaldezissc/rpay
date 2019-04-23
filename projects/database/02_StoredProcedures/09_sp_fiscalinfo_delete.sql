/**
  * Deletes logically fiscaldata from a user.
  *
  * @author cvaldezissc
  * @param int p_userid [User ID]
  * @param varchar p_uuid [Unique Identifier from the user]
  * @returns row just updated user.
  */

USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_fiscalinfo_delete`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `rpay`.`sp_fiscalinfo_delete`(
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
        `user_uuid`=    p_user_uuid
;



    CALL `rpay`.`sp_fiscalinfo_getbyuserid`(p_userid, p_user_uuid);

END$$
DELIMITER ;