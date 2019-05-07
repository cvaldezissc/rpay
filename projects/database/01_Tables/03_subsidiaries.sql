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
  `id`                       INT(11)       NOT NULL AUTO_INCREMENT                                          COMMENT 'Unique Numeric Identifier'
  , `fiscalinfo_id`           INT(11)        NOT NULL DEFAULT '0'                                           COMMENT 'Reference to fiscal info row'
  , `subsidiary_name`         VARCHAR(45)        NULL DEFAULT ''                                            COMMENT 'Name of the subsidiary'
  , `account`                 INT(11)        NOT NULL DEFAULT '0'                                           COMMENT 'AutoIncrement account, (TODO: to be defined)'
  , `subsidiary_type`         INT(11)        NOT NULL DEFAULT '0'                                           COMMENT 'Subsidiary type (to be related with dictionary table)'
  , `serie`                   INT(11)        NOT NULL DEFAULT '0'                                           COMMENT 'Number of subsidiary'
  , `creation_date`           DATETIME 		 NOT NULL DEFAULT CURRENT_TIMESTAMP                             COMMENT 'Date when was created'
  , `modification_date`       DATETIME 		 NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date when is modified'
  , `status`                  TINYINT(4)     NOT NULL DEFAULT '1'                                           COMMENT 'Status for logical deletion',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fiscalinfoid_UNIQUE` (`fiscalinfo_id`),
  KEY `ix_subsidiaries_01` (`serie`),
  KEY `ix_subsidiaries_02` (`subsidiary_type`, `account`, `serie` ),
  KEY `ix_subsidiaries_03` (`status`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;





