/**
  * tb_users.
  *
  * @author cvaldezissc
  * @purpose To be the repository of users (People who are directly our customers)
  */


USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_users`;

CREATE TABLE `tb_users`
(
  `id`                INT(11)       NOT NULL AUTO_INCREMENT                                             COMMENT 'Unique Numeric ID to identify the user'
  , `uuid`              VARCHAR (40)      NULL DEFAULT ''                                               COMMENT 'Unique Identifier as a second control to identify the user'
  , `full_name`         VARCHAR(100)  NOT NULL DEFAULT ''                                               COMMENT 'Calculated Column to join firstname and lastname'
  , `firstname`         VARCHAR(50)   NOT NULL DEFAULT ''                                               COMMENT 'First name of the user'
  , `lastname`          VARCHAR(50)   NOT NULL DEFAULT ''                                               COMMENT 'Last name of the user'
  , `email`             VARCHAR(45)   NOT NULL DEFAULT ''                                               COMMENT 'Email of the user, it will be used in the login'
  , `password`          VARCHAR(45)   NOT NULL DEFAULT ''                                               COMMENT 'Password field, rhis will be encrypted under SHA-1 Algorythm'
  , `is_admin`          TINYINT(4)    NOT NULL DEFAULT '0'                                              COMMENT 'Flag to define if the user is an admin or not'
  , `creation_date`     DATETIME 	  NOT NULL DEFAULT CURRENT_TIMESTAMP                                COMMENT 'When was the user Created'
  , `modification_date` DATETIME 	  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    COMMENT 'When a modification is made, here comes the update of datetime'
  , `status`            TINYINT(4)    NOT NULL DEFAULT '1'                                              COMMENT 'For logical deletion',
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


