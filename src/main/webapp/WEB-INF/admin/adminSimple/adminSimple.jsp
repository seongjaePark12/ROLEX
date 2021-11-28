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
	<title>자주하는질문</title>
	<script>
  	// 댓글 삭제
  	function DelCheck(idx){
  		var query = {idx : idx};
  		var ans = confirm("삭제 하시겠습니까?");
  		if(!ans) return;
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/adminSimpleDelete.boss",
  			data : query,
  			success:function(){
  				location.reload();
  			}
  		});
  	}
	</script>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/adminNav.jsp"/>
	<div class="container section">
		<table class="table table-borderless">
	    <tr>
	      <td colspan="2" class="p-0 text-center"><h2>자주하는질문</h2></td>
	    </tr>
			<tr>
		 		<td class="text-left p-0">
	      	<c:if test="${sLevel == 0 }">
	        	<a href="${ctp}/adminSimpleInput.boss" class="btn btn-outline-warning btn w3-border w3-round-xxlarge font6">글쓰기</a>
	        </c:if>
     		</td>
	    </tr>
	  </table>
		<table class="table text-center">
			<thead>
	    <tr class="tablehead table-warning text-dark ">
	      <th style="width:20%">번호</th>
	      <th style="width:80%">제목</th>
	    </tr>
	    </thead>
		</table>
		<c:forEach var="vo" items="${vos}">
		<div onclick="myFunction('Demo1')" class="w3-block w3-left-align"><h6><span style="margin: 0 30px 0 50px;font-weight: 400;">번호</span><span style="margin-left: 50px;">${vo.title}</span></h6></div>
			<div id="Demo1" class="w3-hide w3-animate-zoom">
				<div class="text-center">${fn:replace(vo.content,newLine,'<br/>')}
					<c:if test="${sLevel == 0}">
	 					<a href="javascript:DelCheck(${vo.idx})" class="btn btn-outline-warning btn-sm ">삭제</a>
	 				</c:if>
 				</div>
			</div>
		<hr/>			
		</c:forEach>
			  <!-- 블록 페이징처리 시작(bs4 스타일 적용) -->
			<div class="container">
				<ul class="pagination justify-content-center">
					<c:if test="${totPage == 0}"><p style="text-align:center">자료가 없습니다</p></c:if>
					<c:if test="${totPage != 0}">
						<c:if test="${pag != 1}">
							<li class="page-item"><a href="adminSimple.boss?pag=1&pageSize=${pageSize}" class="page-link text-warning" title="첫페이지">◀◀</a></li>
						</c:if>
						<c:if test="${curBlock > 0}">
							<li class="page-item"><a href="adminSimple.boss?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-warning" title="이전">◀</a></li>
						</c:if>
						<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}">
							<c:if test="${i == pag && i <= totPage}">
								<li class="page-item active"><a href='adminSimple.boss?pag=${i}&pageSize=${pageSize}' class="page-link text-dark bg-warning border-warning">${i}</a></li>
							</c:if>
							<c:if test="${i != pag && i <= totPage}">
								<li class="page-item"><a href='adminSimple.boss?pag=${i}&pageSize=${pageSize}' class="page-link text-dark">${i}</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${curBlock < lastBlock}">
							<li class="page-item"><a href="adminSimple.boss?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="page-link text-warning" title="다음">▶</a></li>
						</c:if>
						<c:if test="${pag != totPage}">
							<li class="page-item"><a href="adminSimple.boss?pag=${totPage}&pageSize=${pageSize}" class="page-link text-warning" title="마지막">▶▶</a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
		<!-- 블록 페이징처리 끝 -->
	<jsp:include page="/include/footer.jsp"/>
	<script>
		function myFunction(id) {
		  var x = document.getElementById(id);
		  if (x.className.indexOf("w3-show") == -1) {
		    x.className += " w3-show";
		  } else { 
		    x.className = x.className.replace(" w3-show", "");
		  }
		}
</script>
</body>
</html>