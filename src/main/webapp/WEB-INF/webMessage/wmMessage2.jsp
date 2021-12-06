<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>wmMessage</title>
  <jsp:include page="/include/bs4.jsp"/>
  <jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
  <script>
  	function wmDeleteAll(){
  		var ans = confirm("휴지통을 모두 비우시겠습니까?");
  		if(!ans) return false;

  		$.ajax({
  			type : "post",
  			url : "${ctp}/wmDeleteAll.wm",
  			success:function(data){
  				alert("휴지통의 모든 메세지가 삭제 되었습니다");
  				location.reload();
  			}
  		});
  	}
  </script>
  <style>
  	#leftWindow {
  		float : left;
  		width : 10%;
  		height: 500px;
  		text-align: center;
  		background-color: #ddd;
  	}
  	#rightWindow {
  		float : left;
  		width : 75%;
  		height: 500px;
  		text-align: left;
  		background-color: #eec;
  		overflow: auto;
  	}
    h3{
    	text-align: center;
    }
  </style>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/messageNav.jsp"/>
		<h3>메세지 관리</h3>
	  <div class="contanier">
	  	  <c:if test="${mSw == 0}">
	  	    <h3>메세지작성</h3>
	  	    <jsp:include page="wmInput.jsp"/>
	  	  </c:if>
	  	  <c:if test="${mSw == 1}">  <!-- 받은 메세지(전체) -->
	  	    <h3>받은 메세지</h3>
	  	    <jsp:include page="wmList.jsp"/>
	  	  </c:if>
	  	  <c:if test="${mSw == 2}">  <!-- 새 메세지확인하기 -->
	  	    <h3>신규 메세지</h3>
	  	    <jsp:include page="wmList.jsp"/>
	  	  </c:if>
	  	  <c:if test="${mSw == 3}">  <!-- 보낸 메세지확인하기 -->
	  	    <h3>보낸 메세지</h3>
	  	    <jsp:include page="wmList.jsp"/>
	  	  </c:if>
	  	  <c:if test="${mSw == 4}">  <!-- 수신여부 확인하기 -->
	  	    <h3>수신 확인</h3>
	  	    <jsp:include page="wmList.jsp"/>
	  	  </c:if>
	  	  <c:if test="${mSw == 5}">  <!-- 휴지통 확인하기 -->
	  	    <h3>휴지통 목록</h3>
	  	    <jsp:include page="wmList.jsp"/>
	  	  </c:if>
	  	  <c:if test="${mSw == 6}">		<!-- 메세지 내용상세보기 -->
	  	    <h3>메세지 내용보기</h3>
	  	    <jsp:include page="wmContent.jsp"/>
	  	  </c:if>
	  	</div>
	  </div>
</body>
</html>