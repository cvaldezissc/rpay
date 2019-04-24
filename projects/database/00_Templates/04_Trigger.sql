/**
  * [TIGGERNAME].
  *
  * @author [AUTHOR]
  * @purpose [PURPOSE]
  * @reason [REASON]
  * @lastModified [LASTMODIFIED]
  * @lastModifier [MODIFIER]
  * --disclaimer: Triggers are dangerous so we have to be really careful when create it
  */


USE `[DB]`

CREATE TRIGGER `[DB]`.`tr_[TABLENAME]_[TRIGGERNAME]` [TRIGGERTIME] [TRIGGEREVENT]
ON [TABLENAME]
FOR EACH ROW
BEGIN
    /*
     * All the statements launched by this trigger
     */
END;