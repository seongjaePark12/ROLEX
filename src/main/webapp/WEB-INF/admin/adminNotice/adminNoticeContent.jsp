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
	<jsp:include page="/js/noticeContentJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<jsp:include page="/css/NoticeContentCss.jsp"/>
	<title>공지사항내용</title>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/adminNav.jsp"/>
	<p><br/></p>
	  <div class="container">
	    <h2 style="text-align:center; color: #626262;">
	      <a href="${ctp}/adminNotice.boss" style="text-decoration: none;">NOTICE</a>
	    </h2>
	    <br>
	    <p style="text-align:center; color: #626262;">ROLEX 공지사항입니다.</p>
	    <p><br></p>
	    <table class="table">
	      <tbody>
		      <tr class="text-center">
		        <th class="con1 table-warning">제목</th>
		        <td class="con2">${vo.title}</td>
		      </tr>
		      <tr class="text-center">
		        <th class="con1 table-warning">작성자</th>
		        <td class="con2">${vo.mid}</td>
		      </tr>
		      <tr>
		        <td colspan="2" align="right" style="color:#818381;">
		          작성일 &nbsp;<span class="bb">${fn:substring(vo.wDate,0,19)}</span> &nbsp;&nbsp;&nbsp;&nbsp; 조회수 &nbsp;<span class="bb">${vo.readNum}</span>
		        </td>
		      </tr>
		      <tr>
		        <td colspan="2" style="height:200px;">
				     <c:set var="fSName" value="${vo.fSName}"/>
		       	 <c:set var="fSNames" value="${fn:split(fSName,'/')}"/>
		       	 <c:forEach var="fSName" items="${fSNames}" varStatus="st">
		       	 	<c:set var="fSNameLen" value="${fn:length(fSName)}"/>
		       	 	<c:set var="ext" value="${fn:substring(fSName,fSNameLen-3,fSNameLen)}"/>
		       	 	<c:set var="extUpper" value="${fn:toUpperCase(ext)}"/>
		       	 	<c:if test="${extUpper=='JPG'||extUpper=='GIF'||extUpper=='PNG'}">
		       	 		<img src="${ctp}/data/notice/${fSName}" width="350px"/><br/>
		       	 	</c:if>
		       	 </c:forEach>
		          <br><br>
		          ${fn:replace(vo.content,newLine,'<br/>')}
		          <br><br>
		        </td>
		      </tr>
		      <tr class="text-center">
		        <td class="con2" colspan="2">
		          <br>
		            <input class="btn btn-outline-warning" type="button" value="돌아가기" onclick="location.href='${ctp}/adminNotice.boss?pag=${pag}&pageSize=${pageSize}&lately=${lately}';"/>
		        		<input class="btn btn-outline-warning" type="button" value="수정" onclick="location.href='${ctp}/adminNoticeUpdate.boss?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}';"/>
		     				<input class="btn btn-outline-warning" type="button" value="삭제" onclick="delCheck()"/>
		        </td>
		      </tr>
	   		</tbody>
	    </table>
	    <br/>
	    <c:if test="${sw != 'search'}">
	    <table class="table">
		  	<tbody>
			  	<tr style="border-bottom: 1px solid #E2E2E2;">
			  		<th class="con1">이전글</th>
			  		<td class="con2" align="left" style="padding-left: 30px;">
			  			<c:if test="${nextVO.nextIdx != 0}">
							<a href="${ctp}/adminNoticeContent.boss?idx=${nextVO.nextIdx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">${nextVO.nextTitle}</a><br/>
							</c:if>
			  		</td>
			  	</tr>
			  	<tr>
			  		<th class="con1">다음글</th>
			  		<td class="con2" align="left" style="padding-left: 30px;">
			  			<c:if test="${preVO.preIdx != 0}">
							<a href="${ctp}/adminNoticeContent.boss?idx=${preVO.preIdx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">${preVO.preTitle}</a><br/>
							</c:if>
			  		</td>
			  	</tr>
	  		</tbody>
	  	</table>
	  	</c:if>
 	 </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>