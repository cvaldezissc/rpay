USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`users`;

CREATE TABLE `users` (
  `id`        int(11)       NOT NULL AUTO_INCREMENT,
  `uuid`      varchar (40)  NOT NULL DEFAULT '',
  `full_name` varchar(100)  NOT NULL DEFAULT '',
  `email`     varchar(45)   NOT NULL DEFAULT '',
  `password`  varchar(45)   NOT NULL DEFAULT '',
  `is_admin`  tinyint(4)    NOT NULL DEFAULT '0',
  `status`    tinyint(4)    NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `ix_users_01` (`email`,`password`,`status`,`is_admin`),
  KEY `ix_users_02` (`is_admin`,`status`,`full_name`),
  KEY `ix_users_03` (`id`,`is_admin`),
  KEY `ix_users_04` (`id`,`password`),
  KEY `ix_users_05` (`status`),
  KEY `ix_users_06` (`is_admin`,`status`,`id`),
  KEY `ix_users_07` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
