<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
  Date today = new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
  String sToday = sdf.format(today);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<title>회원가입페이지</title>
	<jsp:include page="/js/cilckNo.jsp"/>
	 <jsp:include page="/js/UserJoinJs.jsp"/>
	 <jsp:include page="/css/UserJoinCss.jsp"/>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<div class="container bg-white">
    <div class="bg-white" style=" text-align: center; width: 100%">
			<form name="myform"  style="display: inline-block; border: none;" method="post" action="${ctp}/userJoinCheck.psj"  class="was-validated bg-white" >
	      <br><br>
	      <h1 class="font-weight-bold" ><a href="${ctp}/userJoin.psj" id="jojo">REGISTRATION</a></h1><br/>
	      <br/>
	        <div>
	          <label ><b>아이디</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="text" class="form-control" name="mid" id="mid" onkeyup="midReset()" placeholder="아이디를 입력해주세요" minlength="6" maxlength="20" autofocus required />
	          <div class="valid-feedback"></div>
	          <div class="invalid-feedback"  style="text-align: left;">아이디는 영문 또는 숫자를 포함하여 6 ~ 20자로 작성해주세요</div>
	        </div>
	        <div class="text-left" style="padding-top: 3px; padding-right: 3px;">
	          <input type="button" class="btn btn1 btn-sm" name="btnIdCheck" value="중복체크" onclick="midCheck()" />
	        </div>
	        <br/>
	        <div>
	          <label for="pwd"><b>비밀번호</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" minlength="8" maxlength="20" required />
	          <div class="valid-feedback"></div>
	          <div class="invalid-feedback" style="text-align: left;">비밀번호는 영문, 숫자, 특수문자를 포함하여 8 ~ 20자로 작성해주세요</div>
	        </div>
	       	<br/>
	        <div style="padding-top: 6px;">
	          <label for="pwdTest"><b>비밀번호 확인</b><font size="2px" color="#AF4034"> *</font></label>
	        </div> 
	        <div>
	          <input type="password" class="form-control" name="pwdTest" id="pwdTest" placeholder="비밀번호를 확인해주세요" minlength="8" maxlength="20" required />
	          <div class="valid-feedback"></div>
	          <div class="invalid-feedback" style="text-align: left;">입력하신 비밀번호와 일치하게 입력해주세요</div>
	       	</div>
	        <br/>
	        <div>
	          <label for="name"><b>이름</b><font size="2px" color="#AF4034"> *</font></label>
	        </div>   
	        <div>
	          <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요" minlength="1" maxlength="20" required />
	        </div>
	        <br/>
	        <div>
            <label for="birth"><b>생년월일</b><font size="2px" color="#AF4034"></font></label><br/>
	        </div>
	        <div>
	          <input type="date" name="birth" id="birth" value="<%=sToday %>" class="form-control"/>
	        </div>
	        <br/>
	        <div>
	           <label for="email"><b>이메일</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
					<div class="input-group mb-3">
	          <input class="form-control" type="text" name="email" id="email" required placeholder="이메일을 입력하세요" />
	          <font style="margin-top: 15px;">@</font>
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
	        <br/>
	        <div class="valid-feedback"></div>
	        <div class="invalid-feedback" style="text-align: left;">이메일은 비밀번호 찾기에 사용됩니다</div>
	        <br/>
	        <div>
	          <label for="phone"><b>휴대 전화</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div class="input-group mb-3">
	          <input class="form-control" type="text" name="getCode" id="getCode" required  minlength="2" maxlength="3" required />
	          <font style="margin-top: 17px;">-</font>
	          <input class="form-control" type="text" name="getCode2" id="getCode2" required  minlength="2" maxlength="4" required />
	          <font style="margin-top: 17px;">-</font>
	          <input class="form-control" type="text" name="getCode3" id="getCode3" required  minlength="3" maxlength="4" required />
	        </div>
	        <br/>
	        <div>
	          <label for="address"><b>주소</b><font size="2px" color="#AF4034"></font></label><br/>
	        </div>
	        <div>
	        	<input type="hidden" class="form-control" name="address"/>
	          <input type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호" readonly />
	          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
	          <br/>
	        </div>
	        <div> 
	          <input type="text" name="sample6_address" id="sample6_address" placeholder="도로명주소" readonly />
	          <input type="text"  name="sample6_extraAddress" id="sample6_extraAddress" placeholder="참고항목" readonly>
	        </div>   
	        <div>
	        <input type="text" name ="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소" />
	        </div>
	        <br/>
	        <div>
	          <label for="infoopen"><b>이메일 수신</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="radio" name="emailInfor" value="Y" checked >수신
	          <input type="radio" name="emailInfor" value="N">비수신 <br/><br/>
	        </div>
	        <br/>
	        <div>
	          <input style="text-align:center;" type="button" id="joinbtn" value="가입하기" onclick="joinCheck()">
	        </div>
	        <br/>
	        <div>
	          <a href="${ctp}/"><input type="button" value="메인화면"></a>
	        </div>
			</form>
    </div> 
  </div> 
</body>
</html>