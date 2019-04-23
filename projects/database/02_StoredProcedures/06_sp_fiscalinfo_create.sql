/**
  * Adds a new fiscalinfo to the table tb_fiscalinfo.
  *
  * @author cvaldezissc
  * @param int p_userid [User ID to be related with the user]
  * @param int p_useruuid [UUID to verify the to the user]
  * @param varchar p_rfc [mexican RFC provided by tax agency SAT]
  * @param varchar p_businessname [The enterprise name according to RFC]
  * @param varchar p_responsiblefullname [person name taken as the responsible of managing this account]
  * @returns int The id of the new just created fiscal information .
  */


USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_fiscalinfo_create`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `rpay`.`sp_fiscalinfo_create`(
    IN p_userid                     INT(11)
    , IN p_useruuid                 VARCHAR(45)
    , IN p_rfc   		            VARCHAR(13)
    , IN p_businessname 	        VARCHAR(100)
    , IN p_responsiblefullname      VARCHAR(100)
)
BEGIN


    INSERT INTO
        `rpay`.`tb_fiscalinfo`
        (
          `id`
          , `user_id`
          , `user_uuid`
          , `rfc`
          , `business_name`
          , `responsible_fullname`
          , `status`
          , `creation_date`
          , `modification_date`
        )
        VALUES
        (
            NULL
            , p_userid
            , p_useruuid
            , p_rfc
            , p_businessname
            , p_responsiblefullname
            , 1
            , (SELECT NOW())
            , (SELECT NOW())
        );



END$$