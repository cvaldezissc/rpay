/**
  * tb_cat_unitkey.
  *
  * @author cvaldezissc
  * @purpose Catalog of units of measurement (c_ClaveUnidad)
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_cat_unitkey`;

CREATE TABLE `tb_cat_unitkey`
(
  `id`                  INT(11)         NOT NULL AUTO_INCREMENT                                            COMMENT 'Auto generated ID by the DB Engine'
  , `unitkey_key`       VARCHAR(5)      NOT NULL DEFAULT ''                                                COMMENT 'Unit key defined by SAT (c_ClaveUnidad)'
  , `name`              VARCHAR(5)      NOT NULL DEFAULT ''                                                COMMENT 'Well known namd (Nombre)'
  , `description`       TEXT                NULL                                                           COMMENT 'Description of the unit of measurement (Descripcion)'
  , `note`              VARCHAR(250)    NOT NULL DEFAULT ''                                                COMMENT 'A little note if needed '
  , `valid_from`        DATETIME        NOT NULL                                                           COMMENT 'To add any observation or point of view related with this measurement unit'
  , `valid_to`          DATETIME        NOT NULL DEFAULT ''                                                COMMENT 'Date when begins to be valid'
  , `symbol`            VARCHAR(15)     NOT NULL DEFAULT ''                                                COMMENT 'Date when finishes from being valid'
  , `creation_date`     DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP                                 COMMENT 'Creation date when the item is created by first time'
  , `modification_date` DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP     COMMENT 'When the registry is modified, we can also take it with the last modified datetime '
  , `status`            TINYINT(4)      NOT NULL DEFAULT '1'                                               COMMENT 'Determine if the item is logically deleted 1=Active; 0=Inactive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`unitkey_key`),
  KEY `ix_unitkey_01` (`name`),
  KEY `ix_unitkey_02` (`valid_from`, `valid_to`, `status`),
  KEY `ix_unitkey_03` (`creation_date`, `modification_date`, `status`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


