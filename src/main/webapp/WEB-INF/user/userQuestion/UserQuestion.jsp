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
	<jsp:include page="/js/userNoticeJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<title>Q＆A</title>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/serviceNav.jsp"/>
	<p><br/></p>
	<div class="container">
		<table class="table table-borderless">
	    <tr>
	      <td colspan="2" class="p-0 text-center"><h2>Q＆A</h2></td>
	    </tr>
	    <tr>
	      <td class="text-left p-0">
	      	<c:if test="${sLevel == 1 || sLevel == 2 ||sLevel == 3 ||sLevel == 4 ||sLevel == 5 }">
	        	<a href="${ctp}/userQuestionInput.psj" class="btn btn-outline-warning btn-sm w3-border w3-round-xxlarge font6">글쓰기</a>
	        </c:if>
	        <select class="w3-panel w3-border w3-round-xxlarge font6" name="lately"  id="lately" onchange="latelyCheck()">
	        	<option value="0">최근자료순</option>
	        	<c:forEach var="i" begin="1" end="30">
	        		<option value="${i}" ${lately == i ? 'selected' : ''}>${i}일전</option>
	        	</c:forEach>
	        </select>
	      </td>
	      <td class="text-right p-0">
					<select class="w3-panel w3-border w3-round-xxlarge font6" name="pageSize" id="pageSize" onchange="pageCheck()">
						<option value="5" ${pageSize==5 ? 'selected' : ''}>5건</option>
						<option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
						<option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
						<option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
					</select>
	      </td>
	    </tr>
	  </table>
	  <table class="table table-hover text-center">
	  	<thead>
	    <tr class="tablehead table-warning text-dark ">
	      <th style="width:5%">번호</th>
	      <th style="width:50%">문의내용</th>
	      <th style="width:15%">문의유형</th>
	      <th style="width:10%">답변</th>
	      <th style="width:10%">작성자</th>
	      <th style="width:10%">작성일</th>
	    </tr>
	    </thead>
	    <c:forEach var="vo" items="${vos}">
		    <tr>
		      <td>${curScrStartNo}</td>
		      <td>
		      	<a href="${ctp}/userQuestionContent.psj?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">${vo.title}</a>
		      	<c:if test="${vo.wNdate <= 24}"><img src="${ctp}/images/new.gif" width="40px" height="20px"/></c:if>
		      </td>
		      <td>
		      	${vo.what}
		      </td>
		      <td>
		      	<c:if test="${vo.replyCount == 0}"><font color="mauve">답변대기</font></c:if>
		      	<c:if test="${vo.replyCount != 0}"><font color="skyblue">답변완료</font></c:if>
		      </td>
		      <td>${vo.mid}</td>
		      <td>
		      	<c:if test="${vo.wNdate <= 24}">${fn:substring(vo.wDate,11,16)}</c:if>
		      	<c:if test="${vo.wNdate > 24}">${fn:substring(vo.wDate,0,10)}</c:if>
		      </td>
		    </tr>
		    <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
	    </c:forEach>
	  </table>
	  
	  <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
			<c:if test="${totPage != 0}">
				<c:if test="${pag != 1}">
					<li class="page-item"><a href="userQuestion.psj?pag=1&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="userQuestion.psj?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item active"><a href='userQuestion.psj?pag=${i}&pageSize=${pageSize}&lately=${lately}' class="page-link text-dark bg-warning border-warning">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='userQuestion.psj?pag=${i}&pageSize=${pageSize}&lately=${lately}' class="page-link text-dark">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="userQuestion.psj?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="userQuestion.psj?pag=${totPage}&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="마지막">▶▶</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
<!-- 블록 페이징처리 끝 -->
	<!-- 검색기 처리 시작 -->
	<div class="container text-center">
		<form name="searchForm" method="post" action="${ctp}/adminQuestionSearch.boss">
			<b>검색 : </b>
			<select class="w3-panel w3-border w3-round-xxlarge font6" name="search" onchange="searchChange()">
				<option value="title">글제목</option>
				<!-- <option value="mid">글쓴이</option> -->
				<option value="content">글내용</option>
			</select>
			<input class="w3-border w3-round-xxlarge font6" type="text" name="searchString"/>
			<input class="w3-round-xxlarge w3-border font6 btn-outline-warning" type="button" value="검색" onclick="searchCheck()"/>
			<input type="hidden" name="pag" value="${pag}"/>
			<input type="hidden" name="pagSize" value="${pagSize}"/>
		</form>
	</div>
	<!-- 검색기 처리 끝 -->
	</div>
	<br/>	
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>