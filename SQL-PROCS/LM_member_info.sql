DROP PROCEDURE IF EXISTS library_member_info;
DELIMITER $$
CREATE PROCEDURE library_member_info()
BEGIN
DECLARE i INT DEFAULT 0;
WHILE i < 10000 DO
INSERT INTO member_info(id,first_name,last_name,mobile,email ,address)
 VALUES (i+1,CONCAT("Fname_", i),CONCAT("Lname_", i),i+1,CONCAT("Fname", i, "@gmail.com"),CONCAT("Address_", i));
 IF i % 1000 = 0
      THEN
        COMMIT;
    END IF;

SET i = i + 1;
END WHILE;
END$$
DELIMITER ;
