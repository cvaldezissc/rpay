/**
  * tb_invoices.
  *
  * @author cvaldezissc
  * @purpose Store all the generated Invoices
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_invoices`;

CREATE TABLE `tb_invoices`
(
  `id`                  INT(11)         NOT NULL AUTO_INCREMENT                                            COMMENT 'Unique Invoice ID'
  , `user_id`           INT(11)         NOT NULL                                                           COMMENT 'User ID that generates the invoice'
  , `customer_id`       INT(11)         NOT NULL                                                           COMMENT 'Customer ID (of the userID) which the invoice is generated to '
  , `internal_uuid`     VARCHAR(31)     NOT NULL                                                           COMMENT 'The generated UUID for the internal control'
  , `products`          JSON            NOT NULL                                                           COMMENT 'The list of the purchased products/services that are included in the invoice'
  , `taxes`             INT(11)         NOT NULL                                                           COMMENT 'Taxes applied to the subtotal to calculate total'
  , `amount`            INT(11)         NOT NULL                                                           COMMENT 'Total amount of the invoice'
  , `digital_label`     VARCHAR(500)    NOT NULL                                                           COMMENT 'The answered digital label by the SAT'
  , `invoice_link`      VARCHAR(150)    NOT NULL                                                           COMMENT 'Once generated the invoice is generated into XML and PDF file, which is stored in any place(not defined yet) and that place will have an URL which is going to stay here'
  , `creation_date`     DATETIME 	    NOT NULL DEFAULT CURRENT_TIMESTAMP                                 COMMENT 'When the row was generated'
  , `modification_date` DATETIME 	    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP     COMMENT 'If there is a modification it will save it on a specific datetime which is going to live here'
  , `status`            TINYINT(4)      NOT NULL DEFAULT '1'                                               COMMENT 'To be defined, but this is going to be controlled by generic catalog table item',
  PRIMARY KEY (`id`),
  KEY `ix_invoices_01` (`user_id`, `customer_id`),
  KEY `ix_invoices_02` (`creation_date`, `modification_date`),
  KEY `ix_invoices_03` (`status`),
  KEY `ix_invoices_03` (`amount`),
  KEY `ix_invoices_03` (`internal_uuid`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


