DROP PROCEDURE IF EXISTS library_book_authors;
DELIMITER $$
CREATE PROCEDURE library_book_authors()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < 10000 DO
  INSERT INTO book_authors(author_id,book_id)
  VALUES (i+1,i+1);
  IF i % 1000 = 0
       THEN
         COMMIT;
     END IF;
  SET i = i + 1;
 END WHILE;
END$$
DELIMITER ;
