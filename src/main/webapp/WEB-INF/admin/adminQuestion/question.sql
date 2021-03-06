create table RolexQuestion(
	idx int not null auto_increment,      	/* 게시글의 고유번호 */
	mid varchar(20) not null,								/* 아이디 */
	title varchar(100) not null,						/* 게시글의 글 제목	*/
	what varchar(20) not null,							/* 문의유형	*/
	content text not null,									/* 글내용	*/
	wDate datetime not null default now(),	/* 작성일 */
	hostIp varchar(50) not null,						/* 접속 IP주소 */
	primary key(idx)												/* 기본키 : 글 고유번호 */
);
drop table RolexQuestion;
select * from RolexQuestion;

select * from replyQuestion;
drop table replyQuestion;
create table replyQuestion (
	idx int not null auto_increment primary key, 	/* 댓글의 고유번호	*/
	questionIdx int not null,												/* 원본글의 고유번호(외래키지정)	*/
	mid varchar(20) not null,											/* 올린이의 아이디	*/
	wDate datetime default now(),									/* 댓글 기록 날짜	*/
	hostIp varchar(50) not null,									/* 댓글쓴 PC의 IP	*/
	content text not null,												/* 댓글 내용	*/
	foreign key(questionIdx) references RolexQuestion(idx) 
	on update cascade
	on delete restrict
);
