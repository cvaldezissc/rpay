/**
  * Creates a new row of a new subsidiary from the user.
  *
  * @author cvaldezissc
  * @param int p_fiscalinfo_id [ID given from the fiscalinfo table, in this case a function can be called to fill this field]
  * @param varchar p_subsidiaryname [Name of the subsidiary ]
  * @param int p_account[To be documented]
  * @param int p_subsidiarytype [Type of subsidiary obtained from the GenericCatalogs]
  * @param int p_serie [AutoIncrement Value obtained from a function]
  * @returns bool [DESCRIPTION]
                true: Successful
                false: Error
  */

USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_subsidiaries_create`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `rpay`.`sp_subsidiaries_create`(
    IN p_user_id            INT(11)
    , IN p_fiscalinfo_id    INT(11)
    , IN p_subsidiaryname   VARCHAR(45)
    , IN p_account          INT(11)
    , IN p_subsidiarytype   INT(11)
    , IN p_serie            INT(11)
)
BEGIN

      INSERT INTO `rpay`.`tb_subsidiaries`
        (
            `id`
            , `fiscalinfo_id`
            , `subsidiary_name`
            , `account`
            , `subsidiary_type`
            , `serie`
            , `creation_date`
            , `modification_date`
            , `status`
        )
        VALUES
        (
            NULL
            , p_fiscalinfo_id
            , p_subsidiaryname
            , p_account
            , p_subsidiarytype
            , p_serie
            , NOW()
            , NOW()
            , 1
        );



END$$