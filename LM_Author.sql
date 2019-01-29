DROP PROCEDURE IF EXISTS library_book_author;
DELIMITER $$
CREATE PROCEDURE library_book_author()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < 10000 DO
  INSERT INTO author(id,NAME)
  VALUES (i+1,CONCAT("Book_author", i, "Name"));
  IF i % 1000 = 0
       THEN
         COMMIT;
     END IF;
  SET i = i + 1;
 END WHILE;
END$$
DELIMITER ;
