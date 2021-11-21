<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<div class="w3-bar w3-black w3-padding-24 w3-large">
  <a href="${ctp}/adminPage.boss" class="w3-bar-item w3-button w3-hide-small">관리자페이지</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small">상품관리</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small">주문관리</a>
  <a href="${ctp}/adminUserList.boss" class="w3-bar-item w3-button w3-hide-small">회원관리</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small">공지사항</a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small">Q&A관리</a>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</a>
</div>

<div id="demo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-padding-24">
  <a href="${ctp}/adminPage.boss" class="w3-bar-item w3-button">관리자페이지</a>
  <a href="#" class="w3-bar-item w3-button">상품관리</a>
  <a href="#" class="w3-bar-item w3-button">주문관리</a>
  <a href="${ctp}/adminUserList.boss" class="w3-bar-item w3-button">회원관리</a>
  <a href="#" class="w3-bar-item w3-button">공지사항</a>
  <a href="#" class="w3-bar-item w3-button">Q&A관리</a>
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