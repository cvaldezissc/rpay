/**
  * Getting the version of the main DB engine
  * DEFAULT it must be the next:
        innodb_version	        5.5.48
        protocol_version	    10
        version	                5.6.5
        version_comment	        MySQL Community Server (GPL)
        version_compile_machine	i386
        version_compile_os	    osx10.8
  * @author cvaldezissc
  * @lastModified Apr 16 2019
  */


SHOW VARIABLES LIKE "%version%";