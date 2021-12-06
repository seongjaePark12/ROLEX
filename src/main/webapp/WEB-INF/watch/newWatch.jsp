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
	<title>롤렉스신제품</title>
</head>
<body>
	<jsp:include page="/include/serviceHeader.jsp"/>
 <div width=100%>
    <div><img width="100%" src="${ctp}/images/컬랙션56.png"></div><br/><br/><br/><br/>
    <div class="font1">롤렉스가 독특한 워치메이킹 전문 기술이 돋보이는 신제품을 선보입니다.</div><br/><br/>
    <div class="font2">
      이 시계들은 가장 깊은 동굴에서 가장 높은 산봉우리로, 태양계의 바깥쪽에서 고립된 극지방으로, 초정밀 기술에서 정교한 장인정신으로 우리를 안내합니다. 지리적, 기술적 또는 미적 모험으로 우리를 초대하는 놀라운 시계들입니다.<br/>
    </div>
    <br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td align="center"><a href="${ctp}/newWatch2.watch"><img width="80%" src="${ctp}/images/신제품.jpg"></a></td>
      </tr>
      <tr>
        <td width="90%"  align="center">
          <a href="${ctp}/cul1.watch">
            <div class="font3">익스플로러의 새로운 영토</div><br/>
            <div class="font4">Explorer II</div><br/>
          </a>
        </td> 
      </tr>
    </table>
    <br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr>
          <td align="center"><a href="${ctp}/cul1.watch"><img width="80%" src="${ctp}/images/신제품2.jpg"></a></td>
          <td align="center"><a href="${ctp}/cul4.watch"><img width="80%" src="${ctp}/images/신제품3.jpeg"></a></td>
      </tr>
      <tr>
        <td  width="50%" align="center">
          <a href="${ctp}/cul4.watch">
            <div class="font3">독창적인 디자인의 특별한 다이얼</div><br/>
            <div class="font4">Datejust36</div><br/>
          </a>
        </td> 
        <td width="50%" align="center">
          <a href="${ctp}/cul5.watch">
            <div class="font3">다이아몬드의 화려한 광체</div><br/>
            <div class="font4">Lady-Datejust</div><br/>
          </a>
        </td> 
      </tr>
    </table>
    <br/><br/>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>