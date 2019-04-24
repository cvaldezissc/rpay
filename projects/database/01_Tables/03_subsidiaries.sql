/**
  * tb_subsidiaries.
  *
  * @author cvaldezissc
  * @purpose Store the subsidiaries of each user
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_subsidiaries`;

CREATE TABLE `tb_subsidiaries`
(
  `id`                       INT(11)       NOT NULL AUTO_INCREMENT
  , `fiscalinfo_id`           INT(11)        NOT NULL DEFAULT '0'
  , `subsidiary_name`         VARCHAR(45)        NULL DEFAULT ''
  , `account`                 INT(11)        NOT NULL DEFAULT '0'
  , `subsidiary_type`         INT(11)        NOT NULL DEFAULT '0'
  , `serie`                   INT(11)        NOT NULL DEFAULT '0'
  , `creation_date`           DATETIME 		 NOT NULL DEFAULT CURRENT_TIMESTAMP
  , `modification_date`       DATETIME 		 NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  , `status`                    TINYINT(4)     NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fiscalinfoid_UNIQUE` (`fiscalinfo_id`),
  KEY `ix_subsidiaries_01` (`serie`),
  KEY `ix_subsidiaries_02` (`subsidiary_type`, `account`, `serie` ),
  KEY `ix_subsidiaries_03` (`status`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;





