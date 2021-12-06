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
          <h1 class="font-weight-bold py-3 mt-3 ml-3" id="lolo">아 이 디 찾 기</h1>
          <br/><br/>
          <form name="myform" action="${ctp}/idFindEnd.psj"  class="needs-validation" method="post" novalidate>
            <div class="col-lg-12">
              <div>
                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요" autofocus required />
              	<div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">이름을 입력해주세요</div>
              </div>
              <br>
             <div class="input-group mb-3">
		          <input class="form-control" type="text" name="email1" id="email1" required placeholder="이메일을 입력하세요" />
		          <font style="margin-top: 5px;">@</font>
		          <div class="input-group-append">
								<select name="email2" id="email2" class="custom-select" required >
			              <option value="" selected>메일주소를 선택하세요</option>
			              <option value="naver.com" >naver.com</option>
			              <option value="daum.net">daum.net</option>
			              <option value="gmail.com">gmail.com</option>
			              <option value="nate.com">nate.com</option>
			              <option value="yahoo.co.kr">yahoo.co.kr</option>
			              <option value="nate.com">nate.com</option>
			              <option value="hanmail.net">hanmail.net</option>
				    		 <option value="hotmail.com">hotmail.com</option>
								</select>
							</div>
		        </div> 
              <div class="col-lg-12" align="center">
                <input type="submit" class="btn btn1" value="아이디 찾기">
              </div>
              <br/><br/>
            </div>
            <div align="center">
              <a href="${ctp}/passwordFind.psj">비밀번호를 잊으셨나요?</a> 
            </div>
            <div align="center">
              <a href="${ctp}/userLogin.psj">로그인으로</a>
              <a href="${ctp}/userJoin.psj">회원가입</a>
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