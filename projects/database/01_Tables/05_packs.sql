/**
  * tb_packs.
  *
  * @author cvaldezissc
  * @purpose Stores the packs catalog
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_packs`;

CREATE TABLE `tb_packs`
(
  `id`                      INT(11)         NOT NULL AUTO_INCREMENT                                             COMMENT 'Numeric ID of the pack'
  , `name`                  VARCHAR(50)         NULL DEFAULT ''                                                 COMMENT 'Name of the package'
  , `description`           VARCHAR(200)    NOT NULL DEFAULT ''                                                 COMMENT 'Description of how much the package includes'
  , `availablefolios`       INT(11)         NOT NULL DEFAULT 10                                                 COMMENT 'Number of folios that will be included in the package'
  , `isvalid`               TINYINT(4)      NOT NULL DEFAULT 1                                                  COMMENT 'Calculated field to define if the package is still available'
  , `activationdate`        DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP                                  COMMENT 'Date when this package starts to be Valid'
  , `expirationdate`        DATETIME            NULL                                                            COMMENT 'Date when the package expires and becomes Invalid; here we can not set a specific datetime so when the row is going to be modified it sets the new date'
  , `creation_date`         DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP                                  COMMENT 'Wate when the row was created'
  , `modification_date`     DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP      COMMENT 'If modified, here comes the modification date'
  , `status`                TINYINT(4)      NOT NULL DEFAULT '1'                                                COMMENT 'Status to define if the current row is active or inactive (logical deletion)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `packname_UNIQUE` (`name`),
  KEY `ix_packs_01` (`isvalid`),
  KEY `ix_packs_02` (`availablefolios`),
  KEY `ix_packs_03` (`activationdate`, `expirationdate`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;

