create table booking(
	idx int not null auto_increment primary key, /* 고유번호	*/
	mid varchar(20) not null, 									 /* 회원 고유 아이디	*/
	name varchar(20) not null, 									 /* 회원 이름 	*/
	booDate datetime not null default now(),     /* 예약 날짜	*/
	bootime varchar(10) not null,								 /* 시간 */
	content varchar(10) not null								 /* 분류 (상담/시계구매/AS/기타)	*/
);

drop table booking;
select * from booking;
desc booking;