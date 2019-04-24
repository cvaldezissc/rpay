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
  `id`                      INT(11)             NOT NULL AUTO_INCREMENT
  , `user_id`               INT(11)             NOT NULL DEFAULT '0'
  , `cer_file_url`          VARCHAR(150)        NOT NULL DEFAULT ''
  , `key_file_url`          VARCHAR(150)        NOT NULL DEFAULT ''
  , `privatekey_password`   VARCHAR(50)         NOT NULL DEFAULT ''
  , `cer_file`              JSON                    NULL DEFAULT NULL
  , `key_file`              JSON                    NULL DEFAULT NULL
  , `creation_date`         DATETIME 	        NOT NULL DEFAULT CURRENT_TIMESTAMP
  , `modification_date`     DATETIME 	        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  , `status`                TINYINT(4)          NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cerfile_UNIQUE` (`cer_file_url`),
  KEY `ix_certificates_01` (`user_id`),
  KEY `ix_certificates_02` (`cer_file_url`, `key_file_url`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


