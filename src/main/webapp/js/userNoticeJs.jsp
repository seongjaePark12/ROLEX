<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<script>
  	function pageCheck(){
  		var pageSize = document.getElementById("pageSize").value;
  		location.href= "UserNotice.psj?page=${pag}&pageSize="+pageSize;
  	}
  	
  	// 최근 게시글 검색
  	function latelyCheck(){
  		var lately = document.getElementById("lately").value;
  		if(lately == ""){
  			alert("검색일자를 선택하세요");
  		}
  		else{
  			location.href="${ctp}/UserNotice.psj?page=${pag}&pageSize=${pageSize}&lately="+lately;		
  		}
  	}
  	
  	//검색 콤보상자 선택시 커서를 검색어 입력창으로 이동하기
  	function searchChange(){
  		searchForm.searchString.focus();
  	}
  	
  	//검색 버튼 클릭시 수행할 내용
  	function searchCheck(){
  		var searchString = searchForm.searchString.value;
  		if(searchString == ""){
  			alert("검색어를 입력하세요");
  			searchForm.searchString.focus();
  		}
  		else{
  			searchForm.submit();
  		}
  	}
  </script>