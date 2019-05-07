/**
  * tb_fiscalinfo.
  *
  * @author cvaldezissc
  * @purpose To be the repository dictionary of each user (not customers)
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_fiscalinfo`;

CREATE TABLE `tb_fiscalinfo`
(
  `id`                        INT(11)       NOT NULL AUTO_INCREMENT                                           COMMENT 'Numeric reference'
  , `user_uuid`               VARCHAR(45)   NOT NULL DEFAULT ''                                               COMMENT 'Unique User Identifier'
  , `rfc`                     VARCHAR(13)       NULL DEFAULT ''                                               COMMENT 'RFC by the SAT'
  , `business_name`           VARCHAR(100)  NOT NULL DEFAULT ''                                               COMMENT 'Name of the business like Business SA'
  , `responsible_fullname`    VARCHAR(100)  NOT NULL DEFAULT ''                                               COMMENT 'Name of the person which is going to be the responsible of managing the account'
  , `creation_date`           DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP                                COMMENT 'When was this information is added'
  , `modification_date`       DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    COMMENT 'When a modification is made, here comes the new datetime'
  , `status`                  TINYINT(4)    NOT NULL DEFAULT '1'                                              COMMENT 'Status for logical deletion' ,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfc_UNIQUE` (`rfc`),
  KEY `ix_fiscalinfo_02` (`user_uuid`),
  KEY `ix_fiscalinfo_03` (`status`),
  KEY `ix_fiscalinfo_04` (`responsible_fullname`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;