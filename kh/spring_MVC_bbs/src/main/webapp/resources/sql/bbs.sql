drop table bbs6

create table bbs6(
	bbs_num number(38) primary key,
   	bbs_name varchar2(50) not null,
  	bbs_pass varchar2(30) not null,
   	bbs_subject varchar2(100) not null,
   	bbs_content varchar2(4000) not null,
   	bbs_file varchar2(100),
   	bbs_re_ref number,
   	bbs_re_lev number,
   	bbs_re_seq number,
   	bbs_readcount number,
   	bbs_date date,
   	bbs_original varchar2(100)
)

select * from bbs6

create sequence bbs6_num_seq
increment by 1 start with 1

drop sequence bbs6_num_seq

select * from 
			(select rownum rnum, bbs_num, bbs_name, bbs_pass, bbs_subject, 
       			bbs_content, bbs_file, bbs_re_ref, bbs_re_lev, 
       			bbs_re_seq, bbs_readcount, bbs_date, bbs_original from 
			(select * from bbs6 order by bbs_re_ref desc, bbs_re_seq asc) 
			where bbs_subject like '%2%')
			where rnum >= 11 and rnum <= 20
			
select * from member;