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
	<title>마이페이지</title>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/userNav.jsp"/>
	<header class="w3-container" style="padding-top:22px">
    <h3 style="text-align: center;"><b>마이페이지</b></h3>
  </header>
  <div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-pale-green w3-padding-16">
        <div class="w3-left"><i class="fas fa-truck w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>0</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>주문배송</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-pale-green w3-padding-16">
        <div class="w3-left"><i class="fas fa-feather-alt w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>0</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>리뷰</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-pale-green w3-padding-16">
        <div class="w3-left"><i class="fas fa-dove w3-xxxlarge"></i></div>
        <div class="w3-right">
           <h3>
	          <c:if test="${vo.level == 1}">WELCOME</c:if>
						<c:if test="${vo.level == 2}">BEIGE</c:if>
						<c:if test="${vo.level == 3}">RED</c:if>
						<c:if test="${vo.level == 4}">GOLD</c:if>
						<c:if test="${vo.level == 5}">BLACK</c:if>
          </h3>
        </div>
        <div class="w3-clear"></div>
        <h4>등급</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-pale-green w3-padding-16">
        <div class="w3-left"><i class="fas fa-coins w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>${vo.point}</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>포인트</h4>
      </div>
    </div>
  </div>
	<table class="table table-hover">
		<tr class="font2">
			<th>가입일</th>
			<td>${vo.startDate}</td>
		<tr/>
		<tr class="font2">
			<th>총 방문수</th>
			<td>${vo.visitCnt}</td>
		<tr/>
		<tr class="font2">	
			<th>오늘 방문횟수</th>
			<td>${vo.todayCnt}</td>
		</tr>
	</table>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>