<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	String mid = (String)request.getAttribute("mid");
	int res = (int) request.getAttribute("res");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/cilckNo.jsp"/>
	<title>아이디체크</title>
	<script>
  	function sendCheck(){
  		opener.window.document.myform.mid.value = "<%=mid%>";
  		opener.window.document.myform.pwd.focus();
  		window.close();
  	}
  	function idCheck(){
  		var mid = childForm.mid.value;
  		
  		if(mid == ""){
  			alert("아이디를 입력하세요");
  			childForm.mid.focus();
  		}
  		else{
  			childForm.submit();
  		}
  	}
	</script>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<div class="container">
		<h3 style="text-align: center;">아이디 체크</h3>
		<%if(res == 1){ %>
			<h5 style="text-align: center;"><font color="red"><%=mid %></font>아이디는 사용가능 합니다</h5>
			<div align="center"><input  type="button" class="btn-warning" value="사용하기" onclick="sendCheck()"/></div>
		<%}else{ %>
			<h5 style="text-align: center;"><font color="red"><%=mid %></font>중복된 아이디 입니다</h5>
			<form align="center" name="childForm" method="post" action="${ctp}/midCheck.psj">
				<input type="text" name="mid"/>
				<input class="btn-warning" type="button" value="아이디검색" onclick="idCheck()"/>
			</form>	
		<%} %>	
	</div>
</body>
</html>