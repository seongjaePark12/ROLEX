<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<jsp:include page="/include/lgCheck.jsp"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/UserUpdateJs.jsp"/>
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
			<form name="myform"  style="display: inline-block; border: none;" method="post" action="${ctp}/userUpdateCheck.psj"  class="was-validated bg-white" >
	      <br><br>
	      <h1 class="font-weight-bold" ><a href="${ctp}/userJoin.psj" id="jojo">회원 정보 수정</a></h1><br/>
	      <br/>
	        <div>
	          <label ><b>아이디</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="text" class="form-control" value="${sMid }"readonly />
	        </div>
	        <br/>
	        <div>
	          <label for="pwd"><b>비밀번호</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div>
	          <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" value="${pwd}" minlength="8" maxlength="20" required />
	          <div class="valid-feedback"></div>
	          <div class="invalid-feedback" style="text-align: left;">비밀번호는 영문, 숫자, 특수문자를 포함하여 8 ~ 20자로 작성해주세요</div>
	        </div>
	       	<br/>
	        <div>
	          <label for="name"><b>이름</b><font size="2px" color="#AF4034"> *</font></label>
	        </div>   
	        <div>
	          <input type="text" class="form-control" name="name" id="name" value="${vo.name}" placeholder="이름을 입력해주세요" minlength="1" maxlength="20" required />
	        </div>
	        <br/>
	        <div>
            <label for="birth"><b>생년월일</b><font size="2px" color="#AF4034"></font></label><br/>
	        </div>
	        <div>
	          <input type="date" name="birth" id="birth" value="${vo.birth.substring(0, 10)}" class="form-control"/>
	        </div>
	        <br/>
	        <div>
	           <label for="email"><b>이메일</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
					<div class="input-group mb-3">
	          <input class="form-control" type="text" name="email" id="email" value="${email1}"  required placeholder="이메일을 입력하세요" />
	          <font style="margin-top: 15px;">@</font>
	          <div class="input-group-append">
							<select name="email2" id="email2" class="custom-select" required >
		              <option value="" selected>메일주소를 선택하세요</option>
		              <option value="naver.com" ${email2 == 'naver.com' ? 'selected' : ''}>naver.com</option>
		              <option value="daum.net" ${email2 == 'daum.net' ? 'selected' : ''}>daum.net</option>
		              <option value="gmail.com" ${email2 == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
		              <option value="nate.com" ${email2 == 'nate.com' ? 'selected' : ''}>nate.com</option>
		              <option value="yahoo.co.kr" ${email2 == 'yahoo.co.kr' ? 'selected' : ''}>yahoo.co.kr</option>
		              <option value="nate.com" ${email2 == 'nate.com' ? 'selected' : ''}>nate.com</option>
		              <option value="hanmail.net" ${email2 == 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
			    		 <option value="hotmail.com" ${email2 == 'hotmail.com' ? 'selected' : ''}>hotmail.com</option>
							</select>
						</div>
	        </div> 
	        <br/>
	        <div>
	          <label for="phone"><b>휴대 전화</b><font size="2px" color="#AF4034"> *</font></label><br/>
	        </div>
	        <div class="input-group mb-3">
	          <input class="form-control" type="text" name="getCode" id="getCode" value="${getcode1}" required maxlength="3" required />
	          <font style="margin-top: 17px;">-</font>
	          <input class="form-control" type="text" name="getCode2" id="getCode2" value="${getcode2}" required maxlength="4" required />
	          <font style="margin-top: 17px;">-</font>
	          <input class="form-control" type="text" name="getCode3" id="getCode3" value="${getcode3}" required maxlength="4" required />
	        </div>
	        <br/>
	        <div>
	          <label for="address"><b>주소</b><font size="2px" color="#AF4034"></font></label><br/>
	        </div>
	        <div>
	        	<input type="hidden" class="form-control" name="address"/>
	          <input type="text" name="sample6_postcode" value="${address1}" id="sample6_postcode" placeholder="우편번호" readonly />
	          <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
	          <br/>
	        </div>
	        <div> 
	          <input type="text" name="sample6_address" value="${address2}" id="sample6_address" placeholder="도로명주소" readonly />
	          <input type="text"  name="sample6_extraAddress" value="${address3}" id="sample6_extraAddress" placeholder="참고항목" readonly>
	        </div>   
	        <div>
	        <input type="text" name ="sample6_detailAddress" value="${address4}" id="sample6_detailAddress" placeholder="상세주소" />
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
	          <input style="text-align:center;" type="button" id="joinbtn" onclick="joinCheck()" value="정보수정" ><br/><br/>
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