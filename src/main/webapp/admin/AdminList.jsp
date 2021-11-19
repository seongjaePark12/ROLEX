<%@page import="UserLoginJoin.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="UserLoginJoin.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%

	UserDAO dao = new UserDAO();
	
	ArrayList<UserVO> vos = dao.loginList();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="../include/bs4.jsp" %>
	<%@ include file="../js/mainJs.jsp" %>
	<%@ include file="../css/mainCss.jsp" %>
	<title>회원리스트</title>
	<script>
		function delCheck(){
			var ans = confirm("정말 탈퇴하시겠습니까?");
			if(ans){
				location.href="<%=t(request.getContextPath%>/UserDel";				
			}
		}
		
		function allCheck(one) {
			  let seasonLen = document.myform.one.length;
			  let all = document.myform.all.value;

			  if(one.checked) {
			    for(var i=0; i<seasonLen; i++) {
			      myform.one[i].checked = true;
			    }
			  }
			  else {
			    for(var i=0; i<seasonLen; i++) {
			      myform.one[i].checked = false;
			    }
			  }
			}
	</script>
</head>
<body>
	<%@ include file="../include/adminHeader.jsp" %>
	<%@ include file="../include/adminNav.jsp" %>	
	<div class="w3-container">
	  <div class="font1" align="center">MEMBER</div>
	  <div><a href="javascript:delCheck()" class="btn btn-warning">회원 탈퇴</a></div>
		<form name="myform">
			<table class="table table-hover">
				<tr class="font2">
					<th><input type="checkbox" name="all" onclick="allCheck(this)" />전체</th>
					<th>번호</th>
					<th>아이디</th>
					<th>성명</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>최종 접속일</th>
					<th>방문횟수</th>
					<th>포인트</th>
				</tr>
<%
p

	UserVO vo = new UserVO();
	for(int i=0; i<vos.size(); i++){
		vo = vos.get(i);
%>			
				<tr>
					<td><input type="checkbox" name="one" onclick="onCheck(this)" /></td>
					<td><%=vo.getIdx() %></td>
					<td><%=vo.getMid() %></td>
					<td><%=vo.getName() %></td>
					<td><%=vo.getBirth() %></td>
					<td><%=vo.getEmail() %></td>
					<td><%=vo.getGetCode() %></td>
					<td><%=vo.getLastDate() %></td>
					<td><%=vo.getvCount() %></td>
					<td><%=vo.getPoint() %></td>
				</tr>
<% } %>
			</table>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>