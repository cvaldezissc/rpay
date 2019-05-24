/**
  * tb_cat_customs.
  *
  * @author cvaldezissc
  * @purpose Be the catalog of Customs (aduanas)
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_cat_customs`;

CREATE TABLE `tb_cat_customs`
(
  `id`                  INT(11)             NOT NULL AUTO_INCREMENT                                        COMMENT 'AutoIncrement ID which is stored automatically'
  , `keyname`           VARCHAR(50)         NOT NULL DEFAULT ''                                            COMMENT 'Is the key of the specific catalog for this case it will be "CAT_ADUANAS + Identifier"'
  , `keyfolio`          VARCHAR(2)          NOT NULL DEFAULT ''                                            COMMENT 'This is the folio, referenced in the excel files (usually is a numeric label)"'
  , `description`       VARCHAR(110)            NULL DEFAULT ''                                            COMMENT 'A little description made by the catalogs (initially required by SAT'
  , `value`             VARCHAR(200)        NOT NULL DEFAULT ''                                            COMMENT 'The value taken and going to be shown in the apps'
  , `creation_date`     DATETIME 		    NOT NULL DEFAULT CURRENT_TIMESTAMP                             COMMENT 'Date when created'
  , `modification_date` DATETIME 		    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date when is modified'
  , `status`            TINYINT(4)          NOT NULL DEFAULT '1'                                           COMMENT 'To determine if a registry is deleted (logically) or not',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`keyname`),
  KEY `ix_customscatalog_01` (`status`),
  KEY `ix_customscatalog_02` (`value`),
  KEY `ix_customscatalog_03` (`keyfolio`),
  KEY `ix_customscatalog_04` (`creation_date`, `status`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


