/**
  * Getting the version of the main DB engine
  * DEFAULT it must be the next:
        innodb_version	        8.0.13
        protocol_version	    10
        slave_type_conversions  null
        tls_version	            TLSv1,TLSv1.1,TLSv1.2
        version	                8.0.13
        version_comment	        MySQL Community Server - GPL
        version_compile_machine	x86_64
        version_compile_os	    macos10.14
        version_compile_zlib	1.2.11

  * @author cvaldezissc
  * @lastModified Apr 16 2019
  */


SHOW VARIABLES LIKE "%version%";