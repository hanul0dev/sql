
set serveroutput on;
exec interest;

create table book_log(
    bookid_l number,
    bookname_1 varchar2(40),
    publisher_1 varchar2(40),
    price_l number
);