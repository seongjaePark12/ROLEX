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
	<title>관리자페이지</title>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/adminNav.jsp"/>
	<header class="w3-container" style="padding-top:22px">
    <h3 style="text-align: center;"><b>관리자페이지</b></h3>
  </header>
  <div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-pale-green w3-padding-16">
        <div class="w3-left"><i class="fas fa-users w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><a href="${ctp}/adminUserList.boss?level=1"><font color="red"><b>${newUser}</b></font></a>건</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>새로운 가입자</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-pale-green w3-padding-16">
        <div class="w3-left"><i class="	fas fa-bullhorn w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><a href="${ctp}/adminQuestion.boss"><font color="red"><b>${totRecCnt}</b></font></a>건</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>문의 사항</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-pale-green w3-padding-16">
        <div class="w3-left"><i class="fas fa-heart w3-xxxlarge"></i></div>
        <div class="w3-right">
           <h3><a href="${ctp}/"><font color="red"><b>0</b></font></a>건</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>새로운 리뷰</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-pale-green w3-padding-16">
        <div class="w3-left"><i class="fas fa-truck w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><a href="${ctp}/"><font color="red"><b>0</b></font></a>건</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>새로운 주문</h4>
      </div>
    </div>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>