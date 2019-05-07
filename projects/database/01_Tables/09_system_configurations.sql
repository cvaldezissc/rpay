/**
  * tb_configurations.
  *
  * @author cvaldezissc
  * @purpose Be the reference KeyValue entity to define all the elements to be put as default in all the system
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_configurations`;

CREATE TABLE `tb_configurations`
(
  `id`                  INT(11)       NOT NULL AUTO_INCREMENT                                          COMMENT 'Unique ID'
  , `key`               VARCHAR(50)   NOT NULL DEFAULT 'BASE_CONFIG'                                   COMMENT 'This will be the name of the key which will be the reference when we make a search'
  , `description`       VARCHAR(100)  NOT NULL DEFAULT 'Dummy description'                             COMMENT 'This will be a simple explanation of the purpose of the new key'
  , `value`             VARCHAR(200)  NOT NULL DEFAULT ''                                              COMMENT 'The final value this will have, is given in varchar because it can be cast to any other value from there'
  , `creator`           INT(11)       NOT NULL DEFAULT 1                                               COMMENT 'To create a new row here it will be necessary to identify who created'
  , `creation_date`     DATETIME 	  NOT NULL DEFAULT CURRENT_TIMESTAMP                               COMMENT 'Date when added'
  , `modificator`       INT(11)           NULL                                                         COMMENT 'To update a row here it will be necessary to identify who modified it'
  , `modification_date` DATETIME 	  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   COMMENT 'Date when modified'
  , `status`            TINYINT(4)    NOT NULL DEFAULT '1'                                             COMMENT 'Status of the element if is active or deleted',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`key`),
  KEY `ix_configurations_01` (`value`),
  KEY `ix_configurations_02` (`status`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


