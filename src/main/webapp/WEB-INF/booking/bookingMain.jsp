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
	<title>예약페이지</title>
	<script>
	  function pageCheck(){
  		var pageSize = document.getElementById("pageSize").value;
  		location.href= "bookingMain.boo?page=${pag}&pageSize="+pageSize;
  	}
  	
  	// 최근 게시글 검색
  	function latelyCheck(){
  		var lately = document.getElementById("lately").value;
  		if(lately == ""){
  			alert("검색일자를 선택하세요");
  		}
  		else{
  			location.href="${ctp}/bookingMain.boo?page=${pag}&pageSize=${pageSize}&lately="+lately;		
  		}
  	}
	</script>
</head>
<body oncontextmenu = "return false;">
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/adminNav.jsp"/>
	<p><br/></p>
	<div class="container">
		<table class="table table-borderless">
	    <tr>
	      <td colspan="2" class="p-0 text-center"><h2>예약내역</h2></td>
	    </tr>
	    <tr>
	      <td class="text-left p-0">
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
	    <tr class="table-warning text-dark ">
	      <th style="width:10%">번호</th>
	      <th style="width:50%">아이디</th>
	      <th style="width:15%">예약일</th>
	      <th style="width:15%">분류</th>
	    </tr>
	    <c:forEach var="vo" items="${vos}">
		    <tr>
		      <td>${curScrStartNo}</td>
		      <td>
		      	<a href="${ctp}/bookingAdminContent.boo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}">${vo.mid}</a>
		      	<c:if test="${vo.wNdate <= 24}"><img src="${ctp}/images/new.gif" width="40px" height="20px"/></c:if>
		      </td>
		      <td>
		      	${fn:substring(vo.booDate,0,10)}
		      </td>
		      <td>${vo.content}</td>
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
					<li class="page-item"><a href="bookingMain.boo?pag=1&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="첫페이지">◀◀</a></li>
				</c:if>
				<c:if test="${curBlock > 0}">
					<li class="page-item"><a href="bookingMain.boo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="이전">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
					<c:if test="${i == pag && i <= totPage}">
						<li class="page-item active"><a href='bookingMain.boo?pag=${i}&pageSize=${pageSize}&lately=${lately}' class="page-link text-dark bg-warning border-warning">${i}</a></li>
					</c:if>
					<c:if test="${i != pag && i <= totPage}">
						<li class="page-item"><a href='bookingMain.boo?pag=${i}&pageSize=${pageSize}&lately=${lately}' class="page-link text-dark">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${curBlock < lastBlock}">
					<li class="page-item"><a href="bookingMain.boo?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="다음">▶</a></li>
				</c:if>
				<c:if test="${pag != totPage}">
					<li class="page-item"><a href="bookingMain.boo?pag=${totPage}&pageSize=${pageSize}&lately=${lately}" class="page-link text-warning" title="마지막">▶▶</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
<!-- 블록 페이징처리 끝 -->
	</div>
	<br/>	
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>