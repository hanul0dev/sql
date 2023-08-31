insert into orders VALUES (1, 1, 1, 6000, TO_DATE('2023-01-10','yyyy-mm-dd'));
insert into orders VALUES (2, 1, 3, 21000, TO_DATE('2023-03-15','yyyy-mm-dd'));
insert into orders VALUES (3, 2, 7, 8000, TO_DATE('2023-11-07','yyyy-mm-dd'));
insert into orders VALUES (4, 3, 6, 6000, TO_DATE('2023-07-12','yyyy-mm-dd'));
insert into orders VALUES (5, 4, 7, 20000, TO_DATE('2023-07-07','yyyy-mm-dd'));
insert into orders VALUES (6, 1, 2, 12000, TO_DATE('2023-11-14','yyyy-mm-dd'));
insert into orders VALUES (7, 4, 8, 13000, TO_DATE('2023-08-28','yyyy-mm-dd'));
insert into orders VALUES (8, 3, 10, 12000, TO_DATE('2023-08-04','yyyy-mm-dd'));
insert into orders VALUES (9, 2, 10, 7000, TO_DATE('2022-10-29','yyyy-mm-dd'));
insert into orders VALUES (10, 3, 8, 13000, TO_DATE('2022-10-04','yyyy-mm-dd'));

insert into imported_book values(21,'Zen Golf','Person',12000);
insert into imported_book values(22,'Soccer Skills','Human Kinetics',15000);

select publisher, price FROM book where bookname like '�౸�� ����';

select phone from customer;

select name,phone from customer where name='�迬��';
select * from customer where name='�迬��';
--book���̺��� ������� ������ �˻��Ͻÿ�.
select bookname, price from book;
--book���̺��� ���ݰ� �������� �˻��Ͻÿ�.
select price, bookname from book;
--book���̺��� ������ȣ, ������, ���ǻ�, ������ �˻��Ͻÿ�.
select bookid,bookname,publisher, price from book;

select * from book;

--book���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.
select publisher from book;
--book���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.(�ߺ�����)
select distinct publisher from book;
--book���̺��� ������ 5000�� �̸��� ������ �˻��Ͻÿ�.
select * from book where price < 5000;

--book���̺��� ������ 2000�� �̻� 6000�� ������ ������ �˻��Ͻÿ�.
select * from book where price BETWEEN 2000 and 6000;

--book���̺��� ������ 2000�� �̻� 6000�� ������ ������ �˻��Ͻÿ�.(�� between and ���X)
select * from book where price>=2000 and price <=6000;

--book ���̺��� ���ǻ簡 �½�����, �س�, �ٻ�Ͻ� ������ �˻��Ͻÿ�.
--�� in ������ ���.
select * from book where publisher in('�½�����','�س�','�ٻ�Ͻ�');

--book ���̺��� ���ǻ簡 �½�����, �س�, �ٻ�Ͻ� ������ �˻��Ͻÿ�.
--�� in ������ ������� ���ÿ�.(�񱳿����ڿ� or ������ ���)
select * from book where publisher='�½�����' or publisher='�س�' or publisher='�ٻ�Ͻ�';

--book ���̺��� ���ǻ簡 �½�����, �س�, �ٻ�Ͻ� �ƴ� ������ �˻��Ͻÿ�.
--�� not in �����ڸ� ����Ͻÿ�.
select * from book where publisher not in('�½�����','�س�','�ٻ�Ͻ�');

--book ���̺��� ���ǻ簡 �½�����, �س�, �ٻ�Ͻ� �ƴ� ������ �˻��Ͻÿ�.
--�� in �����ڸ� ������� ���ÿ�.(�񱳿����ڿ� and ������ ���)
select * from book where publisher <>'�½�����' and publisher<>'�س�' and publisher<>'�ٻ�Ͻ�';