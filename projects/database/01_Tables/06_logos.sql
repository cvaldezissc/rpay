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
  `id`                   INT(11)            NOT NULL AUTO_INCREMENT                                           COMMENT 'Unique id of the logo'
  , `user_id`             INT(11)            NOT NULL DEFAULT 0                                               COMMENT 'User ID that associates the User ID with the logo'
  , `logo_url`            VARCHAR(200)       NOT NULL DEFAULT ''                                              COMMENT 'URL to get the image file'
  , `descripton`          VARCHAR(300)           NULL DEFAULT ''                                              COMMENT 'Metadata to be included in the image'
  , `creation_date`       DATETIME 		     NOT NULL DEFAULT CURRENT_TIMESTAMP                               COMMENT 'When was it added'
  , `modification_date`   DATETIME 		     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   COMMENT 'If modified, this field has to be automatically updated'
  , `status`              TINYINT(1)         NOT NULL DEFAULT '1'                                             COMMENT 'Status to see which element is active or deleted',
  PRIMARY KEY (`id`),
  KEY `logourl_UNIQUE` (`logo_url`),
  KEY `ix_logos_01` (`descripton`),
  KEY `ix_logos_02` (`user_id`),
  KEY `ix_logos_03` (`status`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


