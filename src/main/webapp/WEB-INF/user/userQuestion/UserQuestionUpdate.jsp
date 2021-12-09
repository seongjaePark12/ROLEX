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
	<title>Q＆A 수정</title>
	 <script>
    function fCheck() {
    	var title = myform.title.value;
    	var content = myform.content.value;
    	
    	if(title.trim() == "") {
    		alert("게시글 제목을 입력하세요");
    		myform.title.focus();
    	}
    	else if(content.trim() == "") {
    		alert("글내용을 입력하세요");
    		myform.content.focus();
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
</head>
<body oncontextmenu = "return false;">
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/serviceNav.jsp"/>
			<div class="container">
		<form name="myform" method="post" action="${ctp}/userQuestionUpdateOk.psj">
			<table class="table table-boderless">
				<tr>
					<td><h2>Q＆A 수정</h2></td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th>글쓴이</th>
					<td>${sMid}</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="title" value="${vo.title}" class="form-control" autofocus required /></td>
				</tr>
				<tr>
					<th>문의유형</th>
					<td>
						<select name="what" id="what" class="custom-select" required >
		              <option value="">문의유형</option>
		              <option value="회원관련" ${vo.what=='회원관련' ? 'selected' : ''}>회원관련</option>
		              <option value="상품관련" ${vo.what=='상품관련' ? 'selected' : ''}>상품관련</option>
		              <option value="예약관련" ${vo.what=='예약관련' ? 'selected' : ''}>예약관련</option>
		              <option value="포인트" ${vo.what=='포인트' ? 'selected' : ''}>포인트</option>
		              <option value="A/S" ${vo.what=='A/S' ? 'selected' : ''}>A/S</option>
		              <option value="기타" ${vo.what=='기타' ? 'selected' : ''}>기타</option>
							</select>
					</td>
				</tr>
				<tr>
					<th>글내용</th>
					<td><textarea rows="6" name="content" class="form-control" required >${vo.content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
						<input type="button" value="글수정" onclick="fCheck()" class="btn btn-outline-warning"/>
						<input type="reset" value="다시입력" class="btn btn-outline-warning"/>
						<input type="button" value="돌아가기" onclick="location.href='${ctp}/userQuestionList.bo';" class="btn btn-outline-warning"/>
					</td>
				</tr>
			</table>
			<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
			<input type="hidden" name="idx" value="${vo.idx}"/>
			<input type="hidden" name="pag" value="${pag}"/>
			<input type="hidden" name="pagSize" value="${pagSize}"/>
		</form>
	</div>
	<br/>	
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>