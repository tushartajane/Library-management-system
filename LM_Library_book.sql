DROP PROCEDURE IF EXISTS library_book_stock;
DELIMITER $$
CREATE PROCEDURE library_book_stock()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < 10000 DO
  INSERT INTO stock(id,NAME,quantity)
  VALUES (i+1,CONCAT("Book_", i, "Name"), i+1);
  IF i % 1000 = 0
       THEN
         COMMIT;
     END IF;
  SET i = i + 1;
 END WHILE;
END$$
DELIMITER ;
