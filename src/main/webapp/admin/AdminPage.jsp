<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="../include/bs4.jsp" %>
	<%@ include file="../js/mainJs.jsp" %>
	<%@ include file="../css/mainCss.jsp" %>
	<title>관리자페이지</title>
</head>
<body>
	<%@ include file="../include/adminHeader.jsp" %>
	<%@ include file="../include/adminNav.jsp" %>	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>