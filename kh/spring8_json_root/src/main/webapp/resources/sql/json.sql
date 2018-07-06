drop table products

create table products(
id number(11),
name varchar2(50),
modelnumber varchar2(15),
series varchar2(30)
)

create sequence products_id_seq 
increment by 1 start with 2 nocache;
select products_id_seq.nextval from dual
select products_id_seq.currval from dual

select * from products
commit
SELECT products_id_seq.nextval FROM DUAL
select * from products where id = products_id_seq.currval
select * from products order by id asc
delete products
insert into products values(1,'갤럭시S9','9999','삼성 플래그쉽')