<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/css/UserLoginCss.jsp"/>
	<title>아이디 찾기</title>
</head>
<body>
	<div class="Form my-4 mx-5">
    <div class="container">
      <div class="row no-gutters">
        <div class="col-lg-3">
        </div>
        <div class="col-lg-6">
        	<div align="center"><a href="${ctp}/" id="login1"><img src="${ctp}/images/로고1.png" id="imgimg"></a></div>
          <h1 class="font-weight-bold py-3 mt-3 ml-3" id="lolo">${message}</h1><br/><br/><br/>
            <div align="center">
              <a href="${ctp}/idFind.psj">아이디를 잊으셨나요?</a>  
            </div>
            <div align="center">
              <a href="${ctp}/userLogin.psj">로그인</a>&nbsp;&nbsp;/&nbsp;&nbsp;
              <a href="${ctp}/userJoin.psj">회원가입</a>
            </div>
         </div>
      </div>
    </div>
  </div>
</body>
</html>