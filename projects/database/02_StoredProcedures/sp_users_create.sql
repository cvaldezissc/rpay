/**
  * Add a new user to the table tb_users.
  * 
  * @author cvaldezissc
  * @param int $p_full_name [Full name of the person who is going to be stored]
  * @param int $p_email [Email of the user which is going to take it as unique value]
  * @param varchar $p_password [Base password to get into the system (it will be encrypted with SHA1 algorythm)]
  * @returns int The id of the new just created user .
  */

USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_users_create`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` 
PROCEDURE `rpay`.`sp_users_create`(
	in p_full_name 		varchar(100)
    , in p_email 		varchar(45)
    , in p_password 	varchar(45)
)
BEGIN

INSERT INTO
	`rpay`.`tb_users`
	(
		`id`
		, `uuid`
        , `full_name`
		, `email`
        , `password`
        , `is_admin`
        , `status`
        , `creation_date`
        , `modification_date`
	)
	VALUES
	(
		null
		, (SELECT UUID())
		, p_full_name
        , p_email
        , (SELECT SHA1(p_password))
        , 1
        , 1
        , (NOW())
        , (NOW())
    );

CALL `rpay`.`sp_users_getbyid`(LAST_INSERT_ID());

END$$
DELIMITER ;