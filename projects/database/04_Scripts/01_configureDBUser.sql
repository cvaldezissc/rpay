/**
  * Creates the base DB User to make everything work
  *
  * @author cvaldezissc
  * @lastModified Apr 16 2019
  */


USE rpay;


UPDATE user SET Password=PASSWORD('my_password') where USER='root';


CREATE USER `rpayDbTestUser`@`localhost` IDENTIFIED BY 'ThisIsThePassword';


GRANT ALL PRIVILEGES ON `rpay`.* TO `rpayDbTestUser`@`localhost` IDENTIFIED BY 'ThisIsThePassword';