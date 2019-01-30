
Reports:
1. Display the number of books currently present in a stock whose quantity is less than 10.
select count(*) NumberOfBooks from stock where quantity >100;

2. Display the name of books in stock and their respective authors.
select s.name Book Name,a.name Author Name from stock s join author a on s.id = a.id;

3. Display the book name of every book currently issued by the library to the member.
select s.name Book_name from book_audit ba join stock s on ba.book_id=s.id;

4. Display the name of books issued on the date='2018-01-10'
select s.name Book_name from book_audit ba join stock s on ba.book_id=s.id where ba.issue_date='2018-12-28';

5. Display the author(s) of the book 'DB By Korth'
Select name from  authors where name='DB By Korth';

6. Display the first name, last name, mobile no along with their issue date, return date and book name for each member.
select m.*, ba.issue_date, ba.return_date,s.name Book_Name from member_info m join book_audit ba on m.id=ba.mem_id join stock s on s.id=ba.book_id;

7. Display the name of the book and their last  issue date
select max(ba.issue_date) LastIssueDate,s.name Book_Name from book_audit ba join stock s on s.id=ba.book_id group by s.id;

8. Display “late fee”* of the particular member upon a book
select m.first_name,m.last_name, pi.amount late_fee, pi.mem_id memberID,s.name BookName from payment_info pi join member_info m on m.id=pi.mem_id join book_audit ba on ba.book_id=pi.mem_id join stock s on ba.book_id=s.id;

9. Display summation of "late fees" of a particular member.
select pi.mem_id,m.first_name,sum(amount) from payment_info pi join member_info m on m.id=pi.mem_id group by pi.mem_id limit 10;

11.  Display "late fees" of a member, per book.
select pi.mem_id,m.first_name,s.name,sum(amount) from payment_info pi join member_info m on m.id=pi.mem_id join book_audit ba on ba.mem_id=pi.mem_id join stock s on s.id=ba.book_id group by pi.mem_id,s.name;

12. Display top 3 of the most issued books all over
SELECT name,COUNT(name) AS NoOfCopies FROM book_audit INNER JOIN stock ON book_audit.book_id = stock.id GROUP BY name ORDER BY NoOfCopies DESC LIMIT 3;

13. Display the top 3 books which are issued the most in a per month
SELECT book.name,MONTHNAME(log.issue_date)AS month,
YEAR( log.issue_date )AS year,
COUNT(log.book_id)AS number_of_copies_issued
FROM book_audit AS log
INNER JOIN stock AS book
ON log.book_id = book.id GROUP BY month, log.book_id , year ORDER BY year,
month, number_of_copies_issued DESC;

14. Display total revenue of this month.
SELECT MONTHNAME(pi.date_of_payment)AS month,
sum(pi.amount)AS TotalRevenue from payment_info pi
GROUP BY month ORDER BY month;

15. Display books which are under-stocked. (Quantity less than X)
select id, name from stock where quantity>0;
