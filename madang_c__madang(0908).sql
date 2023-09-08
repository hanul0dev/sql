--집합연산자 : 합집합(union),차집합(minus),교집합(intersect)
--차집합 연산자 사용
--도서를 주문하지 않은 고객의 이름을 쓰시오.
select name from customer;
select distinct custid from orders;
select name from customer where custid in(select custid from orders);

-- 차집합 연산자 사용한 경우
select name from customer mnus select nam from cstomer where custid in(select distinct custid from orders);

--집합자 연산자 사용하지 않은 경우
select name from customer where custid not in(select distinct custid from orders);

--exists : 서브쿼리의 결과가 존재하는 경우에 true 
--주문이 있는 고객의 이름과 주소를 출력하시오.
select name, address from customer where custid no in9select distinct custidfrom orders);

select distinct name, address from customer c, orders o, where c.custid=o.custid

- Exists 사용한 경우
select distinct name, address from customer c, orders o where exists (select * from orders where c.custid=o.custid);

--1. 마당서점의 고객이 요구하는 다음 질문에 대해 sql문을 작성하시오.
--박지성이 구매한 도서의 출판사 수
select count(publisher) from book b,orders o where b.bookid=o.bookid and o.custid=1;
--박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select bookname, price, saleprice from book b,orders o,customer c where b.bookid = o.bookid and o.custid = c.custid and c.name = '박지성';
--박지성이 구매하지 않은 도서의 이름
select DISTINCT bookname from book b,orders o,customer c where b.bookid = o.bookid and c.custid = o.custid and c.name != '박지성';


--2. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 sql 문을 작성하시오. 
--주문하지 않은 고객의 이름(부속질의 사용)
SELECT NAME FROM CUSTOMER WHERE CUSTID NOT IN (SELECT CUSTID FROM ORDERS);
--주문 금액의 총액과 주문의 평균 금액
SELECT SUM(SALEPRICE), AVG(SALEPRICE) FROM ORDERS;
--고객의 이름과 고객이 구매한 도서 목록
SELECT CUSTOMER.NAME, BOOK.BOOKNAME FROM BOOK, CUSTOMER, ORDERS WHERE BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.CUSTID = ORDERS.CUSTID;
--도서의 가격(book테이블)과 판매가격(orders 테이블)의 차이가 가장 많은 주문
SELECT ORDERS.* FROM BOOK, ORDERS WHERE BOOK.BOOKID = ORDERS.BOOKID AND BOOK.PRICE - ORDERS.SALEPRICE = (SELECT MAX(BOOK.PRICE-ORDERS.SALEPRICE) FROM BOOK, ORDERS WHERE BOOK.BOOKID = ORDERS.BOOKID); 
--도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
SELECT NAME FROM CUSTOMER, ORDERS WHERE CUSTOMER.CUSTID = ORDERS.CUSTID GROUP BY NAME HAVING AVG(SALEPRICE) > (SELECT AVG(ORDERS.SALEPRICE) FROM ORDERS);

--DDL : 데이터정의어
-- create / alter / drop
-- 테이블 생성1
create table newbook1(
    bookid number, bookname varchar2(20),publisher varchar2(20),price number
);

--테이블 생성2
--primary key 설정법1
create table newbook2(
    bookid number, bookname varchar2(20),publisher varchar2(20),price number,PRIMARY KEY(bookid)
);

--테이블 생성3
--primary key 설정법2
create table newbook3(
    bookid number primary key, bookname varchar2(20),publisher varchar2(20),price number
);

--bookname 컬럼 : null값 가질 수 없음
--publisher 컬럼 : 동일한 값을 가질 수 없음
--price 컬럼 : 가격이 입력되어 있지 않으면 기본값을 1000으로하고 입력될 때는 1000초과로 함
--bookname, publisher 컬럼을 복합키로 설정

create table newbook4(
    bookname varchar(20) not null, publisher varchar(20) unique, price number default 1000 check(price>1000), primary key(bookname,publisher)
);