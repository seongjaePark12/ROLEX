<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<title>공식판매점</title>
</head>
<body>
	<jsp:include page="/include/serviceHeader.jsp"/>
	<div align="center"><img width="30%" src="${ctp}/images/로고1.png"></div><br/><br/><br/><br/>
  <div align="center"  class="font1"> 공식 판매점 위치</div>
  <div align="center">
  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d90232.7932106517!2d126.90537603204652!3d37.50578695349848!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9f3b0e33974f%3A0x2db6b1089f3cd38f!2z66Gk66CJ7IqkIOu2gO2LsO2BrCAtIOy5tOydtOuhnOyKpA!5e0!3m2!1sko!2skr!4v1635682537489!5m2!1sko!2skr" width="80%" height="500px" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
  </div>
  <br/><br/><br/><br/>
  <br/><br/><br/><br/>
  <div align="center"><img width="100%" src="${ctp}/images/구입1.png"></div>
  <br/><br/><br/><br/>
  <div class="font1">롤렉스는 작은 디테일 하나까지도 완벽함을 추구합니다.</div>
  <div class="font2">이러한 이유로 롤렉스 공식 판매점만이 롤렉스 정품을 판매하며, 애프터 서비스를 제공합니다.</div>
  <br/><br/><br/><br/>
  <div align="center">
  <video width="80%"src="${ctp}/images/구입.mp4" autoplay loop control circle style="display: block;" muted></video>
  </div>
  <br/><br/><br/><br/>
  <div class="font1">‘롤렉스 공식 판매점’만이 롤렉스 시계를 판매하며 애프터 세일즈 서비스를 제공합니다.</div>
  <div class="font2">전문적인 기술과 노하우, 롤렉스 고유의 장비를 가진 공식 판매점은 취급하는 모든 시계와 부품들이 정품임을 보증합니다. 롤렉스 공식 판매점을 통해 평생 동안 함께 할 롤렉스 시계를 만나보시기 바랍니다.</div>
  <div align="center"><img width="100%" src="${ctp}/images/구입2.png"></div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>