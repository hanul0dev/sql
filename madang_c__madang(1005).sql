select custid, (select address
from customer c
where c.custid=o.custid)"address", sum(saleprice)"total"
from orders o
group by o.custid;

select c.name,s from(select custid,avg(saleprice) s from orders group by custid) o,customer c where c.custid=o.custid;


-- 주문을 한 고객별 이름, 평균 구매가격을 구하시오.
select cs.name, s
from (select custid, AVG(saleprice)s
from orders group by custid) od, customer cs
where cs.custid=od.custid;

 

-- 고객번호가 3보다 작은 고객의 판매금액의 합계를 구하시오.
select SUM(saleprice) "total"
from orders od
where exists (select * from customer cs
                where custid <= 3 and cs.custid=od.custid);


--책이름에 과학이라는 단어가 포함된 결과행을 출력하시오.
select * from book where bookname like '%과학%';

create view v_book as select * from book where bookname like '%과학%';

select * from customer;

--주소에 서울이라는 단어가 포함된 뷰를 생성하시오.
select * from customer where address like '%서울%';

create view vw_customer as select * from customer where address like '%서울%';

select * from vw_customer;


--주문테이블에서 고객이름, 도서이름을 바로 확인할 수 있는 뷰를 생성한 후,
--김연아 고객이 구입한 도서의 주문번호, 도서명, 주문액을 출력하시오

create view vw_orders(orderid, name, custid, bookid, bookname,saleprice,orderdate)
as select o.orderid,c.name,o.custid,o.bookid,b.bookname,o.saleprice,o.orderdate
from orders o,customer c,book b 
where o.custid=c.custid and o.bookid=b.bookid;
 

select * from vw_orders;

select orderid,bookname,saleprice from vw_orders where name='김연아';

--기존의 뷰를 수정한다.
create or replace view vw_custoemr(custid,name,address) as select custid, name,address from customer where address like '%영국%';


--1번
create view highorders as select od.bookid,bk.bookname,cs.name, bk.publisher,od.saleprice from customer cs,orders od,book bk where cs.custid=od.custid and od.bookid=bk.bookid and saleprice >=20000;
--2번
select bookname,name from highorders;
--3번
create or replace view highorders
as select od.bookid,bk.bookname,cs.name,bk.publisher
from customer cs,orders od,book bk
where cs.custid=od.custid and od.bookid=bk.bookid and saleprice>=20000;

--insertbook 프로시저 실행
exec insertbook(16, '스포츠과학','마당과학서적', 25000);

--
exec insertorupdate(17, '스포츠','과학서적', 30000);

set serveroutput on;
declare 
    averageVal number;
begin 
    averagePrice(averageVal);
    dbms_output.put_line('도서 평균 가격 : '||averageVal);
end;