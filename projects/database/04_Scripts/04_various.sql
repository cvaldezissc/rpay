

CREATE DATABASE IF NOT EXISTS rpay_1;


USE rpay;

DROP USER `rpayDbTestUse`@`localhost`;

CREATE USER `rpayDbTestUser`@`localhost` IDENTIFIED BY 'ThisIsThePassword';

GRANT ALL PRIVILEGES ON rpay. TO 'rpayDbTestUser'@'localhost';

GRANT CREATE, DROP, DELETE, INSERT, SELECT, UPDATE ON *.* TO `rpayDbTestUser`@`localhost` IDENTIFIED BY 'ThisIsThePassword';

FLUSH PRIVILEGES;

SHOW GRANTS FOR `rpayDbTestUser`@`localhost`;