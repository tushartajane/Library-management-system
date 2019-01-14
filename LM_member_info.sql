DROP PROCEDURE IF EXISTS library_member_info;
DELIMITER $$
CREATE PROCEDURE library_member_info()
BEGIN
DECLARE i INT DEFAULT 0;
SET FOREIGN_KEY_CHECKS=0; TRUNCATE member_info; SET FOREIGN_KEY_CHECKS=1;
WHILE i < 1000000 DO
INSERT INTO member_info(id,first_name,last_name,mobile,email ,address)
 VALUES (i+1,CONCAT("Fname_", i),CONCAT("Lname_", i),i+1,CONCAT("Fname", i, "@gmail.com"),CONCAT("Address_", i));
 commit;
 IF i % 10000 = 0
      THEN
        COMMIT;
    END IF;

SET i = i + 1;
END WHILE;
END$$
DELIMITER ;
