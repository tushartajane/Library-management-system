DROP PROCEDURE IF EXISTS library_book_authors;
DELIMITER $$
CREATE PROCEDURE library_book_authors()
BEGIN
  DECLARE i INT DEFAULT 0;
  SET FOREIGN_KEY_CHECKS=0; TRUNCATE inventory; SET FOREIGN_KEY_CHECKS=1;
  WHILE i < 1000000 DO
  INSERT INTO book_authors(author_id,book_id) 
  VALUES (i+1,i+1);
  SET i = i + 1;
 END WHILE;
END$$
DELIMITER ;
