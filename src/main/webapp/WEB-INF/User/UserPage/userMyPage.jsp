<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<jsp:include page="/include/lgCheck.jsp"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/js/userDelete.jsp"/>
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
          <h3><a href="#">0</a></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>주문배송</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-pale-green w3-padding-16">
        <div class="w3-left"><i class="fas fa-feather-alt w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><a href="#">0</a></h3>
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
          <h3>${vo.point}P</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>포인트</h4>
      </div>
    </div>
  </div>
	<table class="table table-borderless">
		<tr>
			<td>  <!-- Button to Open the Modal -->
			  <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal">
			    등급별 혜택
			  </button>
			  <!-- The Modal -->
			  <div class="modal fade" id="myModal">
			    <div class="modal-dialog modal-lg">
			      <div class="modal-content">
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title font3">
			          현재 회원님의 등급은
			          	<c:if test="${vo.level == 1}"><font color="blue">WELCOME</font></c:if>
									<c:if test="${vo.level == 2}"><font color="blue">BEIGE</font></c:if>
									<c:if test="${vo.level == 3}"><font color="blue">RED</font></c:if>
									<c:if test="${vo.level == 4}"><font color="blue">GOLD</font></c:if>
									<c:if test="${vo.level == 5}"><font color="blue">BLACK</font></c:if>입니다
			          </h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        <!-- Modal body -->
			        <div class="modal-body">
			          	<table class="table table-active table-bordered">
										<tr class="text-center"><th colspan="6" class="font3">회원 등급표</th></tr>
										<tr class="text-center font4">
											<th>회원 등급</th>
											<td>WELCOME</td>
											<td>BEIGE</td>
											<td>RED</td>
											<td>GOLD</td>
											<td>BLACK</td>
										</tr>
										<tr class="text-center font4">
											<th>등급기준</th>
											<td>가입시</td>
											<td>1번 구입시</td>
											<td>3번 구입시</td>
											<td>5번 구입시</td>
											<td>6번 구입시</td>
										</tr>
										<tr class="text-center font4">
											<th>구매 적립금</th>
											<td>2%</td>
											<td>5%</td>
											<td>10%</td>
											<td>15%</td>
											<td>20%</td>
										</tr>
										<tr class="text-center font4">
											<th>생일 쿠폰</th>
											<td colspan="2">20%할인쿠폰 1매</td>
											<td colspan="3">30%할인쿠폰 1매 + 생일기프트</td>
										</tr>
										<tr class="text-center font4">
											<th>공동혜택</th>
											<td colspan="5">무료배송</td>
										</tr>
									</table>
			        </div>
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			    </div>
			  </div>&nbsp;
			  <a href="javascript:userDelete()" class="btn btn-warning">회원 탈퇴</a>
			</td>
		</tr>
		<tr class="font2">
			<th>등급혜택</th>
			<td>
				<c:if test="${vo.level == 1}">적립금 2%/ 생일 20% 할인쿠폰1매/ 배송무료</c:if>
				<c:if test="${vo.level == 2}">적립금 5%/ 생일 20% 할인쿠폰1매/ 배송무료</c:if>
				<c:if test="${vo.level == 3}">적립금 10%/ 생일 30% 할인쿠폰1매+생일기프트/ 배송무료</c:if>
				<c:if test="${vo.level == 4}">적립금 15%/ 생일 30% 할인쿠폰1매+생일기프트/ 배송무료</c:if>
				<c:if test="${vo.level == 5}">적립금 20%/ 생일 30% 할인쿠폰1매+생일기프트/ 배송무료</c:if>
			</td>
		<tr/>
		<tr class="font2">
			<th>가입일</th>
			<td>${startDate}</td>
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
	<br/>

	<jsp:include page="/include/footer.jsp"/>
</body>
</html>