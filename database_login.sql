create database userlogin;
create table `userlogin`.`userTabel`(
`user_id` BIGINT unique AUTO_INCREMENT,
  `user_name` VARCHAR(45) NULL,
  `user_username` VARCHAR(45) NULL,
  `user_password` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`));
select * from userTabel;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(
    IN p_name VARCHAR(45),
    IN p_username VARCHAR(45),
    IN p_password VARCHAR(45)
)
BEGIN
    if ( select exists (select 1 from userTable where user_username = p_username) ) THEN
     
        select 'Username Exists !!';
     
    ELSE
     
        insert into userTabel
        (
            user_name,
            user_username,
            user_password
        )
        values
        (
            p_name,
            p_username,
            p_password
        );
     
    END IF;
END$$
DELIMITER ;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validateLogin`(
IN p_username VARCHAR(45)
)
BEGIN
    select * from userTabel where user_username = p_username;
END$$
DELIMITER ;
drop procedure sp_validateLogin;
drop procedure sp_createUser;