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
	<title>남성용시계</title>
</head>
<body>
	<jsp:include page="/include/serviceHeader.jsp"/>
	<div><img width="100%" src="${ctp}/images/남성용.png"></div><br/><br/><br/><br/>
  <div width=100%>
    <div class="w3-center" >
      <div class="font3">
        <a href="${ctp}/collectionWatch.watch" class="w3-padding-large">컬랙션</a>
        <a href="${ctp}/newWatch.watch" class="w3-padding-large">신제품</a>
        <a href="${ctp}/manWatch.watch" class="w3-padding-large">남성용 시계</a>
        <a href="${ctp}/womanWatch.watch" class="w3-padding-large">여성용 시계</a>
      </div>
    </div>    
    <br/><br/><br/><br/>
    <table border="0" width=90% cellspacing="5" align="center">
      <tr  bgcolor="white">
          <td align="center">
            <a href="${ctp}/mainWatch1.watch"><img width="80%" src="${ctp}/images/시계1.png"><br/>
              <div class="font5">DATEJUST36</div><br/>
              <div class="font6">오이스터, 36mm, 오이스터스틸</div><br/>
            </a>
          </td>
          <td align="center">
            <a href="${ctp}/mainWatch2.watch"><img width="80%" src="${ctp}/images/시계2.png"><br/>
              <div class="font5">GMT-MASTER II</div><br/>
              <div class="font6">오이스터, 40mm, 오이스터스틸과 에버로즈 골드</div><br/>
            </a>
          </td>
          <td align="center">
            <a href="${ctp}/mainWatch3.watch"><img width="80%" src="${ctp}/images/시계3.png"><br/>
              <div class="font5">DAY-DATE 40</div><br/>
              <div class="font6">오이스터, 40mm, 화이트 골드</div><br/>
            </a>
          </td>
      </tr>
      <tr  bgcolor="white">
          <td align="center">
            <a href="${ctp}/mainWatch4.watch"><img width="80%" src="${ctp}/images/시계4.png"><br/>
              <div class="font5">SUBMARINER</div><br/>
              <div class="font6">오이스터, 41mm, 오이스터스틸</div><br/>
            </a>
          </td>
          <td align="center">
            <a href="${ctp}/mainWatch5.watch"><img width="80%" src="${ctp}/images/시계5.png"><br/>
              <div class="font5">OYSTER PERPETUAL 41</div><br/>
              <div class="font6">오이스터, 41mm, 오이스터스틸</div><br/>
            </a>
          </td>
          <td align="center" rowspan="2" >
            <div class="font6">극히 일부의 회사만이<br/> 지속적으로 탁월함을 추구,<br/> 절대적인 것의 탐구,<br/> 독창적인 접근법과<br/> 혁신적인 해결책의 발견을<br/> 지지하고 있습니다.</div>

          </td>
      </tr>
      <tr  bgcolor="white">
          <td align="center">
            <a href="${ctp}/mainWatch6.watch"><img width="80%" src="${ctp}/images/시계6.png"><br/>
              <div class="font5">COSMOGRAPH DAYTONA</div><br/>
              <div class="font6">오이스터, 40mm, 화이트 골드</div><br/>
            </a>
          </td>
          <td align="center">
            <a href="${ctp}/mainWatch7.watch"><img width="80%" src="${ctp}/images/시계7.png"><br/>
              <div class="font5">YACHT-MASTER II</div><br/>
              <div class="font6">오이스터, 44mm, 오이스터스틸과 에버로즈 골드</div><br/>
            </a>
          </td>
      </tr>
      <tr  bgcolor="white">
          <td align="center" rowspan="2" >
            <div class="font6">오이스터(Oyster) 모델에 사용되는 <br/> 퍼페츄얼(Perpetual) 무브먼트는 <br/>롤렉스 시계의 탁월함을 증명하는 핵심 요소입니다.</div><br/>
          </td>
          <td align="center">
            <a href="${ctp}/mainWatch8.watch"><img width="80%" src="${ctp}/images/시계8.png"><br/>
              <div class="font5">SEA-DWELLER</div><br/>
              <div class="font6">오이스터, 43mm, 오이스터스틸과 옐로우골드</div><br/>
            </a>
          </td>
          <td align="center">
            <a href="${ctp}/mainWatch9.watch"><img width="80%" src="${ctp}/images/시계9.png"><br/>
              <div class="font5">EXPLORER</div><br/>
              <div class="font6">오이스터, 36mm, 오이스터스틸과 옐로우 골드</div><br/>
            </a>
          </td> 
      </tr>
      <tr  bgcolor="white">
          <td align="center">
            <a href="${ctp}/mainWatch10.watch"><img width="80%" src="${ctp}/images/시계10.png"><br/>
              <div class="font5">Sky-Dweller</div><br/>
              <div class="font6">오이스터, 42mm, 옐로우 골드</div><br/>
            </a>
          </td>
          <td align="center">
            <a href="${ctp}/mainWatch11.watch"><img width="80%" src="${ctp}/images/시계11.png"><br/>
              <div class="font5">MILGAUSS</div><br/>
              <div class="font6">오이스터, 40mm, 오이스터스틸</div><br/>
            </a>
          </td> 
      </tr>
      <tr  bgcolor="white">
        <td align="center">
          <a href="${ctp}/mainWatch12.watch"><img width="80%" src="${ctp}/images/시계12.png"><br/>
            <div class="font5">CELLINI MOONPHASE</div><br/>
            <div class="font6">39mm, 18캐럿 에버로즈 골드, 폴리싱처리</div><br/>
          </a>
        </td>
        <td align="center" colspan="2">
          <img width="70%" src="${ctp}/images/상세3.jpg">
        </td>
    </tr>
    </table>
    <br/><br/>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>