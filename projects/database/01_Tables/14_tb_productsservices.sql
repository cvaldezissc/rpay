/**
  * tb_products.
  *
  * @author cvaldezissc
  * @purpose Be the repository of products (catalog) to be included into the invoices
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_`;

CREATE TABLE `[TABLENAME]`
(
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


