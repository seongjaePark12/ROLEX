create table RolexNotice(
	idx int not null auto_increment,      	/* 게시글의 고유번호 */
	mid varchar(20) not null,								/* 아이디 */
	title varchar(100) not null,						/* 게시글의 글 제목	*/
	content text not null,									/* 글내용	*/
	wDate datetime not null default now(),	/* 글쓴 날짜 (현재)	*/
	readNum int default 0,									/* 글 조회수 */
	hostIp varchar(50) not null,						/* 접속 IP주소 */
	fName varchar(200) not null,				/* 업로드할때 파일명	*/
	fSName varchar(200) not null,				/* 파일 서버에 저장되는 실제 파일명	*/
	fSize int,													/* 총 파일 사이즈	*/
	primary key(idx)												/* 기본키 : 글 고유번호 */
);
drop table RolexNotice;
select * from RolexNotice;

show tables;

