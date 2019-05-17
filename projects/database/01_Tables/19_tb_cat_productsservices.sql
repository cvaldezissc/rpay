/**
  * tb_cat_productsservices
  *
  * @author cvaldezissc
  * @purpose Store the main catalog of products and services (c_ClaveProdServ)
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_cat_productsservices`;

CREATE TABLE `tb_cat_productsservices`
(
  `id`                                INT(11)           NOT NULL AUTO_INCREMENT                                         COMMENT 'Auto generated ID by the DB Engine'
  , `prodserv_key`                    BIGINT            NOT NULL DEFAULT '01010101'                                     COMMENT 'is the key of the product or service, defined in c_ClaveProdServ field in the catalogs'
  , `description`                     VARCHAR(200)      NOT NULL DEFAULT ''                                             COMMENT 'The value of the searched product or service'
  , `valid_from`                      DATETIME          NOT NULL DEFAULT CURRENT_TIMESTAMP                              COMMENT 'According to the official SATs catalog this the valid period when starts'
  , `valid_to`                        DATETIME              NULL                                                        COMMENT 'According to the official SATs catalog this the valid period when ends'
  , `includes_transferred_vat`        TINYINT(4)        NOT NULL DEFAULT 0                                              COMMENT 'If the element includes transferred VAT (IVA trasladado) 0=No, 1=Yes, 2=Optional'
  , `includes_transferred_ieps`       TINYINT(4)        NOT NULL DEFAULT 0                                              COMMENT 'If the element includes transferred IEPS (IEPS trasladado) 0=No, 1=Yes, 2=Optional'
  , `complement_mustbeincluded`       VARCHAR(50)       NOT NULL DEFAULT ''                                             COMMENT 'In some cases the prod/service must include any complement; if yes, here comes that complement'
  , `creation_date`                   DATETIME 		    NOT NULL DEFAULT CURRENT_TIMESTAMP                              COMMENT 'Creation date when the item is created by first time'
  , `modification_date`               DATETIME 		    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  COMMENT 'When the registry is modified, we can also take it with the last modified datetime '
  , `status`                          TINYINT(4)        NOT NULL DEFAULT 0                                              COMMENT 'Determine if the item is logically deleted 1=Active; 0=Inactive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `prodservkey_UNIQUE` (`prodserv_key`),
  KEY `ix_productsservices_01` (`includes_transferred_vat`, `includes_transferred_ieps`),
  KEY `ix_productsservices_02` (`valid_from`),
  KEY `ix_productsservices_03` (`creation_date`, `modification_date`, `status`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


