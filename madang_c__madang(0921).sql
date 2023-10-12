--�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸��� ����Ͻÿ�.

--�������� ������ ������ ���ǻ��̸��� ����Ͻÿ�.

select publisher from customer cs, orders os,book bs 
where cs.custid=os.custid and os.bookid=bs.bookid 
and name like '������';

select name from customer cs, orders os, book bs 
where cs.custid=os.custid and os.bookid=bs.bookid 
and name not like '������' and publisher in(
                                        select publisher from customer cs, orders os,book bs 
                                        where cs.custid=os.custid and os.bookid=bs.bookid 
                                        and name like '������');
                                        
--�ΰ� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸��� ����Ͻÿ�.
select name from customer cm
where (select count(distinct publisher)from customer c,orders o,book b
where c.custid=o.custid and o.bookid=b.bookid
and name like cm.name)>=2;

--���� 30%�̻��� ������ �������� ����Ͻÿ�.
select bookname from book bm
where (select count(b.bookid) from book b, orders o
        where b.bookid=o.bookid and b.bookid=bm.bookid)
        >=(select count(*) from customer)*0.3;
        
--���ο� ����(����������,���ѹ̵��,10000)�� ���缭���� �԰�Ǿ���.
--������ ���� �߰��Ͻÿ�.
--���� ������ ���� �ʴ´ٸ� ������ �����Ͱ� �ִ��� Ȯ���غ���.
insert into book values(15,'������ ����','���ѹ̵��',10000);

--���̿����� ������ ������ �����Ͻÿ�.
delete from book
where publisher like '���̿�';

select * from book;

--'�س�'���� ������ ������ �����Ͻÿ�.
--���� �������� �ʴ´ٸ� �����޽����� Ȯ���� ������.
delete from book
where publisher like '�س�';

--���Ἲ ���������� ����Ǿ����ϴ�~ orders ���̺��� �ڽ� ���ڵ尡 ����Ǿ����ϴ�.
--���� '�س�'���ǻ��� ���������� ������ �� ����.

--���ǻ�'���ѹ̵��'��'�������ǻ�'�� �̸��� �����Ͻÿ�.
update book set publisher='�������ǻ�'
where publisher like '���ѹ̵��';


-----------------------------------------------------------------------------

--�����Լ� / �μ����� / �� / �ε���

--abs : ���밪 ���ϴ� �Լ�
select abs(-33),abs(33) from dual;

--5.657�� �Ҽ� ù°�ڸ����� �ݿø��� ���� ���Ͻÿ�.
select round(5.657,1) from dual;

--���� ��� �ֹ��ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�.
select custid "����ȣ",round(avg(saleprice),-2) "��ձݾ�" from orders
group by custid;

-- ������  '����'�� ���Ե� ������ '����'���� �����Ͽ� ����Ͻÿ�
-- ����  book���̺��� ���� �����͸� �����ϸ� �ȵȴ�.
select bookid, replace (bookname, '����', '����') bookname, publisher, price from book;

-- ���ǻ簡 '�س�'�� �������� ���ڼ��� ����Ʈ���� ����Ͻÿ�.
select bookname "������", length(bookname) "���ڼ�", lengthb(bookname) "����Ʈ��" from book
where publisher like '�س�';

--���߿��� ���� ������ ���� ����� ������� ������ �ο����� ����Ͻÿ�.
select substr(name,1,1) "����", count(*) "�ο���" from customer
group by substr(name,1,1);

--������ �ֹ�Ȯ������ �ֹ��Ϸκ��� 10�����̴�. �ֹ���ȣ, �ֹ���, �ֹ�Ȯ������ ����Ͻÿ�.
select orderid, orderdate �ֹ���,orderdate+10 �ֹ�Ȯ���� from orders;

--2023/8/28�� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ����Ͻÿ�.
--��, �ֹ����� "yyyy�� mm�� dd��"�� ���� format���� ǥ���Ͻÿ�.

select orderid �ֹ���ȣ, to_char(orderdate,'yyyy-mm-dd') �ֹ���, custid ����ȣ, bookid ������ȣ
from orders
where orderdate=to_date('20230828','yyyymmdd');

--2023/8/28�� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����, ������ ��� ����Ͻÿ�.
--��, �ֹ����� "yyyy�� mm�� dd��"�� ���� format���� ǥ���Ͻÿ�.
select orderid �ֹ���ȣ, to_char(orderdate,'yyyy-mm-dd') �ֹ���, name ����, bookname ������ȣ
from orders o,book b,customer c
where c.custid=o.custid and o.bookid=b.bookid
and orderdate=to_date('20230828','yyyymmdd');

--DB������ ������ ��¥�� �ð� ������ ����Ͻÿ�.
--���� ��ȯ���� ��¥�� ������ ������(�⵵4�ڸ�/��2�ڸ�/��2�ڸ� ������ ���� , ��:��:��) ��¥�� �ð� 2���� ���

select sysdate ������ȯ�Ȱ�, to_char(sysdate,'yyyy/mm/dd dy hh24:mi:ss') �������ĳ�¥�׽ð� from dual;