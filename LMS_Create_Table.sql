CREATE TABLE member_info
(
      id INT PRIMARY KEY,
      first_name VARCHAR(255) NOT NULL,
      last_name VARCHAR(255) NOT NULL,
      mobile INT(10),
      email VARCHAR(255) UNIQUE,
      address TEXT(255)
);

CREATE TABLE stock
(
      id INT PRIMARY KEY,
      name VARCHAR(255),
      quantity INT
);

CREATE TABLE author
(
       id INT PRIMARY KEY,
       name VARCHAR(255)
);

CREATE TABLE book_authors
(
       author_id INT,
       book_id INT,
       FOREIGN KEY (book_id) REFERENCES stock(id),
       FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE book_audit
(
      mem_id INT,
      book_id INT,
      issue_date DATE NOT NULL,
      return_date DATE,
      FOREIGN KEY (mem_id) REFERENCES member_info(id),
      FOREIGN KEY (book_id) REFERENCES stock(id)
);

CREATE table payment_info
(
   mem_id INT,
   date_of_payment DATE,
   amount INT,
   FOREIGN KEY (mem_id) REFERENCES member_info(id)
);
