<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="w3-bar w3-black w3-padding-24 w3-large">
  <a href="${ctp}/userMyPage.psj" class="w3-bar-item w3-button w3-hide-small ">마이홈</a>
  <a href="${ctp}/userUpdate.psj" class="w3-bar-item w3-button w3-hide-small" >정보수정</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small">예약내역</a>
  <a href="${ctp}/userQuestion.psj" class="w3-bar-item w3-button w3-hide-small">Q＆A</a>
  <a href="${ctp}/wmMessage.wm" class="w3-bar-item w3-button w3-hide-small">1:1문의</a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
</div>

<div id="demo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-padding-24">
  <a href="${ctp}/userMyPage.psj" class="w3-bar-item w3-button">마이홈</a>
  <a href="${ctp}/userUpdate.psj" class="w3-bar-item w3-button">정보수정</a>
  <a href="#" class="w3-bar-item w3-button">예약내역</a>
  <a href="${ctp}/userQuestion.psj" class="w3-bar-item w3-button">Q＆A</a>
  <a href="${ctp}/wmMessage.wm" class="w3-bar-item w3-button">1:1문의</a>
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