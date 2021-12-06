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
	<title>Pearlmaster</title>
</head>
<body>
	<jsp:include page="/include/serviceHeader.jsp"/>
  <div width="100%">
    <div><img width="100%" src="${ctp}/images/컬랙션62.png"></div><br/>
    <br/><br/><br/><br/>
    <div class="font1">오이스터 퍼페츄얼 펄마스터는 
      세련미와 우아함을 대표하는 주얼리 워치메이킹으로 오이스터 컬렉션에 특별하게 자리잡고 있습니다</div><br/>
      <div class="font2">펄마스터는 18캐럿 골드와 다이아몬드로 정교함의 정수를 간직하고 있습니다</div>
    <br/><br/><br/><br/>
    <h2 align="center">상품 바로가기</h2>
    <table  border="0" width=100% cellspacing=0>
      <tr align="center"> 
        <td  colspan="2">
          <a href="${ctp}/mainWatch14.watch"><img width="40%" src="${ctp}/images/시계22.png"><br/>
            <div class="font3">PEARLMASTER 39</div>
            <div class="font4">오이스터, 39mm, 화이트 골드와 다이아몬드</div>
          </a>
        </td>
      </tr>  
    </table>
    <br/><br/><br/><br/>
    <div><img width="100%" src="${ctp}/images/컬랙션33.jpg"></div>
    <br/><br/><br/><br/>
    <table border ="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><img width="100%" src="${ctp}/images/컬랙션34.jpg"></td>
          <td align="center" width="50%">
            <div class="font3">매혹적인 디자인</div>
            <div class="font3">펄마스터는 완만한 곡선과 눈부신 다이아몬드를 정교하게 세팅한 다이얼이 돋보이는 모델입니다. </div>
            </td> 
      </tr>
    </table>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3">펄마스터 모델은 롤렉스가 자체 주조한 18캐럿 화이트 골드 또는 에버로즈(Everose) 골드로만 제작됩니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/컬랙션35.jpg"></td>
      </tr>
    </table>
    <br/><br/>
    <table border ="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><img width="100%" src="${ctp}/images/컬랙션36.jpg"></td>
          <td align="center" width="50%">
            <div class="font3">펄마스터를 우아하게 장식한 다이아몬드들은 엄격한 기준에 따라 선정되며, 보석의 가장 강렬한 광채를 최대한 끌어낼 수 있는 정교한 전통 기법으로 세팅합니다. 
              롤렉스가 보유한 자체 보석학 연구소에서는 숙련된 전문가들이 보석의 품질을 관리합니다.</div>
          </td> 
      </tr>
    </table>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>