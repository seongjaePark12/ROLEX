<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<script>
	function userDelete(){
		var ans = confirm("정말 탈퇴하시겠습니까?");
		if(ans){
			ans = confirm("탈퇴후 1개월간은 같은 아이디로 가입하실수 없습니다 \n 탈퇴 하시겠습니까?");
			if(ans) location.href="${ctp}/userDelete.psj";
		}
	}
</script>