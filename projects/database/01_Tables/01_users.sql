USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_users`;

CREATE TABLE `tb_users`
(
  `id`                INT(11)       NOT NULL AUTO_INCREMENT,
  `uuid`              VARCHAR (40)  NOT NULL DEFAULT '',
  `full_name`         VARCHAR(100)  NOT NULL DEFAULT '',
  `email`             VARCHAR(45)   NOT NULL DEFAULT '',
  `password`          VARCHAR(45)   NOT NULL DEFAULT '',
  `is_admin`          TINYINT(4)    NOT NULL DEFAULT '0',
  `creation_date`     DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modification_date` DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status`            TINYINT(4)    NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `ix_users_01` (`email`,`password`,`status`,`is_admin`),
  KEY `ix_users_02` (`is_admin`,`status`,`full_name`),
  KEY `ix_users_03` (`id`,`is_admin`),
  KEY `ix_users_04` (`id`,`password`),
  KEY `ix_users_05` (`status`),
  KEY `ix_users_06` (`is_admin`,`status`,`id`),
  KEY `ix_users_07` (`id`,`uuid`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


