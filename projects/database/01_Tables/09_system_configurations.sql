USE `redemption`;

DROP TABLE IF EXISTS `redemption`.`system_configurations`;

CREATE TABLE `system_configurations` (
  `configuration_key` varchar(45) NOT NULL DEFAULT '',
  `value` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`configuration_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
