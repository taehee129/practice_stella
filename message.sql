select * from message;
insert into message values(1, 'teahee', 'ù��', '�ȳ�',sysdate); 

drop table member;
create table member(
	 mnum int primary key,
	mid varchar(15) not null,
	mpw varchar(15) not null
)

insert into member values((select nvl(max(mnum),0)+1 from member),'taehee129','1234');
select * from member;

select * from member where mid='taehee129' and mpw='1234';
insert into message values(2, 'tae', '�׽�Ʈ', '�ȳ�',sysdate); 
insert into message values(1, 'taehee129', 'MVC ����', '�ȳ�',sysdate); 