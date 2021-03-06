<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
	String url = (String) request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="../../include/bs4.jsp" %>
	<title>title</title>
	  <script>
  	var msg = "<%=msg%>";
  	var url = "<%=url%>";
  	var val = "${val}";
  	
  	if(msg == "userJoinOk") msg = "회원가입이 완료되었습니다";
  	else if(msg == "userJoinNo") msg = "다시 시도해주세요";
  	else if(msg == "userLoginNo") msg = "아이디 또는 비밀번호를 확인해주세요";
  	else if(msg == "userLoginOk") msg = val+"님 로그인되었습니다";
  	else if(msg == "userberLoginPwdNo") msg = "아이디 또는 비밀번호를 확인해주세요";
  	else if(msg == "idCheckNo") msg = "중복된 아이디입니다";
  	else if(msg == "userLogOutOk") msg = "로그아웃 되었습니다";
  	else if(msg == "userDeleteOk") msg = "회원 탈퇴 되었습니다";
  	else if(msg == "userUpdateOk") msg = "정보가 수정 되었습니다";
  	else if(msg == "userUpdateNo") msg = "다시 시도해주세요";
  	else if(msg == "UserLevelChangeOk") msg = "등급이 변경되었습니다";
  	else if(msg == "UserResetOk") msg = "회원정보가 DB에서 삭제 되었습니다";
  	else if(msg == "NoticeInputOk") msg = "공지사항이 등록되었습니다";
  	else if(msg == "NoticeInputNo") msg = "공지사항을 다시 등록해주세요";
  	else if(msg == "NoticeDeleteOk") msg = "삭제되었습니다";
  	else if(msg == "NoticeDeleteNo") msg = "다시 시도해주세요";
  	else if(msg == "noticeUpdateOk") msg = "수정완료";
  	else if(msg == "QuestionInputOk") msg = "문의가 등록되었습니다";
  	else if(msg == "QuestionInputNo") msg = "다시 시도해주세요";
  	else if(msg == "QuestionUpdateOk") msg = "문의내용이 수정되었습니다";
  	else if(msg == "QuestionUpdateNo") msg = "다시 시도해주세요";
  	else if(msg == "noticeUpdateNo") msg = "다시 시도해주세요";
  	else if(msg == "SimpleDeleteOk") msg = "삭제되었습니다";
  	else if(msg == "SimpleDeleteNo") msg = "다시 시도해주세요";
  	else if(msg == "SimpleInputOk") msg = "등록되었습니다";
  	else if(msg == "SimpleInputNo") msg = "다시 시도해주세요";
  	else if(msg == "passwordUpdateOk") msg = "비밀번호가 변경 되었습니다";
  	else if(msg == "passwordUpdateNo") msg = "비밀번호 변경 실패";
  	else if(msg == "bookingMainContentOk") msg = "예약 되었습니다";
  	else if(msg == "bookingMainContentNo") msg = "다시 예약해주세요";
  	else if(msg == "bookingDeleteOk") msg = "예약이 취소 되었습니다";
  	else if(msg == "bookingDeleteNo") msg = "다시 시도해주세요";
  	else if(msg == "userpwdOk") msg = "확인되었습니다";
  	else if(msg == "userpwdNo") msg = "비밀번호가 다릅니다";
  	else if(msg == "wmInputOk") msg = "전송 완료";
  	else if(msg == "wmInputNo") msg = "전송 실패";
  	else if(msg == "wmDeleteOk") msg = "삭제 성공";
  	else if(msg == "wmDeleteNo") msg = "삭제 실패";
  	else if(msg == "loginGo") msg = "로그인 후 이용해 주세요";
  	
  	alert(msg);
  	if(url != "") location.href = url;
  </script>
</head>
<body>
	
</body>
</html>