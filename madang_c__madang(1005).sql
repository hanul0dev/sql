select custid, (select address
from customer c
where c.custid=o.custid)"address", sum(saleprice)"total"
from orders o
group by o.custid;

select c.name,s from(select custid,avg(saleprice) s from orders group by custid) o,customer c where c.custid=o.custid;


-- �ֹ��� �� ���� �̸�, ��� ���Ű����� ���Ͻÿ�.
select cs.name, s
from (select custid, AVG(saleprice)s
from orders group by custid) od, customer cs
where cs.custid=od.custid;

 

-- ����ȣ�� 3���� ���� ���� �Ǹűݾ��� �հ踦 ���Ͻÿ�.
select SUM(saleprice) "total"
from orders od
where exists (select * from customer cs
                where custid <= 3 and cs.custid=od.custid);


--å�̸��� �����̶�� �ܾ ���Ե� ������� ����Ͻÿ�.
select * from book where bookname like '%����%';

create view v_book as select * from book where bookname like '%����%';

select * from customer;

--�ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�.
select * from customer where address like '%����%';

create view vw_customer as select * from customer where address like '%����%';

select * from vw_customer;


--�ֹ����̺��� ���̸�, �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��,
--�迬�� ���� ������ ������ �ֹ���ȣ, ������, �ֹ����� ����Ͻÿ�

create view vw_orders(orderid, name, custid, bookid, bookname,saleprice,orderdate)
as select o.orderid,c.name,o.custid,o.bookid,b.bookname,o.saleprice,o.orderdate
from orders o,customer c,book b 
where o.custid=c.custid and o.bookid=b.bookid;
 

select * from vw_orders;

select orderid,bookname,saleprice from vw_orders where name='�迬��';

--������ �並 �����Ѵ�.
create or replace view vw_custoemr(custid,name,address) as select custid, name,address from customer where address like '%����%';


--1��
create view highorders as select od.bookid,bk.bookname,cs.name, bk.publisher,od.saleprice from customer cs,orders od,book bk where cs.custid=od.custid and od.bookid=bk.bookid and saleprice >=20000;
--2��
select bookname,name from highorders;
--3��
create or replace view highorders
as select od.bookid,bk.bookname,cs.name,bk.publisher
from customer cs,orders od,book bk
where cs.custid=od.custid and od.bookid=bk.bookid and saleprice>=20000;

--insertbook ���ν��� ����
exec insertbook(16, '����������','������м���', 25000);

--
exec insertorupdate(17, '������','���м���', 30000);

set serveroutput on;
declare 
    averageVal number;
begin 
    averagePrice(averageVal);
    dbms_output.put_line('���� ��� ���� : '||averageVal);
end;