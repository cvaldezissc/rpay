USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`subsidiaries`;

CREATE TABLE `subsidiaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tax_information` int(11) NOT NULL DEFAULT '0',
  `subsidiary_name` varchar(13) NULL DEFAULT '',
  `account` TINYINT(4) NOT NULL DEFAULT '0',
  `subsidiary_type`
  `serie` int(11) NOT NULL DEFAULT '0'
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `ix_subsidiaries_01` (`email`,`password`,`status`,`is_admin`),
  KEY `ix_subsidiaries_02` (`is_admin`,`status`,`full_name`),
  KEY `ix_subsidiaries_03` (`id`,`is_admin`),
  KEY `ix_subsidiaries_04` (`id`,`password`),
  KEY `ix_subsidiaries_05` (`status`),
  KEY `ix_subsidiaries_06` (`is_admin`,`status`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;