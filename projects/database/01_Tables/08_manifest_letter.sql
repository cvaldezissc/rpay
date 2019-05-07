/**
  * tb_manifest_letter.
  *
  * @author cvaldezissc
  * @purpose The manifest letter is a document used by the companies to stabilish the society to make
  *             each process, is required by SAT
  */

USE `rpay`;

DROP TABLE IF EXISTS `rpay`.`tb_manifest_letter`;

CREATE TABLE `tb_manifest_letter`
(
  `id`                      INT(11)         NOT NULL AUTO_INCREMENT                                           COMMENT 'Unique ID'
  , `user_id`               INT(11)         NOT NULL DEFAULT 1                                                COMMENT 'The User ID which the manifest letter belongs to'
  , `manifest_letter_url`   VARCHAR(200)    NOT NULL DEFAULT ''                                               COMMENT 'THis will be an URL to a physical file '
  , `verifier`              INT(11)         NOT NULL DEFAULT 1                                                COMMENT 'This is the User_id that has the value to verify the element to be valid according to the SAT'
  , `creation_date`         DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP                                COMMENT 'Date and time when it was created'
  , `modification_date`     DATETIME 		NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    COMMENT 'Date and time when is modified'
  , `status`                TINYINT(4)      NOT NULL DEFAULT '1'                                              COMMENT 'Status of the row for logical deletions',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId_UNIQUE` (`user_id`),
  KEY `ix_manifest_letter_01` (`manifest_letter_url`),
  KEY `ix_manifest_letter_02` (`verifier`),
  KEY `ix_manifest_letter_03` (`status`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=latin1;


