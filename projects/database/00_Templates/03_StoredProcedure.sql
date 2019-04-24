/**
  * [PUROPOSE].
  *
  * @author [AUTHOR]
  * @param [TYPE] $p_full_name [PARAMS]
  * @returns [TYPE] [DESCRIPTION]
  */

USE `[DB]`;

DROP PROCEDURE IF EXISTS `[DB]`.`sp_[MAINTABLENAME]_[NAMEOFSP]`;

DELIMITER $$
CREATE DEFINER=`[DBUSER]`@`[DBSERVER]`
PROCEDURE `[DB]`.`sp_[MAINTABLENAME]_[NAMEOFSP]`(
    [PARAMS]
)
BEGIN

      /*
            ALL THE QUERIES INCLUDED IN YOUR SP
      */


END$$;