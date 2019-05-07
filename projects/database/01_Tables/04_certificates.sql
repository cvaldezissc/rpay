/**
  * tb_certificates.
  *
  * @author cvaaldezissc
  * @purpose [BE THE TABLE TO STORE THE DOCUMENTS TO SIGN THE INVOICES]
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_certificates`;

CREATE TABLE `tb_certificates`
(
  `id`                      INT(11)             NOT NULL AUTO_INCREMENT                                         COMMENT 'Numeric Identifier'
  , `user_id`               INT(11)             NOT NULL DEFAULT '0'                                            COMMENT 'User ID to be related with'
  , `cer_file_url`          VARCHAR(150)        NOT NULL DEFAULT ''                                             COMMENT 'link to .cer file'
  , `key_file_url`          VARCHAR(150)        NOT NULL DEFAULT ''                                             COMMENT 'link to .key file'
  , `privatekey_password`   VARCHAR(50)         NOT NULL DEFAULT ''                                             COMMENT 'main password to be used to decrypt the last two files '
  , `cer_file`              JSON                    NULL DEFAULT NULL                                           COMMENT 'If needed this will be the file inside a JSON structure'
  , `key_file`              JSON                    NULL DEFAULT NULL                                           COMMENT 'If needed this will be the file inside a JSON structure'
  , `creation_date`         DATETIME 	        NOT NULL DEFAULT CURRENT_TIMESTAMP                              COMMENT 'When was it created'
  , `modification_date`     DATETIME 	        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'When was it modified'
  , `status`                TINYINT(4)          NOT NULL DEFAULT '1'                                            COMMENT 'Status for logical deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cerfile_UNIQUE` (`cer_file_url`),
  KEY `ix_certificates_01` (`user_id`),
  KEY `ix_certificates_02` (`cer_file_url`, `key_file_url`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


