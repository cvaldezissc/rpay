/**
  * Makes a logical deletion from a defined user.
  *
  * @author cvaldezissc
  * @param int p_userid [User ID]
  * @param varchar p_uuid [Unique ID given when created]
  * @returns row just updated user.
  */

USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_users_delete`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `rpay`.`sp_users_delete`(
    IN p_userid         INT(11)
    , IN p_uuid         VARCHAR(50)
)
BEGIN


    UPDATE
        `rpay`.`tb_users`
        USE
            INDEX(ix_users_07)
        SET
              `tb_users`.`status` = 0
        WHERE
            `id` = p_userid
            AND`uuid` = p_uuid

    ;




CALL `rpay`.`sp_users_getbyid`(p_userid);

END$$
DELIMITER ;