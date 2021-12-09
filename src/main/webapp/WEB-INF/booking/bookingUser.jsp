<%@page import="dao.BookingDAO"%>
<%@page import="vo.BookingVO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
  String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
  String ymd = request.getParameter("ymd")==null ? "" : request.getParameter("ymd");
  
  // Calendar.Month 값? 0~11  ==>> 1월~12월
  // Calendar.DAY_OF_WEEK 값? 1~7 ==>> 일~토요일
  
  Calendar calToday = Calendar.getInstance(); // 오늘 날짜를 저장할 변수
  Calendar cal = Calendar.getInstance();			// 화면에 표시되는 오늘날짜기준으로 사용하는 변수
  
  int yy = request.getParameter("yy")==null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
  int mm = request.getParameter("mm")==null ? cal.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
  
  if(!ymd.equals("")) {    // ymd : 2024-2-23
  	String[] ymdArray = ymd.split("-");
  	yy = Integer.parseInt(ymdArray[0]);
  	mm = Integer.parseInt(ymdArray[1])-1;
  }
  
  cal.set(yy, mm, 1);
  int startWeek = cal.get(Calendar.DAY_OF_WEEK);
  
  if(mm < 0) {
  	yy--;
  	mm = 11;
  }
  if(mm > 11) {
  	yy++;
  	mm = 0;
  }
  
%>
<!DOCTYPE html>
<html>
<head >
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<title>방문예약</title>
</head>
<body oncontextmenu = "return false;">
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/userNav.jsp"/>
<p><br></p>
<div class="container">
  <font size="5">나의예약</font> &nbsp; &nbsp;
    <a href="${ctp}/bookingUser.boo?yy=<%=yy-1%>&mm=<%=mm%>" title="이전년도">◁◁</a>
    <a href="${ctp}/bookingUser.boo?yy=<%=yy%>&mm=<%=mm-1%>" title="이전월">◀</a>
    (<%=yy%>년 <%=mm+1%>월)
    <a href="${ctp}/bookingUser.boo?yy=<%=yy%>&mm=<%=mm+1%>" title="다음월">▶</a>
    <a href="${ctp}/bookingUser.boo?yy=<%=yy+1%>&mm=<%=mm%>" title="다음년도">▷▷</a>
    &nbsp; &nbsp;
    <a href="${ctp}/schedule.sc" title="오늘날짜">■</a>
  <br/>
  <table class="table table-bordered text-left align-top">
  	<tr class="table-warning text-center">
  	  <th><font color="red">일</font></th>
  	  <th>월</th>
  	  <th>화</th>
  	  <th>수</th>
  	  <th>목</th>
  	  <th>금</th>
  	  <th><font color="blue">토</font></th>
  	</tr>
  	<tr style="height:80px;">
<%
		for(int i=1; i<startWeek; i++) {
			out.println("<td>&nbsp;</td>");
		}

		BookingDAO dao = new BookingDAO();
		
		while(cal.get(Calendar.MONTH) == mm) {
			String booTime = "", content = "";
			ymd = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DATE);  // 화면에 표시되는 일자(년월일)를 ymd변수로 셋팅
			BookingVO vo = dao.getBookingUserContent(ymd, mid);
			
			if(vo.getBooTime() != null) booTime = vo.getBooTime()+"예약";
			if(vo.getContent() != null) content = vo.getContent();
				
			if(cal.get(Calendar.DAY_OF_WEEK) == 1) {
				out.println("<td><a href='bookingContent.boo?ymd="+ymd+"'><font color='red'>"+cal.get(Calendar.DATE)+"</font></a><br/><span title='"+content+"'>"+booTime+"</span></td>");
			}
			else if(cal.get(Calendar.DAY_OF_WEEK) == 7) {
				out.println("<td><a href='bookingContent.boo?ymd="+ymd+"'><font color='blue'>"+cal.get(Calendar.DATE)+"</font></a><br/><span title='"+content+"'>"+booTime+"</span></td>");
			}
			else if(cal.get(Calendar.YEAR)==calToday.get(Calendar.YEAR) && cal.get(Calendar.MONTH)==calToday.get(Calendar.MONTH) && cal.get(Calendar.DATE)==calToday.get(Calendar.DATE)) {
				out.println("<td style='background-color:skyblue'><a href='bookingContent.boo?ymd="+ymd+"'><b>"+cal.get(Calendar.DATE)+"</b></a><br/><span title='"+content+"'>"+booTime+"</span></td>");
			}
			else {
				out.println("<td><a href='bookingContent.boo?ymd="+ymd+"'><font color='#000'>"+cal.get(Calendar.DATE)+"</font></a><br/><span title='"+content+"'>"+booTime+"</span></td>");
			}
			
			if(cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
				out.println("</tr><tr style='height:80px;'>");
			}
			
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
		}
		if(cal.get(Calendar.DAY_OF_WEEK) <= 7) {
			for(int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) {
				out.println("<td>&nbsp;</td>");
			}
		}
%>
  	</tr>
  </table>
</div>
<br/>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>