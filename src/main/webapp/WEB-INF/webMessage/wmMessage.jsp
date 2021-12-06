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
.w3-theme {color:#fff !important;background-color:#4CAF50 !important}
.w3-btn {background-color:#4CAF50;margin-bottom:4px}
.w3-code{border-left:4px solid #4CAF50}
.myMenu {margin-bottom:150px}
</style>
</head>
<body>
	<jsp:include page="/include/serviceHeader.jsp"/>
	<%-- <jsp:include page="/include/messageNav.jsp"/> --%>
  <div class="w3-row w3-white"style="padding-top:150px;">
    <div class="w3-half w3-margin-top w3-wide w3-hide-medium w3-hide-small"><div class="w3-center"></div></div>
  </div>
  <div class="w3-bar w3-black w3-large" style="z-index:4;">
    <a class="w3-bar-item w3-button w3-left w3-hide-large w3-hover-white w3-large w3-black  w3-padding-32 w3-margin-top" href="javascript:void(0)" onclick="w3_open()">☰</a>
  </div>
  <div class="w3-sidebar w3-bar-block w3-collapse w3-animate-left" style="z-index:3;width:270px" id="mySidebar">
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-right w3-xlarge w3-hide-large" title="Close Menu">×</a>
  <div id="menuTut" class="myMenu">
  <div class="w3-container">
    <h3>1:1문의</h3>
  </div>
	  <c:if test="${sLevel == 1 ||sLevel == 2 ||sLevel == 3 ||sLevel == 4 ||sLevel == 5}"><a href="${ctp}/userMyPage.psj" class="w3-bar-item w3-button">마이페이지</a></c:if>
  	<c:if test="${sLevel == 0 }"><a href="${ctp}/adminPage.boss" class="w3-bar-item w3-button">관리자페이지</a></c:if>
	  <a href="${ctp}/wmMessage.wm?mSw=0" class="w3-bar-item w3-button">메세지작성</a>
	 	<a href="${ctp}/wmMessage.wm?mSw=1&mFlag=r" class="w3-bar-item w3-button">받은메세지</a>
	  <a href="${ctp}/wmMessage.wm?mSw=2" class="w3-bar-item w3-button">새메세지</a>
	  <a href="${ctp}/wmMessage.wm?mSw=3&mFlag=s" class="w3-bar-item w3-button">보낸메세지</a>
	  <c:if test="${sLevel == 0 }"><a href="${ctp}/wmMessage.wm?mSw=4" class="w3-bar-item w3-button">수신확인</a></c:if>
	  <a href="${ctp}/wmMessage.wm?mSw=5" class="w3-bar-item w3-button">휴지통</a>
	  <a href="javascript:wmDeleteAll()" class="w3-bar-item w3-button">휴지통비우기</a>
  </div>
  <div id="menuRef" class="myMenu" style="display:none">
  <div class="w3-container">
    <h3>1:1문의</h3>
  </div>
	  <c:if test="${sLevel == 1 ||sLevel == 2 ||sLevel == 3 ||sLevel == 4 ||sLevel == 5}"><a href="${ctp}/userMyPage.psj" class="w3-bar-item w3-button">마이페이지</a></c:if>
  	<c:if test="${sLevel == 0 }"><a href="${ctp}/adminPage.boss" class="w3-bar-item w3-button">관리자페이지</a></c:if>
	  <a href="${ctp}/wmMessage.wm?mSw=0" class="w3-bar-item w3-button">메세지작성</a>
	 	<a href="${ctp}/wmMessage.wm?mSw=1&mFlag=r" class="w3-bar-item w3-button">받은메세지</a>
	  <a href="${ctp}/wmMessage.wm?mSw=2" class="w3-bar-item w3-button">새메세지</a>
	  <a href="${ctp}/wmMessage.wm?mSw=3&mFlag=s" class="w3-bar-item w3-button">보낸메세지</a>
	  <c:if test="${sLevel == 0 }"><a href="${ctp}/wmMessage.wm?mSw=4" class="w3-bar-item w3-button">수신확인</a></c:if>
	  <a href="${ctp}/wmMessage.wm?mSw=5" class="w3-bar-item w3-button">휴지통</a>
	  <a href="javascript:wmDeleteAll()" class="w3-bar-item w3-button">휴지통비우기</a>
  </div>
</div>
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
	<div class="w3-main w3-container" style="margin-left:270px;">
		<div class="w3-panel w3-padding-large w3-card-4 w3-light-grey">
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

<script>
// Script to open and close the sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

function w3_show_nav(name) {
  document.getElementById("menuTut").style.display = "none";
  document.getElementById("menuRef").style.display = "none";
  document.getElementById(name).style.display = "block";
  w3-open();
}
</script>

<script src="https://www.w3schools.com/lib/w3codecolor.js"></script>

<script>
w3CodeColor();
</script>
</body>
</html>