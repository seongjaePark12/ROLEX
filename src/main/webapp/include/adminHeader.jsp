<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- Navbar -->
<div id="nav">
	<div class="navDiv1 rolex menu3">
		<!-- 상단왼쪽 -->
		<div id="Topleft" style="flex: 1 1 0%; text-align: left; margin: auto 0px;">
		</div>
		<!-- 상단 가운데 -->
		<div style="flex: 1; " align="center">
			<a href="<%=request.getContextPath() %>"  style="color: white; text-align: center; display: block; "align="center"><img src="<%=request.getContextPath() %>/images/로고2.png" width="50%" ></a>
		</div>
		<!-- 상단오른쪽 -->
		<div id="Topright" style="flex: 1 1 0%; text-align: right; margin: auto 0px;">
			<a href="<%=request.getContextPath() %>/login/psjLogin.jsp" class="w3-padding-small" id="login"><i class="fa fa-user"></i></a>&nbsp;&nbsp;&nbsp;
			<a href="#" class="w3-padding-small"><i class="fa fa-shopping-bag" id="fashopping"> </i></a>
			<button id="btnSearch" class="w3-padding-small btnSearch"><i id="SearchIcon" class="fa fa-search"></i></button>&nbsp;&nbsp;&nbsp;
		</div>
	</div>

	<!-- 여기는 컴퓨터 화면에서 스크롤바 내릴시 사용 -->
	<div class="navDiv1" style="font-size: 12px; font-weight: bold; display: flex; height: 50px;">

		<div id="navleft" style="flex: 1 1 0%; text-align: left; margin: auto 0px; display: none;">
		</div>

		<div class="menu3" id="Topcenter" style="flex: 1; text-align: center; margin: auto 0;">
			<a href="collection.html" class="w3-padding-small w3-bar-item w3-button w3-mobile">롤렉스 컬렉션</a>
			<a href="new.html" class="w3-padding-small w3-bar-item w3-button w3-mobile ">2021 신제품</a>
			<a href="man.html" class="w3-padding-small w3-bar-item w3-button w3-mobile">시계구매하기</a>
			<a href="service.html" class="w3-padding-small w3-bar-item w3-button w3-mobile">롤렉스서비스</a>
			<a href="care.html" class="w3-padding-small w3-bar-item w3-button w3-mobile">롤렉스시계관리</a>
			<a href="공식판매점.html" class="w3-padding-small w3-bar-item w3-button w3-mobile">공식 판매점</a>
		</div>

		<div id="navright" style="flex: 1 1 0%; text-align: right; margin: auto 0px; display: none;">
			<a href="<%=request.getContextPath() %>/login/psjLogin.jsp" class="w3-padding-small" id="login"><i class="fa fa-user"></i></a>&nbsp;&nbsp;&nbsp;
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
		<!-- 검색창 띄우기 -->
<div class="w3-content" style="max-width:100%;">
	<div class="mySlides w3-display-container w3-center">
		<img width= 100% src="<%=request.getContextPath() %>/images/구입1.png">
	</div>
</div>