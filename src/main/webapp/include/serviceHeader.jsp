<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
	<!-- Navbar -->
<div id="nav">
	<div class="navDiv1 rolex menu3">
		<!-- 상단왼쪽 -->
		<div id="Topleft" style="flex: 1 1 0%; text-align: left; margin: auto 0px;">
		</div>
		<!-- 상단 가운데 -->
		<div style="flex: 1; " align="center">
			<a href="${ctp}/"  style="color: white; text-align: center; display: block; "align="center"><img src="${ctp}/images/로고2.png" width="50%" ></a>
		</div>
		<!-- 상단오른쪽 -->
		<div id="Topright" style="flex: 1 1 0%; text-align: right; margin: auto 0px;">
<%    if(level != 99) {%>
	<%		if(level == 0){ %> 
				<a href="${ctp}/adminPage.boss">관리자페이지</a>&nbsp;&nbsp;
				<a href="${ctp}/userLogOut.psj">로그아웃</a>&nbsp;&nbsp;
	<%		} %>
	<%		if(level == 1 ||level == 2 ||level == 3 ||level == 4 ||level == 5){ %>
				<a href="${ctp}/userMyPage.psj">마이페이지</a>&nbsp;&nbsp;
				<a href="${ctp}/userLogOut.psj">로그아웃</a>&nbsp;&nbsp;
	<% 		}%>
<% 		}else{%>
			<a href="${ctp}/userLogin.psj" class="w3-padding-small" id="login"><i class="fa fa-user"></i></a>&nbsp;&nbsp;&nbsp;
<%		} %>
			<c:if test="${sLevel == 1 ||sLevel == 2 ||sLevel == 3 ||sLevel == 4 ||sLevel == 5}"><a href="${ctp}/bookingUser.boo" class="w3-padding-small"><i class="far fa-calendar-alt" id="fashopping"> </i></a></c:if>
			<c:if test="${sLevel == 0}"><a href="${ctp}/bookingMain.boo" class="w3-padding-small"><i class="far fa-calendar-alt" id="fashopping"> </i></a></c:if>
			<button id="btnSearch" class="w3-padding-small btnSearch"><i id="SearchIcon" class="fa fa-search"></i></button>&nbsp;&nbsp;&nbsp;
		</div>
	</div>

	<!-- 여기는 컴퓨터 화면에서 스크롤바 내릴시 사용 -->
	<div class="navDiv1" style="font-size: 12px; font-weight: bold; display: flex; height: 50px;">

		<div id="navleft" style="flex: 1 1 0%; text-align: left; margin: auto 0px; display: none;">
		</div>

		<div class="menu3" id="Topcenter" style="flex: 1; text-align: center; margin: auto 0;">
			<a href="${ctp}/collectionWatch.watch" class="w3-padding-small w3-bar-item w3-button w3-mobile">롤렉스 컬렉션</a>
			<a href="${ctp}/newWatch.watch" class="w3-padding-small w3-bar-item w3-button w3-mobile ">2021 신제품</a>
			<a href="${ctp}/manWatch.watch" class="w3-padding-small w3-bar-item w3-button w3-mobile">시계구매하기</a>
			<a href="${ctp}/service.ser" class="w3-padding-small w3-bar-item w3-button w3-mobile">롤렉스서비스</a>
			<a href="${ctp}/serviceMap.ser" class="w3-padding-small w3-bar-item w3-button w3-mobile">공식 판매점</a>
			<a href="${ctp}/userNotice.psj" class="w3-padding-small w3-bar-item w3-button w3-mobile">고객센터</a>
		</div>
		<div id="navright" style="flex: 1 1 0%; text-align: right; margin: auto 0px; display: none;">
<%		if(level != 99){ %>
			<a href="${ctp}/userLogOut.psj" class="w3-padding-small">로그아웃</a>&nbsp;&nbsp;
<% 			}else{%>
			<a href="${ctp}/userLogin.psj" class="w3-padding-small" id="login"><i class="fa fa-user"></i></a>&nbsp;&nbsp;&nbsp;
<%			} %>
			<button id="btnSearch1" class="w3-padding-small" style="background-color: rgba(0,0,0,0); border: none; color: rgba(230,230,230);">&nbsp; <i id="SearchIcon1" class="fa fa-search"></i></button>&nbsp;&nbsp;&nbsp;
		</div>
	</div>
</div>
		<!-- 검색창 띄우기 -->
<div id="SearchDiv" class="w3-padding">
	<div class="w3-padding" style="width: 90%; margin: 0 auto; border-bottom: 1px solid;">
		<i class="fa fa-search"></i>
		<input type="text" name="search" id="search" onkeyup="enterKey()" style="border: none;" placeholder="무엇을 찾고 계신가요?" maxlength="10">
	</div>
	<p></p>
	<div style="display: flex; margin: 0 auto; width: 90%;">
		<div class="w3-padding" style="height: 200px; flex: 1;">
			<h5 id="searchTitle"></h5>
			<ul style="list-style: none; margin:0; padding:0;">
				<li id="search0"></li>
				<li id="search1"></li>
				<li id="search2"></li>
				<li id="search3"></li>
				<li id="search4"></li>
			</ul>
		</div>
	</div>
</div>