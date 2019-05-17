/**
  * tb_genericcatalogs.
  *
  * @author cvaldezissc
  * @purpose this table will have all the catalogs that will be used on a generical way, like state, country, zip codes, etc
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_genericcatalogs`;

CREATE TABLE `tb_genericcatalogs`
(
  `id`                INT(11)       NOT NULL AUTO_INCREMENT                         COMMENT ''
  , `main_catalog`    VARCHAR(150)  NOT NULL                                        COMMENT 'It is the main catalog the item begins to (it is for grouping purposes)'
  , `key`             INT(11)       NOT NULL AUTO_INCREMENT                         COMMENT ''
  , `value`           VARCHAR(11)   NOT NULL AUTO_INCREMENT                         COMMENT ''
  ``                  INT(11)       NOT NULL AUTO_INCREMENT                         COMMENT ''
  `id`                INT(11)       NOT NULL AUTO_INCREMENT                         COMMENT ''

      /*
            ALL THE REQUIRED FIELDS HERE
            DO NOT FORGET DEFAULT VALUES ON EACH COLUMN AND IF IS OR NOT NULL FIELD
            SEPARATED BY COMMAS
      */

  , `creation_date`     DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP          COMMENT ''
  , `modification_date` DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ''
  , `status`            TINYINT(4)    NOT NULL DEFAULT '1' COMMENT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`[UNIQUE_FIELD]`),
  KEY `ix_[TABLENAME]_01` (`[FIELD1]`, ...),
  KEY `ix_[TABLENAME]_02` (`[FIELD1]`, `[FIELD2]`, ...),
  KEY `ix_[TABLENAME]_03` (`[FIELD1]`, `[FIELD2]`, ...)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


