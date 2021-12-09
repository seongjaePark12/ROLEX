<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/cilckNo.jsp"/>
	<jsp:include page="/css/UserLoginCss.jsp"/>
	<title>새 비밀번호 입력</title>
	<script>
		function fCheck(){
			var password = myform.password.value;
			var passwordOk = myform.passwordOk.value;
			
			if(password == "" || passwordOk == "" || password != passwordOk){
				alert("비밀번호를 확인하세요");
				myform.password.focus();
				return;
			}
			else if(password.length < 8 || password.length > 16){
   			alert("비밀번호는 8~16자까지 입력가능합니다");
   			myform.password.value = "";
   			return;
			}
			else{
				myform.submit();
			}
		}
	</script>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<div class="Form my-4 mx-5">
    <div class="container">
      <div class="row no-gutters">
        <div class="col-lg-3">
        </div>
        <div class="col-lg-6">
        	<div align="center"><a href="${ctp}/" id="login1"><img src="${ctp}/images/로고1.png" id="imgimg"></a></div>
          <h1 class="font-weight-bold py-3 mt-3 ml-3" id="lolo">${message}</h1><br/><br/><br/>
            <form name="myform" method="post" action="${ctp}/passwordInputOk.psj">
            	<c:if test="${passwordFind != ''}">
            	<div class="col-lg-12">
	              <div>
	                <input type="password" class="form-control" name="password" id="password" placeholder="새 비밀번호를 입력해주세요" autofocus required />
	              	<div class="valid-feedback">Valid.</div>
	                <div class="invalid-feedback">비밀번호를 입력해주세요</div>
	              </div>
	              <br>
	              <div>
	                <input type="password" class="form-control" name="passwordOk" id="passwordOk" placeholder="새 비밀번호 확인" autofocus required />
	              	<div class="valid-feedback">Valid.</div>
	                <div class="invalid-feedback">비밀번호를 입력해주세요</div>
	              </div>
              </div>
              <div class="col-lg-12" align="center">
                <input type="button" class="btn btn1" onclick="fCheck()" value="비밀번호 변경">
              </div>
            	<input type="hidden" name="mid" value="${mid}"/>
            </c:if>
            </form><br/>
            <div align="center">
              <a href="${ctp}/userLogin.psj" class="btn btn-dark">로그인</a>&nbsp;&nbsp;
              <a href="${ctp}/userJoin.psj" class="btn btn-dark">회원가입</a>
            </div>
            <div align="center">
              <a href="${ctp}/idFind.psj">아이디를 잊으셨나요?</a>  
            </div>
         </div>
      </div>
    </div>
  </div>
</body>
</html>