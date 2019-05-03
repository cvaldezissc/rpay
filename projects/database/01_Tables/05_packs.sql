/**
  * tb_packs.
  *
  * @author cvaldezissc
  * @purpose Stores the packs catalog
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_packs`;
DELIMITER $$;

CREATE TABLE `tb_packs`
(
  `id`                      INT(11)         NOT NULL AUTO_INCREMENT
  , `name`                  VARCHAR(50)         NULL DEFAULT ''
  , `description`           VARCHAR(200)    NOT NULL DEFAULT ''
  , `availablefolios`       INT(11)         NOT NULL DEFAULT 10
  , `isvalid`               TINYINT(4)      NOT NULL DEFAULT 1
  , `activationdate`        DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP
  , `expirationdate`        DATETIME        NOT NULL DEFAULT '2019-01-01 00:00:00:00'
  , `creation_date`         DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP
  , `modification_date`     DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  , `status`                TINYINT(4)      NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `packname_UNIQUE` (`name`, `description`),
  KEY `ix_packs_01` (`isvalid`),
  KEY `ix_packs_02` (`availablefolios`),
  KEY `ix_packs_03` (`activationdate`, `expirationdate`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


END$$;