show tables;

create table RolexUser(
	idx int not null auto_increment,
	mid varchar(20) not null,								/* 아이디 */
	pwd varchar(50) not null,								/* 비밀번호 */
	name varchar(20) not null,							/* 이름	*/					
	birth datetime default now(),						/* 생년월일 */
	email varchar(50) not null,							/* 이메일 */
	getCode varchar(15) not null,						/* 전화번호 */
	address varchar(50),										/* 주소 */
	emailInfor char(6) default 'N',					/* 이메일체크 */
	userDel char(2) default 'NO',						/* 회원 탈퇴 신청 여부(OK:탈퇴신청한회원, NO: 현재가입중인회원)	*/
	point int default 3000,									/* 포인트(최초가입회원은 3000, 한번 방문시마다 50)	*/
	level	int default 1,										/* 1:일반, 2:VIP, 3:VVIP, 4:운영자, 0:관리자	*/
	visitCnt int default 0,									/* 방문횟수 */
	startDate datetime default now(),				/* 최초 가입일 */
	lastDate datetime default now(),				/* 마지막 접속일 */
	todayCnt int default 0,									/* 오늘 방문한 횟수	*/
	primary key(idx, mid)										/* 기본키 : 고유번호,아이디	*/
);

desc RolexUser;
--drop table RolexUser;
select * from RolexUser;

select mid from RolexUser where name='관리자' and email='qkrtjdwo337@naver.com';
update RolexUser set pwd = '16708374', pwdKey=9 where mid = 'admin';

create table hashTable(
	pwdKey int not null,						/* 비밀번호 키 */
	pwdValue varchar(30) not null		/* 비밀번호 값	*/
);

insert into hashTable values (0,'12123434');
insert into hashTable values (1,'25234534');
insert into hashTable values (2,'36345656');
insert into hashTable values (3,'67456786');
insert into hashTable values (4,'78567825');
insert into hashTable values (5,'69678976');
insert into hashTable values (6,'70789089');
insert into hashTable values (7,'12121245');
insert into hashTable values (8,'23232345');
insert into hashTable values (9,'34443414');
insert into hashTable values (10,'45454515');
insert into hashTable values (11,'56565686');
insert into hashTable values (12,'67676778');
insert into hashTable values (13,'78787864');
insert into hashTable values (14,'89898964');
insert into hashTable values (15,'90009075');
insert into hashTable values (16,'21212178');
insert into hashTable values (17,'32323289');
insert into hashTable values (18,'43434345');
insert into hashTable values (19,'55545476');