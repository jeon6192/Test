drop table member;

create table member(
	id					varchar2(15),
	password		varchar2(10),
	name			varchar2(15),
	age				Number,
	gender			varchar2(5),
	email				varchar2(30),
	primary key(id)
);

select * from member;

alter table member modify(gender varchar2(10));

update member set name='관리자', gender='남자' where id='admin'

update member set name = '관리자', age = 1, gender = '남자', email = 'admin@naver.com' where id = 'admin'