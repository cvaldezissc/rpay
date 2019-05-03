/**
  * tb_logos
  *
  * @author cvaldezissc
  * @purpose repository of logos of the enterprises to appear in the invoices
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_logos`;

CREATE TABLE `tb_logos`
(
  ` id`                   INT(11) UNSIGNED   NOT NULL AUTO_INCREMENT
  , `user_id`             INT(11) UNSIGNED   NOT NULL DEFAULT ''
  , `logo_url`            VARCHAR(200)       NOT NULL DEFAULT ''
  , `descripton`          VARCHAR(300)           NULL DEFAULT ''
  , `creation_date`       DATETIME 		     NOT NULL DEFAULT CURRENT_TIMESTAMP
  , `modification_date`   DATETIME 		     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  , `status`              TINYINT(1)         NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `logourl_UNIQUE` (`logo_url`),
  KEY `ix_logos_01` (`descripton`),
  KEY `ix_logos_02` (`user_id`),
  KEY `ix_logos_03` (`status`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


