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
	<title>롤렉스서비스</title>
	<style>
    a { /* a 태그 style 설정 */
    text-align: center;
    text-decoration: none; /* 링크의 밑줄 제거 */
    color: inherit; /* 링크의 색상 제거 */
    }
    a:hover{ /* a 태그 style 설정 */
    text-align: center;
    text-decoration: none; /* 링크의 밑줄 제거 */
    color: lightgray; /* 링크의 색상 제거 */
    }
    </style>
</head>
<body>
	<jsp:include page="/include/serviceHeader.jsp"/>
  <div width="100%">
    <div><img width="100%" src="${ctp}/images/3.png"></div><br/><br/><br/>
    <div class="font1">롤렉스 시계를 매일 착용하실 경우, 약간의 보살핌이 필요합니다. 평소에 간단한 관리를 해 주실 것을 권해드립니다.</div>
    <br/><br/><br/>
    <div>
      <div><a href="${ctp}/service1.ser"><img width="100%" src="${ctp}/images/서비스191.jpg"></a></div>
      <div><a href="${ctp}/service2.ser"><img width="100%" src="${ctp}/images/서비스171.jpg"></a></div>
      <div><a href="${ctp}/care.ser"><img width="100%" src="${ctp}/images/서비스181.jpg"></a></div>
    </div>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>