--���տ����� : ������(union),������(minus),������(intersect)
--������ ������ ���
--������ �ֹ����� ���� ���� �̸��� ���ÿ�.
select name from customer;
select distinct custid from orders;
select name from customer where custid in(select custid from orders);

-- ������ ������ ����� ���
select name from customer mnus select nam from cstomer where custid in(select distinct custid from orders);

--������ ������ ������� ���� ���
select name from customer where custid not in(select distinct custid from orders);

--exists : ���������� ����� �����ϴ� ��쿡 true 
--�ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�.
select name, address from customer where custid no in9select distinct custidfrom orders);

select distinct name, address from customer c, orders o, where c.custid=o.custid

- Exists ����� ���
select distinct name, address from customer c, orders o where exists (select * from orders where c.custid=o.custid);

--1. ���缭���� ���� �䱸�ϴ� ���� ������ ���� sql���� �ۼ��Ͻÿ�.
--�������� ������ ������ ���ǻ� ��
select count(publisher) from book b,orders o where b.bookid=o.bookid and o.custid=1;
--�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select bookname, price, saleprice from book b,orders o,customer c where b.bookid = o.bookid and o.custid = c.custid and c.name = '������';
--�������� �������� ���� ������ �̸�
select DISTINCT bookname from book b,orders o,customer c where b.bookid = o.bookid and c.custid = o.custid and c.name != '������';


--2. ���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� sql ���� �ۼ��Ͻÿ�. 
--�ֹ����� ���� ���� �̸�(�μ����� ���)
SELECT NAME FROM CUSTOMER WHERE CUSTID NOT IN (SELECT CUSTID FROM ORDERS);
--�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
SELECT SUM(SALEPRICE), AVG(SALEPRICE) FROM ORDERS;
--���� �̸��� ���� ������ ���� ���
SELECT CUSTOMER.NAME, BOOK.BOOKNAME FROM BOOK, CUSTOMER, ORDERS WHERE BOOK.BOOKID = ORDERS.BOOKID AND CUSTOMER.CUSTID = ORDERS.CUSTID;
--������ ����(book���̺�)�� �ǸŰ���(orders ���̺�)�� ���̰� ���� ���� �ֹ�
SELECT ORDERS.* FROM BOOK, ORDERS WHERE BOOK.BOOKID = ORDERS.BOOKID AND BOOK.PRICE - ORDERS.SALEPRICE = (SELECT MAX(BOOK.PRICE-ORDERS.SALEPRICE) FROM BOOK, ORDERS WHERE BOOK.BOOKID = ORDERS.BOOKID); 
--������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
SELECT NAME FROM CUSTOMER, ORDERS WHERE CUSTOMER.CUSTID = ORDERS.CUSTID GROUP BY NAME HAVING AVG(SALEPRICE) > (SELECT AVG(ORDERS.SALEPRICE) FROM ORDERS);

--DDL : ���������Ǿ�
-- create / alter / drop
-- ���̺� ����1
create table newbook1(
    bookid number, bookname varchar2(20),publisher varchar2(20),price number
);

--���̺� ����2
--primary key ������1
create table newbook2(
    bookid number, bookname varchar2(20),publisher varchar2(20),price number,PRIMARY KEY(bookid)
);

--���̺� ����3
--primary key ������2
create table newbook3(
    bookid number primary key, bookname varchar2(20),publisher varchar2(20),price number
);

--bookname �÷� : null�� ���� �� ����
--publisher �÷� : ������ ���� ���� �� ����
--price �÷� : ������ �ԷµǾ� ���� ������ �⺻���� 1000�����ϰ� �Էµ� ���� 1000�ʰ��� ��
--bookname, publisher �÷��� ����Ű�� ����

create table newbook4(
    bookname varchar(20) not null, publisher varchar(20) unique, price number default 1000 check(price>1000), primary key(bookname,publisher)
);