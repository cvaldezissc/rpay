/**
  * [TABLENAME].
  *
  * @author cvaldezissc
  * @purpose [PURPOSE OF THE TABLE]
  */

USE `[DB]`;

DROP TABLE IF EXISTS `[DB]`.`tb_[TABLENAME]`;

CREATE TABLE `[TABLENAME]`
(
  `id`                INT(11)       NOT NULL AUTO_INCREMENT                                            COMMENT 'Auto generated ID by the DB Engine'

      /*
            ALL THE REQUIRED FIELDS HERE
            DO NOT FORGET DEFAULT VALUES ON EACH COLUMN AND IF IS OR NOT NULL FIELD
            SEPARATED BY COMMAS
      */

  , `creation_date`     DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP                             COMMENT 'Creation date when the item is created by first time'
  , `modification_date` DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'When the registry is modified, we can also take it with the last modified datetime '
  , `status`            TINYINT(4)      NOT NULL DEFAULT '1'                                           COMMENT 'Determine if the item is logically deleted 1=Active; 0=Inactive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`[UNIQUE_FIELD]`),
  KEY `ix_[TABLENAME]_01` (`[FIELD1]`, ...),
  KEY `ix_[TABLENAME]_02` (`[FIELD1]`, `[FIELD2]`, ...),
  KEY `ix_[TABLENAME]_03` (`[FIELD1]`, `[FIELD2]`, ...)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


