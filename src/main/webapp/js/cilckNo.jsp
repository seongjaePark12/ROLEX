<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
	<script >
	// F12 버튼 방지 
	$(document).ready(function(){ 
		$(document).bind('keydown',function(e){ 
			if ( e.keyCode == 123 /* F12 */) { 
				e.preventDefault(); 
				e.returnValue = false; 
				} 
			}); 
		}); 
	// 우측 클릭 방지 
	document.onmousedown=disableclick; 
	
	function disableclick(event){ 
		if (event.button==2) { 
			return false; 
			} 
		} 
	</script>