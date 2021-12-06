<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>wmInput</title>
  <%@ include file="/include/bs4.jsp" %>
  <script>
  	function fCheck(){
  		var receiveId = myform.receiveId.value;
  		var title = myform.title.value;
  		var content =myform.content.value;
  		
  		if(receiveId == ""){
  			alert("받는사람 아이디 입력해");
  			myform.receiveId.focus();
  		}
  		else if(title == ""){
  			alert("제목 입력해");
  			myform.title.focus();
  		}
  		else if(content == ""){
  			alert("내용 입력해");
  			myform.content.focus();
  		}
  		else{
  			myform.submit();
  		}
  	}
  </script>
</head>
<body>
	<div class="container">
		<form name="myform" method="post" action="${ctp}/wmInputOk.wm">
			<table class="table table-borderless">
				<tr>
					<th>보내는 사람</th>
					<td><input class="form-control" type="text" name="sendId" value="${sMid}" readonly /></td>
				</tr>
				<tr>
					<th>받는사람</th>
					<td>
						<c:if test="${sLevel == 1 ||sLevel == 2 ||sLevel == 3 ||sLevel == 4 ||sLevel == 5}">
							<input class="form-control" type="text" name="receiveId" value="admin" readonly />
						</c:if>
						<c:if test="${sLevel == 0 }">
							<input class="form-control" type="text" name="receiveId" value="${param.receiveId}" placeholder="받는사람 아이디" />
						</c:if>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input class="form-control" type="text" name="title" placeholder="제목을 입력하세요"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="5" name="content" class="form-control"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<input type="button" value="전송" onclick="fCheck()" class="btn btn-warning"/>
						<input type="reset" value="다시쓰기" class="btn btn-warning"/>
						<input type="button" onclick="history.back();" value="돌아가기" class="btn btn-warning"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br/>	
</body>
</html>