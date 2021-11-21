<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<title>title</title>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/adminNav.jsp"/>
	<div class="container">
		<h2>회 원 상 세 정 보</h2>
		<br/>
		<table class="table">
			<tr><td>아이디 : ${vo.mid}</td></tr>
			<tr><td>성명 : ${vo.name}</td></tr>
			<tr><td>생일 : ${fn:substring(vo.birth,0,10)}</td></tr>
			<tr><td>이메일 : ${vo.email}</td></tr>
			<tr><td>전화번호 : ${vo.getCode}</td></tr>
			<tr><td>주소 : ${vo.address}</td></tr>
			<tr><td>정보공개 : ${vo.emailInfor}</td></tr>
			<tr>
				<td>탈퇴여부 : 
					<c:if test="${vo.userDel ne 'NO'}"><a href="javascript:UserReset(${vo.idx})">탈퇴신청</a></c:if> 
					<c:if test="${vo.userDel eq 'NO'}">가입중</c:if> 
				</td>
			</tr>
			<tr><td>포인트 : <fmt:formatNumber value="${vo.point}"/></td></tr>
			<tr>
				<td>등급 : 
					<c:choose>
					<c:when test="${vo.level == 1}"><c:set var="level" value="WELCOME"/></c:when>
					<c:when test="${vo.level == 2}"><c:set var="level" value="BEIGE"/></c:when>
					<c:when test="${vo.level == 3}"><c:set var="level" value="RED"/></c:when>
					<c:when test="${vo.level == 4}"><c:set var="level" value="GOLD"/></c:when>
					<c:when test="${vo.level == 5}"><c:set var="level" value="BLACK"/></c:when>
					<c:otherwise><c:set var="level" value="WELCOME"/></c:otherwise>
				</c:choose>
				${level}
				</td>
			</tr>
			<tr><td>총 방문수 : ${vo.visitCnt}</td></tr>
			<tr><td>최초가입일 : ${vo.startDate}</td></tr>
			<tr><td>최근 접속일 : ${vo.lastDate}</td></tr>
			<tr><td>오늘 방문수 : ${vo.todayCnt}</td></tr>
		</table>
		<hr/>
		<a href="${ctp}/adminUserList.boss">돌아가기</a>
	</div>
	<br/>	
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>