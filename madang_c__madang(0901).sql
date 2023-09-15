select * from book;
-- book ���̺��� �����̶�� ���ڿ��� �����ϰ� ���������� 7000�� �̻��� ������ ���� �˻��Ͻÿ�.
select * from book where bookname like '%����%' and price >=7000;

-- book���̺��� ���ǻ簡 �½����� �Ǵ� ��ũ�ν��� ������ �˻��Ͻÿ�.
select * from book where publisher='�½�����' or publisher='��ũ�ν�';

-- book���̺��� ���ǻ簡 �½����� �Ǵ� ��ũ�ν��� ������ �˻��Ͻÿ�.(in ������ ���)
select * from book where publisher in('�½�����','��ũ�ν�');

-- book���̺��� ������ ������ �˻��Ͻÿ�.
select * from book order by bookname;

--book���̺��� ������ȣ������ �˻��Ͻÿ�.
select * from book order by bookid;

--book���̺��� ���ݼ����� �˻��� �ϰ� ���� �����̸� �̸������� �˻��Ͻÿ�.
select * from book order by price, bookname;

--book���̺��� ������ ������������ �˻��ϰ� ���� �����̸� ���ǻ������ �˻��Ͻÿ�.
select * from book order by price desc, bookname asc;

select * from orders;
--orders���̺��� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
--�����Լ� ���(�հ� : sum)
select sum(saleprice) as���Ǹűݾ� from orders;

--order ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ� from orders where custid=1;

--orders ���̺��� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ�, avg(saleprice) as �Ǹž����, min(saleprice) as ��������, max(saleprice) as �ִ밡�� from orders;

select * from orders;

-- orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�.
select count(*) as �Ǹŵ������� from(orders);
--orders ���̺��� ���������� 13000���̻��� å�� ������ ���Ͻÿ�.
select count(*) from orders where saleprice >= 13000;
--orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ�.
select count(*) from orders where custid in(1,3);

--orders ���̺��� ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�. 
select count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ� from orders group by custid order by custid;

--orders ���̺��� �ǸŰ����� 8000�� �̻��� ������ ������ ���� ���� ���� �ֹ� ������ �� ������ ���Ͻÿ�.
--�� 2���̻� ������ ���� ����Ͻÿ�.
select custid, count(*) as �������� from orders where saleprice>=8000 group by custid having count(*)>=2 order by custid;

--���缭���� ���� �䱸�ϴ� ���� ������ ���� sql ���� �ۼ��Ͻÿ�.
--������ȣ�� 1�� ������ �̸�
select bookname from book where bookid=1;
--������ 1���� �̻��� ������ �̸�
select bookname from book where price>=7000;
--�������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
select sum(saleprice) as �ѱ��ž� from orders where custid=1;
--�������� ������ ������ ��(�������� ����ȣ�� 1������ ���� �ۼ�
select count(custid) as �ѵ������� from orders where custid=1; 

--���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� sql ���� �ۼ��Ͻÿ�.
--���缭�� ������ �� ����
select count(bookname) as ������_��_���� from book;
--���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(DISTINCT publisher) as ���ǻ�_����  from book;
--��� ���� �̸�, �ּ�
select name, address from customer;
--23/01/01~23/04/01 ���̿� �ֹ� ���� ������ �ֹ���ȣ
select orderid from orders where orderdate between '23/01/01' and '23/04/01';
--23/01/01~23/04/01 ���̿� �ֹ� ���� ������ ������ �ֹ���ȣ
select orderid from orders where orderdate not between '23/01/01' and '23/04/01';
--���� �达�� ���� �̸��� �ּ�
select name,address from customer where name like '��%';
--���� �达�̰� �̸��� �Ʒ� ������ ���� �̸��� �ּ�
select name,address from customer where name like '��%��';

