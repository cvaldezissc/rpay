USE `redemption`;

DROP TABLE IF EXISTS `redemption`.`redemption_payments`;

CREATE TABLE `redemption_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `send_transaction_id` varchar(100) NOT NULL,
  `send_address` varchar(50) NOT NULL,
  `send_amount` decimal(29,9) NOT NULL DEFAULT '0.000000000',
  `send_date` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `send_comment` varchar(256) NOT NULL,
  `receive_transaction_id` varchar(100) DEFAULT NULL,
  `receive_address` varchar(50) NOT NULL DEFAULT '',
  `receive_amount` decimal(29,9) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `send_transaction_id_UNIQUE` (`send_transaction_id`),
  KEY `ix_redemption_payments_01` (`send_transaction_id`,`status`),
  KEY `ix_redemption_payments_02` (`users_id`,`status`),
  KEY `ix_redemption_payments_03` (`receive_transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11427 DEFAULT CHARSET=latin1;
