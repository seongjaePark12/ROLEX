create table question(
	idx int not null auto_increment primary key,
	name varchar(20) not null,
	title varchar(100) not null,
	vDate datetime default now(),
	vCount int default 0,
	content text not null
);


insert into question values(default,'관리자','첫 공지사항',default,default,'안녕하세요');

select * from question;