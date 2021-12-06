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
	<title>롤렉스컬랙션</title>
</head>
<body>
	<jsp:include page="/include/serviceHeader.jsp"/>
  <div><img width="100%" src="${ctp}/images/컬랙션99.jpg"></div><br/><br/><br/><br/>
  <div class="font1">누구나 한눈에 알아볼 수 있는, 시간을 초월한 스타일</div><br/><br/>
  <div class="font2">
    롤렉스 오이스터 퍼페츄얼 클래식 시계와 첼리니 컬렉션은 롤렉스의 탁월한 노하우와 완벽함에 대한 높은 기준을 바탕으로 시대를 초월한 워치메이킹 전통을 부각시키는 디자인은 구성되어 있습니다.<br/>
  </div>
  <br/><br/><br/><br/>
  <div width=100% >
    <div>
        <div align="center"><a href="${ctp}/cul1.watch"><img width="80%" src="${ctp}/images/컬랙션1.png"></a></div>
    </div>
    <div>
      <div width="90%"  align="center">
        <a href="${ctp}/cul1.watch">
          <div class="font3">Datejust</div><br/>
          <div class="font4">대표적인 클래식 시계</div><br/>
        </a>
      </div> 
    </div>
  </div>
  <br/><br/>
  <table border="0" width=100% cellspacing=0>
    <tr>
        <td align="center"><a href="${ctp}/cul2.watch"><img width="80%" src="${ctp}/images/컬랙션3.jpg"></a></td>
        <td align="center"><a href="${ctp}/cul3.watch"><img width="80%" src="${ctp}/images/컬랙션4.jpg"></a></td>
    </tr>
    <tr>
      <td  width="50%" align="center">
        <a href="${ctp}/cul2.watch">
          <div class="font3">Sky-Dweller</div><br/>
          <div class="font4">세계의 시간을 확인하는 시계</div><br/>
        </a>
      </td> 
      <td width="50%"align="center" >
        <a href="${ctp}/cul3.watch">
          <div class="font3">Day-Date</div><br/>
          <div class="font4">품격 있는 시계의 상징</div><br/>
        </a>
      </td> 
    </tr>
  </table>
  <br/><br/>
  <table border="0" width=100% cellspacing=0>
    <tr>
        <td align="center"><a href="${ctp}/cul4.watch"><img width="80%" src="${ctp}/images/컬랙션5.jpg"></a></td>
        <td align="center"><a href="${ctp}/cul5.watch"><img width="80%" src="${ctp}/images/컬랙션2.jpg"></a></td>
    </tr>
    <tr>
      <td  width="50%" align="center">
        <a href="${ctp}/cul4.watch">
          <div class="font3">Lady-Datejust</div><br/>
          <div class="font4">우아하고 세련된 디자인</div><br/>
        </a>
      </td> 
      <td width="50%" align="center">
        <a href="${ctp}/cul5.watch">
          <div class="font3">Oyster Perpetual</div><br/>
          <div class="font4">오이스터의 정수</div><br/>
        </a>
      </td> 
    </tr>
  </table>
  <br/><br/>
  <table border="0" width=100% cellspacing=0>
    <tr>
        <td align="center"><a href="${ctp}/cul6.watch"><img width="80%" src="${ctp}/images/컬랙션6.jpg"></a></td>
        <td align="center"><a href="${ctp}/cul7.watch"><img width="80%" src="${ctp}/images/컬랙션7.jpg"></a></td>
    </tr>
    <tr>
      <td  width="50%" align="center">
        <a href="${ctp}/cul6.watch">
          <div class="font3">Pearlmaster</div><br/>
          <div class="font4">오이스터 컬렉션의 진주</div><br/>
        </a>
      </td> 
      <td width="50%" align="center">
        <a href="${ctp}/cul7.watch">
          <div class="font3">Cellini</div><br/>
          <div class="font4">클래식 시계</div><br/>
        </a>
      </td> 
    </tr>
  </table>
  <br/><br/>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>