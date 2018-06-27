drop table board5

create table board5(
   board_num number(38) primary key,            
   board_name varchar2(30) not null,     
   board_pass varchar2(30) not null,     
   board_subject varchar2(300) not null, 
   board_content varchar2(4000) not null,
   board_re_ref number,         
   board_re_lev number,         
   board_re_seq number,      
   board_readcount number,       
   board_date date 
);
   
select * from board5;

create sequence board5_num_seq increment by 1 start with 1 nocache;

select * from (select rownum rnum, BOARD_NUM, BOARD_NAME, BOARD_SUBJECT,
					BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ from 
						(select * from board order by BOARD_RE_REF desc, BOARD_RE_SEQ asc)
					) where rnum>=1 and rnum<=12;
					
delete from board5 where BOARD_NUM=0;

select BOARD_NUM, BOARD_NAME, BOARD_SUBJECT, 
		BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, 
		BOARD_RE_SEQ, BOARD_READCOUNT, DDATE from 
		(select rownum rnum, BOARD_NUM, BOARD_NAME, BOARD_SUBJECT, 
		BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, 
		BOARD_RE_SEQ, BOARD_READCOUNT, TO_CHAR(BOARD_DATE, 'YYYY-MM-DD HH24:MI:SS') as DDATE from 
		(select * from board order by BOARD_RE_REF desc, BOARD_RE_SEQ asc)) 
		where rnum >= 1 and rnum <= 10
		
create sequence board_seq 