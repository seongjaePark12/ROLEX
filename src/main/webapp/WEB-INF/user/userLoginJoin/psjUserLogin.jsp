<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<title>로그인페이지</title>
	<jsp:include page="/js/cilckNo.jsp"/>
	<jsp:include page="/css/UserLoginCss.jsp"/>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<div class="Form my-4 mx-5">
    <div class="container">
      <div class="row no-gutters">
        <div class="col-lg-3">
        </div>
        <div class="col-lg-6">
          <div align="center"><a href="${ctp}/" id="login1"><img src="${ctp}/images/로고1.png" id="imgimg"></a></div>
          <h1 class="font-weight-bold py-3 mt-3 ml-3" id="lolo"> L O G I N</h1>
          <br/><br/>
          <form name="myform" action="${ctp}/userLoginCheck.psj"  class="needs-validation" method="post" novalidate>
            <div class="col-lg-12">
              <div>
                <input type="text" class="form-control" name="mid" id="mid" value="${mid}" placeholder="아이디를 입력해주세요"  maxlength="20" autofocus required />
              	<div class="valid-feedback"></div>
                <div class="invalid-feedback"></div>
              </div>
              <br>
              <div>
                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요"  maxlength="20" required />
             		<div class="valid-feedback"></div>
		            <div class="invalid-feedback"></div>
              </div>
              <br/><br/>
              <div class="form-group form-check">
                <label class="form-check-label">
                  <input class="form-check-input" type="checkbox" name="remember" /> 아이디저장
                </label>
              </div>
              <div class="col-lg-12" align="center">
                <input type="submit" class="btn btn1" value="로그인">
              </div>
              <br/><br/>
            </div>
            <div align="center">
              <a href="${ctp}/passwordFind.psj">비밀번호를 잊으셨나요?</a> 
            </div>
            <div align="center">
              <p>계정이 없으신가요? <a href="${ctp}/userJoin.psj">회원가입</a></p>
            </div>
          </form>
         </div>
      </div>
    </div>
  </div>
  <script>
  // Disable form submissions if there are invalid fields
  (function() {
    'use strict';
    window.addEventListener('load', function() {
      // Get the forms we want to add validation styles to
      var forms = document.getElementsByClassName('needs-validation');
      // Loop over them and prevent submission
      var validation = Array.prototype.filter.call(forms, function(form) {
        form.addEventListener('submit', function(event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  })();
  </script>
</body>
</html>