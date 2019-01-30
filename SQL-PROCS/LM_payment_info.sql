DROP PROCEDURE IF EXISTS library_book_payment_info;
DELIMITER $$
CREATE PROCEDURE library_book_payment_info()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < 10000 DO
  INSERT INTO payment_info(mem_id ,date_of_payment,amount)
  VALUES (i+1,
  FROM_UNIXTIME(UNIX_TIMESTAMP('2018-11-11 01:00:00')+FLOOR(RAND()*31536000)),
  ROUND(RAND()*100,2));
  IF i % 1000 = 0
       THEN
         COMMIT;
     END IF;
  SET i = i + 1;
 END WHILE;
END$$
DELIMITER ;
