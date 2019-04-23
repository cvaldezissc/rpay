USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_fiscalinfo`;

CREATE TABLE `tb_fiscalinfo`
(
  `id`                        INT(11)       NOT NULL AUTO_INCREMENT
  , `user_uuid`               VARCHAR(45)   NOT NULL DEFAULT ''
  , `rfc`                     VARCHAR(13)       NULL DEFAULT ''
  , `business_name`           VARCHAR(100)  NOT NULL DEFAULT ''
  , `responsible_fullname`    VARCHAR(100)  NOT NULL DEFAULT ''
  , `creation_date`           DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP
  , `modification_date`       DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  , `status`                  TINYINT(4)    NOT NULL DEFAULT '1',

  PRIMARY KEY (`id`),
  UNIQUE KEY `rfc_UNIQUE` (`rfc`),
  KEY `ix_fiscalinfo_02` (`user_id`,`user_uuid`),
  KEY `ix_fiscalinfo_03` (`status`),
  KEY `ix_fiscalinfo_04` (`responsible_fullname`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;