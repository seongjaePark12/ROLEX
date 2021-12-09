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
	<jsp:include page="/css/NoticeContentCss.jsp"/>
	<jsp:include page="/css/QuestionContentCss.jsp"/>
	<title>예약상세</title>
	<script>
		function delCheck(){
  		var ans = confirm("게시글을 삭제하시겠습니까?");
  		if(ans) location.href="${ctp}/bookingDelete.boo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}";
  	}
	</script>
</head>
<body oncontextmenu = "return false;">
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/adminNav.jsp"/>
	<p><br/></p>
	  <div class="container">
	    <h2 style="text-align:center; color: #626262;">
	      <a href="#" style="text-decoration: none;">예약상세</a>
	    </h2>
	    <p><br></p>
	    <table class="table">
	      <tbody>
		      <tr class="text-center">
		        <th class="con1">아이디</th>
		        <td class="con2">${vo.mid}</td>
		      </tr>
		      <tr class="text-center">
		        <th class="con1">작성자</th>
		        <td class="con2">${vo.name}</td>
		      </tr>
		      <tr class="text-center">
		        <th class="con1">분류</th>
		        <td class="con2">${vo.content}</td>
		      </tr>
		      <tr class="text-center">
		        <th class="con1">작성일</th>
		        <td>${fn:substring(vo.booDate,0,19)}</td>
		      </tr>
		      <tr class="text-center">
		        <th class="con1">시간</th>
		        <td class="con2">${vo.booTime}</td>
		      </tr>
		      <tr class="text-center">
		        <td class="con2" colspan="2">
		          <br>
		            <input class="btn btn-outline-warning" type="button" value="돌아가기" onclick="location.href='${ctp}/bookingMain.boo?pag=${pag}&pageSize=${pageSize}&lately=${lately}';"/>
		       			<input class="btn btn-outline-warning" type="button" value="삭제" onclick="delCheck()"/>
		        </td>
		      </tr>
	   		</tbody>
	    </table>
	    <br/>
	    <table class="table">
		  	<tbody>
			  	<tr>
			  		<th class="con1">다음글</th>
			  		<td class="con2" align="left" style="padding-left: 30px;">
			  			<c:if test="${preVO.preIdx != 0}">
							<a href="${ctp}/adminQuestionContent.boss?idx=${preVO.preIdx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">${preVO.preTitle}</a><br/>
							</c:if>
			  		</td>
			  	</tr>
			  	<tr style="border-bottom: 1px solid #E2E2E2;">
			  		<th class="con1">이전글</th>
			  		<td class="con2" align="left" style="padding-left: 30px;">
			  			<c:if test="${nextVO.nextIdx != 0}">
							<a href="${ctp}/adminQuestionContent.boss?idx=${nextVO.nextIdx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">${nextVO.nextTitle}</a><br/>
							</c:if>
			  		</td>
			  	</tr>
	  		</tbody>
	  	</table>
   </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>