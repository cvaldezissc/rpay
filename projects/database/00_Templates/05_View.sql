/**
  * [VIEWNAME].
  *
  * @author [AUTHOR]
  * @purpose [PURPOSE]
  * @lastModified [LASTMODIFIED]
  * @lastModifier [MODIFIER]
  */


USE [DB]
DROP VIEW IF EXISTS vw_[VIEWNAME];

DELIMITER $$

CREATE VIEW `[DB]`.vw_[VIEWNAME] AS


    SELECT
        /*
         * All the FIELDS
         */
    FROM
        [MAINTABLENAME] [TABLE_A] FORCE INDEX [PREPAREDINDEX]
    INNER JOIN
        [MAINTABLENAME] [TABLE_B]
    GROUP by [FIELDTOGROUPBY]
    ORDER BY [FIELDTOORDERBY] [ORDERCRITERIA];


END;