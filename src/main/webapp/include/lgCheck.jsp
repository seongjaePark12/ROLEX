<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String checkMid = (String) session.getAttribute("sMid");
	if(checkMid == null){
		out.println("<script>");
		out.println("alert('로그인후 사용하세요!')");
		out.println("location.href='"+request.getContextPath()+"/userLogin.psj';");
		out.println("</script>");
	}
%>