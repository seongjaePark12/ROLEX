<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<title>방문예약</title>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/userNav.jsp"/>
	<p><br></p>
	<div class="container">
	  <font size="5">일정관리</font> &nbsp; &nbsp;
	    <a href="${ctp}/bookingUser.boo?yy=${yy-1}&mm=${mm}" title="이전년도">◁◁</a>
	    <a href="${ctp}/bookingUser.boo?yy=${yy}&mm=${mm-1}" title="이전월">◀</a>
	    (${yy}년 ${mm+1}월)
	    <a href="${ctp}/bookingUser.boo?yy=${yy}&mm=${mm+1}" title="다음월">▶</a>
	    <a href="${ctp}/bookingUser.boo?yy=${yy+1}&mm=${mm}" title="다음년도">▷▷</a>
	    &nbsp; &nbsp;
	    <a href="${ctp}/bookingUser.boo" title="오늘날짜">■</a>
	  <br/>
	  <table class="table table-bordered text-left align-top">
	  	<tr class="table-secondary text-center">
	  	  <th><font color="red">일</font></th>
	  	  <th>월</th>
	  	  <th>화</th>
	  	  <th>수</th>
	  	  <th>목</th>
	  	  <th>금</th>
	  	  <th><font color="blue">토</font></th>
	  	</tr>
	  	<tr style="height:80px;">
	  		<c:forEach var=startWeek items="${startWeek}">
		  		<td>&nbsp;</td>
	  		</c:forEach>
	  		<c:if test="${cal.get(Calendar.DAY_OF_WEEK) == 1}">
		  		<td>
		  			<a href='bookingContent.boo?ymd=${ymd}'><font color='red'>${cal.get(Calendar.DATE)}</font></a>
		  			<br/><span title='${vo.content}'>${vo.content}</span>
		  		</td>
	  		</c:if>
	  		<c:if test="${cal.get(Calendar.DAY_OF_WEEK) == 7}">
		  		<td>
		  			<a href='bookingContent.boo?ymd=${ymd}'><font color='blue'>${cal.get(Calendar.DATE)}</font></a>
		  			<br/><span title='${vo.content}'>${vo.content}</span>
		  		</td>
	  		</c:if>
	  		<c:if test="${cal.get(Calendar.YEAR)==calToday.get(Calendar.YEAR) && cal.get(Calendar.MONTH)==calToday.get(Calendar.MONTH) && cal.get(Calendar.DATE)==calToday.get(Calendar.DATE)}">
		  		<td style="background-color:skyblue;">
		  			<a href='bookingContent.boo?ymd=${ymd}'><b>${cal.get(Calendar.DATE)}</b></a>
		  			<br/><span title='${vo.content}'>${vo.content}</span>
		  		</td>
	  		</c:if>
	  		<c:if test="${cal.get(Calendar.YEAR)!=calToday.get(Calendar.YEAR) && cal.get(Calendar.MONTH)!=calToday.get(Calendar.MONTH) && cal.get(Calendar.DATE)!=calToday.get(Calendar.DATE)}">
		  		<td>
		  			<a href='bookingContent.boo?ymd=${ymd}'><font color='#000'>${cal.get(Calendar.DATE)}</font></a>
		  			<br/><span title='${vo.content}'>${vo.content}</span>
		  		</td>
	  		</c:if>
	  		<c:if test="${cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY}">
		  		<td>
		  		</td>
	  		</c:if>

	  	</tr>
	  </table>
	</div>
	<br/>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>