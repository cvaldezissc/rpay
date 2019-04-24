/**
  * sp_certificates_create
  * Adds a certificate to the table of certificates.
  *
  * @author cvaldezissc
  * @param int p_userid [ID FROM THE USER]
  * @param varchar p_cerfile_url [URL FROM THE FILE JUST UPLOADED TO A STORAGE SERVER]
  * @param varchar p_keyfile_url [URL FROM THE FILE JUST UPLOADED TO A STORAGE SERVER]
  * @param varchar p_filepassword [PASSWORD TO DECRYPT THE FILES]
  * @param JSON p_cerfile [PHYSICAL .cer FILE]
  * @param JSON p_keyfile [PHYSICAL .key FILE]
  * @returns bool
  *          true: Success
  *          false: error
  */

USE `rpay`;

DROP PROCEDURE IF EXISTS `rpay`.`sp_certificates_create`;

DELIMITER $$
CREATE DEFINER=`root`@`localhost`
PROCEDURE `rpay`.`sp_certificates_create`(
    p_userid                INT(11)
    , p_cerfile_url         VARCHAR(1000)
    , p_keyfile_url         VARCHAR(1000)
    , p_filepassword        VARCHAR(50)
    , p_cerfile             JSON
    , p_keyfile             JSON
)
BEGIN

    INSERT INTO `rpay`.`tb_certificates`
    (
        `id`
        , `user_id`
        , `cer_file_url`
        , `key_file_url`
        , `privatekey_password`
        , `cer_file`
        , `key_file`
        , `creation_date`
        , `modification_date`
        , `status`
    )
    VALUES
    (
        NULL
        , p_userid
        , p_cerfile_url
        , p_keyfile_url
        , p_filepassword
        , p_cerfile
        , p_keyfile
        , NOW()
        , NOW()
        , 1
    );


END$$