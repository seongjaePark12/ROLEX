<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<title>예약상세</title>
	<script>
  // 일정 등록및 수정
  	function fCheck(){
  		var content = myform.content.value;
  		if(content ==""){
  			alert("일정 내역을 등록하세요");
  			myform.content.focus();
  		}
  		else{
  			myform.submit();
  		}
  	}
  	
  // 일정삭제
  	function delCheck(){
  		var ans = confirm("오늘 일정을 삭제 하시겠습니까?");
  		if(ans) location.href="${ctp}/bookingDelete.boo?idx=${vo.idx}&ymd=${ymd}&mid=${sMid}";
  	}
  </script>
</head>
<body oncontextmenu = "return false;">
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/userNav.jsp"/>
	<p><br/></p>
	<div class="container">
		<form name="myform" method="post" action="${ctp}/bookingContentOk.boo">
			<h2>예 약 관 리</h2>
			<div class="form-group">
				<label for="booDate">예약날짜</label>
				<input type="text" class="form-control" name="booDate" id="booDate" value="${ymd}" readonly />
			</div>				
			<div class="form-group">
				<label for="mid">등록자</label>
				<input type="text" class="form-control" name="mid" id="mid" value="${sMid}" readonly />
			</div>	
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" class="form-control" name="name" id="name" value="${sName}" readonly />
			</div>	
			<div class="form-group">
				<label for="booTime">시간</label>
				<select name="booTime" id="booTime" class="form-control">
					<option value="1:00pm" ${vo.booTime =="1:00pm" ? "selected" : ""}>1:00pm</option>
					<option value="1:30pm" ${vo.booTime =="1:30pm" ? "selected" : ""}>1:30pm</option>
					<option value="2:00pm" ${vo.booTime =="2:00pm" ? "selected" : ""}>2:00pm</option>
					<option value="2:30pm" ${vo.booTime =="2:30pm" ? "selected" : ""}>2:30pm</option>
					<option value="3:00pm" ${vo.booTime =="3:00pm" ? "selected" : ""}>3:00pm</option>
					<option value="3:30pm" ${vo.booTime =="3:30pm" ? "selected" : ""}>3:30pm</option>
					<option value="4:00pm" ${vo.booTime =="4:00pm" ? "selected" : ""}>4:00pm</option>
					<option value="4:30pm" ${vo.booTime =="4:30pm" ? "selected" : ""}>4:30pm</option>
					<option value="5:00pm" ${vo.booTime =="5:00pm" ? "selected" : ""}>5:00pm</option>
				</select>
			</div>	
			<div class="form-group">
				<label for="content">분류</label>		
				<select name="content" id="content" class="form-control">
					<option value="상담" ${vo.content =="상담" ? "selected" : ""}>상담</option>
					<option value="시계구매" ${vo.content =="시계구매" ? "selected" : ""}>시계구매</option>
					<option value="A/S" ${vo.content =="A/S" ? "selected" : ""}>A/S</option>
					<option value="기타" ${vo.content =="기타" ? "selected" : ""}>기타</option>
				</select>
			</div>
			<div class="form-group">
				<c:if test="${empty vo.content}">
					<input type="button" value="일정등록" onclick="fCheck()" class="btn btn-outline-warning"/>
					<input type="reset" value="다시쓰기" class="btn btn-outline-warning"/>
				</c:if>
				<c:if test="${!empty vo.content}">
					<input type="button" value="일정수정" onclick="fCheck()" class="btn btn-outline-warning"/>
					<input type="reset" value="다시쓰기" class="btn btn-outline-warning"/>
					<input type="button" value="일정삭제" onclick="delCheck()" class="btn btn-outline-warning"/>
				</c:if>
				<input type="button" value="돌아가기" onclick="location.href='${ctp}/bookingUser.boo?ymd=${ymd}';" class="btn btn-outline-warning"/>
			</div>
			<input type="hidden" name="idx" value="${vo.idx}"/> <!-- 수정처리시에 넘겨줌 -->	
			<input type="hidden" name="ymd" value="${ymd}"/>	
		</form>
	</div>
	<br/>	
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>