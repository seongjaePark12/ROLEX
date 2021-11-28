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
	<jsp:include page="/js/userQuestionContentJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<jsp:include page="/css/NoticeContentCss.jsp"/>
	<jsp:include page="/css/QuestionContentCss.jsp"/>
	<title>Q＆A내용</title>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/adminNav.jsp"/>
	<p><br/></p>
	  <div class="container">
	    <h2 style="text-align:center; color: #626262;">
	      <a href="#" style="text-decoration: none;">Q＆A</a>
	    </h2>
	    <br>
	    <p style="text-align:center; color: #626262;"> ROLEX Q＆A입니다.</p>
	    <p><br></p>
	    <table class="table">
	      <tbody>
		      <tr class="text-center">
		        <th class="con1">제목</th>
		        <td class="con2">${vo.title}</td>
		      </tr>
		      <tr class="text-center">
		        <th class="con1">문의유형</th>
		        <td class="con2">${vo.what}</td>
		      </tr>
		      <tr class="text-center">
		        <th class="con1">작성자</th>
		        <td class="con2">${vo.mid}</td>
		      </tr>
		      <tr>
		        <td colspan="2" align="right" style="color:#818381;">
		          작성일 &nbsp;<span class="bb">${fn:substring(vo.wDate,0,19)}</span>
		        </td>
		      </tr>
		      <tr>
		        <td colspan="2" style="height:200px;">
		          <br><br>
		          ${fn:replace(vo.content,newLine,'<br/>')}
		          <br><br>
		        </td>
		      </tr>
		      <tr class="text-center">
		        <td class="con2" colspan="2">
		          <br>
		            <input class="btn btn-outline-warning" type="button" value="돌아가기" onclick="location.href='${ctp}/adminQuestion.boss?pag=${pag}&pageSize=${pageSize}&lately=${lately}';"/>
		       			<input class="btn btn-outline-warning" type="button" value="삭제" onclick="delCheck()"/>
		        </td>
		      </tr>
	   		</tbody>
	    </table>
	    <br/>
	    <c:if test="${sw != 'search'}">
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
	  	</c:if>
	  	<!-- 댓글 출력/입력 처리부분 -->
		<!-- 댓글 입력 -->
		<form name="replyForm" id="replyForm" method="post" action="${ctp}/adminQuestionReplyInput.boss">
			<div class="w3-row-padding">
			  <div class="w3-col m12">
			    <div class="w3-round w3-white">
				    <div class="w3-container w3-padding">
				      <h6 class="w3-opacity"></h6>
				      <textarea rows="4" name="content" id="content" class="form-control">${replyContent}</textarea>
				      <br/>
				      <div>
					      <c:if test="${empty replyContent}"><input type="button" class="btn btn-outline-warning" value="댓글달기" onclick="replyCheck()"/></c:if>
								<c:if test="${!empty replyContent}"><input type="button" class="btn btn-outline-warning" value="댓글수정" onclick="replyUpdateCheck(${replyIdx})"/></c:if>
				   		</div>
				    </div>
				    <input type="hidden" name="questionIdx" value="${vo.idx}"/>
						<input type="hidden" name="mid" value="${sMid}"/>
						<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
						<input type="hidden" name="pag" value="${pag}"/>
						<input type="hidden" name="pagSize" value="${pagSize}"/>
						<input type="hidden" name="lately" value="${lately}"/>
			    </div>
		    </div>
	    </div>
    </form>
    <!-- 댓글 출력 -->
    <c:forEach var="replyVO" items="${replyVOS}">
	    <table class="table">
		    <tbody>
		    	<tr>
		        <th style="text-align:center;">관리자 답변</th>
		        <td>
			        <c:if test="${sMid == replyVO.mid || sMid == 'admin'}">
							  <a href="${ctp}/adminQuestionContent.boss?replyIdx=${replyVO.idx}&idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}" class="btn btn-outline-warning btn-sm">수정</a>
					  	</c:if>
							<c:if test="${sMid == replyVO.mid || sMid == 'admin'}">
							  <a href="javascript:replyDelCheck(${replyVO.idx})" class="btn btn-outline-warning btn-sm">삭제</a>
					  	</c:if>
		        </td>
		        <th style="text-align:center;width:15%;">작성일</th>
		        <td style="width:28%;">2021-02-16</td>
		      </tr>
		      <tr style="border-bottom: 1px solid #EAEAEA; text-align:left;">
		        <td colspan="4">${fn:replace(replyVO.content,newLine,'<br/>')}</td>
		      </tr>
		     <%--  <tr id="cont6" style="border-bottom: 1px solid rgb(234, 234, 234); display: none;">
		        <td colspan="4">
		        	<textarea rows="5" id="text6" style="width:80%;">${fn:replace(replyVO.content,newLine,'<br/>')}</textarea>&nbsp;&nbsp;
		        	  <c:if test="${sMid == replyVO.mid}">
								  <a href="${ctp}/adminQuestionContent.boss?replyIdx=${replyVO.idx}&idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}" class="btn btn-outline-warning w3-margin-bottom">수정</a>
						  	</c:if>
						  	<c:if test="${sMid == replyVO.mid || sMid == 'admin'}">
							  	<a href="javascript:replyDelCheck(${replyVO.idx})" class="btn btn-outline-warning w3-margin-bottom">삭제</a>
					  		</c:if>
		        </td>
		      </tr> --%>
		 	 </tbody>
	   </table>
 	 </c:forEach>
   </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>