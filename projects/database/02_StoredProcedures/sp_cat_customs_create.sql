/**
  * Inserts a new Custom in the customscatalog table.
  *
  * @author cvaldezissc
  * @param VARCHAR(50) p_keyname [In is the base name of the catalog]
  * @param VARCHAR(50) p_keyfolio [Is the folio like is on the official SAT Catalog documents to associate it]
  * @param VARCHAR(50) p_description [A little explanation of how is this for, it can be null]
  * @param VARCHAR(50) p_value [The final value which is going to be read by the apps that access to the information]
  * @returns BOOL: true=inserted correctly; false=there was an error
  */

USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_customscatalog_create`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `rpay`.`sp_customscatalog_create`(
    IN p_keyname       VARCHAR(50)
    , IN p_keyfolio    VARCHAR(2)
    , IN p_description VARCHAR(110)
    , IN p_value       VARCHAR(200)
)
BEGIN

    INSERT INTO `rpay`.`tb_cat_customs`
    (
        `keyname`,
        `keyfolio`,
        `description`,
        `value`,
        `creation_date`,
        `modification_date`,
        `status`
    )
    VALUES
    (
		(SELECT CONCAT('CAT_ADUANAS', ' ', p_keyfolio)),
        p_keyfolio,
        p_description,
        p_value,
        now(),
        now(),
        1
    );



END$$;