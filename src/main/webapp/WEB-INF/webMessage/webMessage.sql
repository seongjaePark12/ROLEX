show tables;

create table webMessage(
	idx int not null auto_increment primary key,	/* 고유번호	*/
	title varchar(100) not null,									/* 메세지 제목	*/
	content text not null,												/* 메세지 내용	*/
	sendId varchar(20) not null,									/* 보내는 사람 아이디	*/
	sendSw char(1) not null,											/* 보낸 메세지(s),휴지통(g), 휴지통삭제(x) 표시	*/
	sendDate datetime default now(),							/* 메세지 보낸 날짜	*/
	receiveId varchar(20) not null, 							/* 받는 사람 아이디 */
	receiveSw char(1) not null,										/* 받은 새메세지(n), 읽은메세지(r), 휴지통(g), 휴지통삭제(x) 표시	*/
	receiveDate datetime default now()						/* 메세지 받은 날짜	*/
);

drop table webMessage;
desc webMessage;
select * from webMessage;
insert into webMessage values(default,'안녕하세요','메세지태스트','hkd1234','s',default,'asdasd','n',default);
insert into webMessage values(default,'테스트완료','성공?','asdasd','s',default,'hkd1234','n',default);