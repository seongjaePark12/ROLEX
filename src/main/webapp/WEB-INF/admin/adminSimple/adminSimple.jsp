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
  	
  	//부분검색
  	function whatCheck() {
		  var what = whatForm.what.value;
		  location.href = "${ctp}/adminSimple.boss?pag=${pag}&pageSize=${pageSize}&what="+what;
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
		 		<td class="text-right p-0">
	      	<c:if test="${sLevel == 0 }">
	        	<a href="${ctp}/adminSimpleInput.boss" class="btn btn-outline-warning btn w3-border w3-round-xxlarge font6 m-0">글쓰기</a>
	        </c:if>
     		</td>
     	</tr>
     	<tr>	
     		<td class="text-left">
     			<form name="whatForm">
						<select name="what" id="what" onchange="whatCheck()" class="w3-panel w3-border w3-round-xxlarge m-0">
	            <option value="분류" ${what == '분류' ? 'selected' : '' }>분류</option>
	            <option value="회원문의" ${what == '회원문의' ? 'selected' : '' }>회원문의</option>
	            <option value="상품관련" ${what == '상품관련' ? 'selected' : '' }>상품관련</option>
	            <option value="예약관련" ${what == '예약관련' ? 'selected' : '' }>예약관련</option>
	            <option value="포인트" ${what == '포인트' ? 'selected' : '' }>포인트</option>
	            <option value="A/S" ${what == 'A/S' ? 'selected' : '' }>A/S</option>
	            <option value="기타" ${what == '기타' ? 'selected' : '' }>기타</option>
	            <option value="TIP" ${what == 'TIP' ? 'selected' : '' }>TIP</option>
						</select>
					</form>
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
		<div class="accordion text-left">
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<div class="item"><h6><span style="margin: 0 30px 0 50px;">${st.count}</span><span style="margin-left: 50px;">${vo.title}</span></h6></div>
					<div class="w3-animate-zoom" style="display: none;">
						<br/>
						<span style="margin-left: 50px;">${fn:replace(vo.content,newLine,'<br/>')}
							<c:if test="${sLevel == 0}">
			 					<a href="javascript:DelCheck(${vo.idx})" class="btn btn-outline-warning btn-sm ">삭제</a>
			 				</c:if>
		 				</span>
		 				<br/>
					</div>
					<hr/>			
			</c:forEach>
		</div>
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
		$(document).ready(function() {
		    'use strict';
		    $('.item').on("click", function () {
		        $(this).next().slideToggle(100);
		        $('p').not($(this).next()).slideUp('fast');
		    });
		});    
</script>
</body>
</html>