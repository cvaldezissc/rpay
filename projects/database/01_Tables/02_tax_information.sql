USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tax_information`;

CREATE TABLE `tax_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfc` varchar(13) NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT '0'
  `responsible_full_name` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `ix_tax_information_01` (`email`,`password`,`status`,`is_admin`),
  KEY `ix_tax_information_02` (`is_admin`,`status`,`full_name`),
  KEY `ix_tax_information_03` (`id`,`is_admin`),
  KEY `ix_tax_information_04` (`id`,`password`),
  KEY `ix_tax_information_05` (`status`),
  KEY `ix_tax_information_06` (`is_admin`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;