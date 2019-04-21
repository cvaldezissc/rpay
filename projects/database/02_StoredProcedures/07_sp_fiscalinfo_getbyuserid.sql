/**
  * Gets a list of the fiscalinformation using the userId and UUID
  *
  * @author cvaldezissc
  * @param int p_user_id [User ID created in the database (returned when a new user is created)]
  * @param int p_user_uuid [UUID created in the database (returned when a new user is created)]
  * @returns table Result of Query .
  */


USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_fiscalinfo_getbyuserid`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost`
PROCEDURE `sp_fiscalinfo_getbyuserid`(
	IN p_user_id     INT
	, IN p_user_uuid VARCHAR(40)
)
BEGIN

SELECT
    `tb_fiscalinfo`.`id` AS 'id'
    ,`tb_fiscalinfo`.`user_id` AS 'user_id'
    ,`tb_fiscalinfo`.`user_uuid` AS 'uuid'
    ,`tb_fiscalinfo`.`rfc` AS 'rfc'
    ,`tb_fiscalinfo`.`business_name` AS 'socialReason'
    ,`tb_fiscalinfo`.`responsible_fullname` AS 'responsibleFullname'
    ,`tb_fiscalinfo`.`creation_date`, AS 'created'
    ,`tb_fiscalinfo`.`modification_date` AS 'lastModified'
    , `tb_fiscalinfo`.`status` AS 'status'
FROM
    `rpay`.`tb_fiscalinfo`  FORCE INDEX(`ix_fiscalinfo_02`)
WHERE
    `tb_fiscalinfo`.`id` = p_user_id
    AND
    `tb_fiscalinfo`.`user_uuid` = p_user_uuid

;


END$$