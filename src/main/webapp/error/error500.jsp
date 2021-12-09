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
	<jsp:include page="/js/cilckNo.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<title>500</title>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<jsp:include page="/include/serviceHeader.jsp"/>
	<br/><br/><br/><br/><br/>
	<table>
    <tr>
      <td><img width="100%" src="${ctp}/images/error.png"></td>
      <td align="center">
        <div class="font1">AWWW...DON'T CRY.</div><br/>
        <div class="font2">it's just a 500 Error!</div><br/>
        <div class="font2">What you’re looking for may have been misplaced in Long Term Memory.</div><br/>
        <div><a href="https://www.instagram.com/sj__619/"><i class="fab fa-instagram font1">sj__619</i></a></div>
      	<br/>
      	<a href="${ctp}/" class="btn btn-outline-secondary">메인으로</a>
      </td> 
    </tr>
   </table>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>