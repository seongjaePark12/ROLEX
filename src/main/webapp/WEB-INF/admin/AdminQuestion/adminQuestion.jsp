<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<title>공지사항</title>
	<script>
  	function delCheck(idx) {
			var ans = confirm("방문소감을 삭제하시겠습니까?");
			if(ans) location.href="${}/GDelete?idx="+idx;
		}
  </script>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<div class="container">
  <table class="table table-borderless">
    <tr>
      <td colspan="2" style="text-align:center;"><h2>공 지 사 항</h2></td>
    </tr>
    <tr>
      <td>
      	<a href="${ctp}/question/questionInput.boss" class="btn btn-secondary">글쓰기</a>
      </td>
    </tr>
  </table>
	  <table class="table table-borderless">
	    <tr>
	      <td>
	        ${curScrStartNo}
	      </td>
	    </tr>
	  </table>
	  <table class="table table-bordered">
	    <tr>
	    	<th>번호</th>
	      <th>제목</th>
	      <th>작성자</th>
	      <th>작성일</th>
	    </tr>
	    <tr>
	      <th>글내용</th>
	    </tr>
	  </table>
	  <br/>
</div>

	<jsp:include page="/include/footer.jsp"/>
</body>
</html>