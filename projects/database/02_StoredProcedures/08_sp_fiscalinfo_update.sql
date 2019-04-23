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
    IN p_userid                     INT(11)
    , IN p_user_uuid                VARCHAR(50)
    , IN p_rfc                      VARCHAR(13)
    , IN p_businessname             VARCHAR(50)
	, IN p_responsible_full_name 	VARCHAR(100)
)
BEGIN

    UPDATE `rpay`.`tb_fiscalinfo`
    USE INDEX(ix_fiscalinfo_02)
    SET
        `rfc` = p_rfc,
        `business_name` = p_businessname,
        `responsible_fullname` = p_responsible_full_name,
        `modification_date` = NOW(),
        `status` = 1
    WHERE
        `user_id` = p_userid
    AND
        `uuid`=    p_user_uuid
;


END$$
DELIMITER ;