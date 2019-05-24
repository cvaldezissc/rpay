/**
  * tb_customers.
  *
  * @author cvaldezissc
  * @purpose To be the repository of the customers per user
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_customers`;

CREATE TABLE `tb_customers`
(
  `id`                  INT(11)       NOT NULL AUTO_INCREMENT                                        COMMENT 'Unique ID'
  , `user_id`           INT(11)       NOT NULL DEFAULT 1                                             COMMENT 'User ID which this customer belongs to'
  , `customer_name`     VARCHAR(50)   NOT NULL DEFAULT ''                                            COMMENT 'Name of the person which is going to receive the invoice'
  , `business_name`     VARCHAR(100)  NOT NULL DEFAULT ''                                            COMMENT 'It is the social name given by SAT'
  , `rfc`               VARCHAR(13)   NOT NULL DEFAULT ''                                            COMMENT 'Key generated on the SAT of 13 digits'
  , `address`           VARCHAR(100)  NOT NULL DEFAULT ''                                            COMMENT 'Address of this RFC'
  , `email`             VARCHAR(50)   NOT NULL DEFAULT ''                                            COMMENT 'Email which the invoice is going to be sent'
  , `creation_date`     DATETIME 	  NOT NULL DEFAULT CURRENT_TIMESTAMP                             COMMENT 'Creation date'
  , `modification_date` DATETIME 	  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'If modified, the new date will be here'
  , `status`            TINYINT(4)    NOT NULL DEFAULT 1                                             COMMENT 'Status of this customer',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `ix_customers_01` (`customer_name`,`business_name` ),
  KEY `ix_customers_02` (`rfc`),
  KEY `ix_customers_03` (`email`),
  KEY `ix_customers_04` (`status`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


