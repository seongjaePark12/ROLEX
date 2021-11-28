<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/js/AdminUserListJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<title>유저리스트</title>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/adminNav.jsp"/>
	<div class="container">
		<form name="adminForm">
			<table class="table table-borderless m-0">
				<tr>
					<c:choose>
						<c:when test="${level == 99}"><c:set var="title" value="전체"/></c:when>
						<c:when test="${level == 1}"><c:set var="title" value="WELCOME"/></c:when>
						<c:when test="${level == 2}"><c:set var="title" value="BEIGE"/></c:when>
						<c:when test="${level == 3}"><c:set var="title" value="RED"/></c:when>
						<c:when test="${level == 4}"><c:set var="title" value="GOLD"/></c:when>
						<c:when test="${level == 5}"><c:set var="title" value="BLACK"/></c:when>
					</c:choose>
					<td colspan="2">
						<c:if test="${!empty mid}"><c:set var="title" value="${mid}"/></c:if>
						<h2 style="text-align: center;">${title} 회원 리스트</h2>
					</td>
				</tr>
				<tr>
					<td style="text-align: left">
						<input class="w3-panel w3-border w3-round-large font6" type="text" name="mid" value="${mid}" placeholder="검색할아이디입력"/>
						<input class="btn btn-warning btn-sm w3-round-xxlarge font6" type="button" value="개별검색" onclick="midSearch()"/>
						<input type="button" value="전체보기" onclick="location.href='${ctp}/adminUserList.boss';" class="btn btn-warning btn-sm w3-round-xxlarge font6"/>
					</td>
					<td style="text-align: right">
						회원등급
						<select name="level" onchange="levelSearch()" class="w3-panel w3-border w3-round-xxlarge font6">
							<option value="99" <c:if test="${level == 99}">selected</c:if>>전체회원</option>
							<option value="1" <c:if test="${level == 1}">selected</c:if>>WELCOME</option>
							<option value="2" <c:if test="${level == 2}">selected</c:if>>BEIGE</option>
							<option value="3" <c:if test="${level == 3}">selected</c:if>>RED</option>
							<option value="4" <c:if test="${level == 4}">selected</c:if>>GOLD</option>
							<option value="5" <c:if test="${level == 5}">selected</c:if>>BLACK</option>
						</select>
					</td>
				</tr>
			</table>
		</form>
		<table class="table table-hover" >
			<tr class="table-dark text-dark text-center font5">
				<th><input type="checkbox" name="all" onclick="allCheck(this)" />전체</th>
				<th>번호</th>
				<th>아이디</th>
				<th>성명</th>
				<th>이메일</th>
				<th>최종접속일</th>
				<th>등급</th>
				<th>탈퇴유무</th>
				<th>이메일 수신</th>
			</tr>
			<c:forEach var="vo" items="${vos}">
				<tr class="text-center font6">
					<td><input type="checkbox" name="one" onclick="onCheck(this)" /></td>
					<td>${curScrStartNo}</td>
					<td><a href="${ctp}/adminUserInfor.boss?idx=${vo.idx}">${vo.mid}</a></td>
					<td>${vo.name}</td>
					<td>${vo.email}</td>
					<td>${vo.lastDate}</td>
					<td>
						<form name="levelForm" method="post" action="${ctp}/adminUserLevel.boss">
							<select name="level">
								<option value="1" <c:if test="${vo.level == 1}">selected</c:if>>WELCOME</option>
								<option value="2" <c:if test="${vo.level == 2}">selected</c:if>>BEIGE</option>
								<option value="3" <c:if test="${vo.level == 3}">selected</c:if>>RED</option>
								<option value="4" <c:if test="${vo.level == 4}">selected</c:if>>GOLD</option>
								<option value="5" <c:if test="${vo.level == 5}">selected</c:if>>BLACK</option>
								<option value="0" <c:if test="${vo.level == 0}">selected</c:if>>관리자</option>
							</select>
							<input type="submit" value="등급변경" class="btn btn-warning btn-sm font6" />
							<input type="hidden" name="idx" value="${vo.idx}"/>
						</form>
					</td>
					<td>
	 					<c:if test="${vo.userDel=='OK'}"><a href="javascript:UserReset(${vo.idx})"><font color=red>탈퇴신청</font></a></c:if>
	    	    <c:if test="${vo.userDel!='OK'}">활동중</c:if>
					</td>
					<td>${vo.emailInfor=='N'?'<font color = blue>N</font>':'Y'}</td>
				</tr>
				<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
			</c:forEach>
		</table>
		<br/>
			<!-- 페이징처리 시작 -->
		<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
		<c:if test="${totPage != 0}">
			<div class="w3-round" style="text-align:center;">
				<c:if test="${pag != 1}"><a href="${ctp}/adminUserList.boss?pag=1&level=${level}&mid=${mid}" class="btn btn-warning btn-sm">&laquo;</a></c:if>
				<c:if test="${pag > 1}"><a href="${ctp}/adminUserList.boss?pag=${pag-1}&level=${level}&mid=${mid}" class="btn btn-warning btn-sm">이전</a></c:if>
				${pag} / ${totPage}
				<c:if test="${pag < totPage}"><a href="${ctp}/adminUserList.boss?pag=${pag+1}&level=${level}&mid=${mid}" class="btn btn-warning btn-sm">다음</a></c:if>
				<c:if test="${pag != totPage}"><a href="${ctp}/adminUserList.boss?pag=${totPage}&level=${level}&mid=${mid}" class="btn btn-warning btn-sm">&raquo;</a></c:if>
			</div>
		</c:if>
<!-- 페이징처리 끝 -->
	</div>
	<br/>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>