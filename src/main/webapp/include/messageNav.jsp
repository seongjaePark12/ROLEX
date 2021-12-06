<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="w3-bar w3-black w3-padding-24 w3-large">
  <a href="${ctp}/userMyPage.psj" class="w3-bar-item w3-button w3-hide-small ">마이홈</a>
  <a href="${ctp}/wmMessage.wm?mSw=0" class="w3-bar-item w3-button w3-hide-small ">메세지작성</a>
 	<a href="${ctp}/wmMessage.wm?mSw=1&mFlag=r" class="w3-bar-item w3-button w3-hide-small ">받은메세지</a>
  <a href="${ctp}/wmMessage.wm?mSw=2" class="w3-bar-item w3-button w3-hide-small ">새메세지</a>
  <a href="${ctp}/wmMessage.wm?mSw=3&mFlag=s" class="w3-bar-item w3-button w3-hide-small ">보낸메세지</a>
  <a href="${ctp}/wmMessage.wm?mSw=4" class="w3-bar-item w3-button w3-hide-small ">수신확인</a>
  <a href="${ctp}/wmMessage.wm?mSw=5" class="w3-bar-item w3-button w3-hide-small ">휴지통</a>
  <a href="javascript:wmDeleteAll()" class="w3-bar-item w3-button w3-hide-small ">휴지통비우기</a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
</div>

<div id="demo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-padding-24">
  <a href="${ctp}/userMyPage.psj" class="w3-bar-item w3-button" >마이홈</a>
  <a href="${ctp}/wmMessage.wm?mSw=0" class="w3-bar-item w3-button">메세지작성</a>
 	<a href="${ctp}/wmMessage.wm?mSw=1&mFlag=r" class="w3-bar-item w3-button">받은메세지</a>
  <a href="${ctp}/wmMessage.wm?mSw=2" class="w3-bar-item w3-button">새메세지</a>
  <a href="${ctp}/wmMessage.wm?mSw=3&mFlag=s" class="w3-bar-item w3-button">보낸메세지</a>
  <a href="${ctp}/wmMessage.wm?mSw=4" class="w3-bar-item w3-button">수신확인</a>
  <a href="${ctp}/wmMessage.wm?mSw=5" class="w3-bar-item w3-button">휴지통</a>
  <a href="javascript:wmDeleteAll()" class="w3-bar-item w3-button">휴지통비우기</a>
</div>
<script>
	function myFunction() {
	  var x = document.getElementById("demo");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	  }
	}
</script>