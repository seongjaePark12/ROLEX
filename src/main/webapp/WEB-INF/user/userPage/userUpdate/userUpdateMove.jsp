<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<jsp:include page="/include/lgCheck.jsp"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/css/UserUpdateCss.jsp"/>
	<jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<title>회원정보수정</title>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/userNav.jsp"/>
	<div class="container bg-white">
    <div class="bg-white" style=" text-align: center; width: 100%">
			<form name="myform"  style="display: inline-block; border: none;" method="post" action="${ctp}/userUpdateMoveOk.psj"  class="was-validated bg-white" >
	      <br><br>
	      <h1 class="font-weight-bold" >비밀번호입력</h1><br/>
	      <br/>
	        <div>
	          <label for="pwd"><b>비밀번호</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" required />
	        </div>
	        <br/>
	        <div>
	          <input style="text-align:center;" type="submit" id="joinbtn" value="확인" ><br/><br/>
	          <a href="${ctp}/userMyPage.psj"><input type="button" value="돌아가기"></a>
	        	<input type="hidden" name="mid" value="${sMid}"/>
	        </div>
	        <br/>
			</form>
    </div> 
  </div> 
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>