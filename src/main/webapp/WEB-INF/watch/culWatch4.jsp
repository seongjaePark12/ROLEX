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
	<title>Lady-Datejust</title>
</head>
<body oncontextmenu = "return false;">
	<jsp:include page="/include/serviceHeader.jsp"/>
     <div width="100%">
    <div><img width="100%" src="${ctp}/images/컬랙션57.png"></div><br/>
    <div class="font1">세련미와 우아함이 돋보이는 롤렉스의 클래식 여성용 시계인 레이디-데이트저스트(Lady-Datejust)는 스타일과 기술적 성능을 대표하는 모델입니다.</div>
    <div class="font2">1957년에 출시된 레이디-데이트저스트는 1945년에 선보인 LB의 상징적인 컬렉션, 데이트저스트(Datejust)의 여성용 버전입니다. 시간을 초월한 우아함과 기능성을 갖춘 이 시계는 28mm의 작은 사이즈로 출시됩니다.</div>
    <br/><br/><br/><br/>
    <h2 align="center">상품 바로가기</h2>
    <table  border="0" width=100% cellspacing=0>
      <tr align="center"> 
        <td >
          <a href="${ctp}/mainWatch13.watch"><img width="80%" src="${ctp}/images/시계21.png"><br/>
            <div class="font5">LADY-DATEJUST</div>
            <div class="font6">오이스터, 40mm, 오이스터스틸과 에버로즈 골드</div>
          </a>
        </td>
        <td >
          <a href="${ctp}/mainWatch16.watch"><img width="80%" src="${ctp}/images/시계24.png"><br/>
            <div class="font5">LADY-DATEJUST</div>
            <div class="font6">오이스터, 28mm, 옐로우 골드와 다이아몬드</div>
          </a>
        </td>
        <td >
          <a href="${ctp}/mainWatch19.watch"><img width="80%" src="${ctp}/images/시계27.png"><br/>
            <div class="font5">LADY-DATEJUST</div>
            <div class="font6">오이스터, 28mm, 오이스터스틸과 에버로즈 골드</div>
          </a>
        </td>
      </tr>  
    </table>
    <br/><br/><br/><br/>
    <div><img width="100%" src="${ctp}/images/컬랙션58.png"></div>
    <br/><br/><br/><br/>
    <div class="font3">다양한 전문 기술</div>
    <div class="font4">여행을 자주 하는 이를 위한 우아한 시계, 스카이-드웰러는 두 개의 시간대를 동시에 표시하며, 
      연간 캘린더 기능을 갖추고 있습니다. 참조 시각은 24시간용 디스크를 통해 24시간 형식으로 표시되며, 현지 시각은 12시간용 일반 시침으로 읽을 수 있습니다.
      사로스(Saros) 연간 캘린더는 30일과 31일이 있는 달을 자동으로 인식합니다. 
      특허를 받은 메커니즘으로 작동하는 사로스 시스템은 다이얼의 둘레에 있는 12개의 창에 현재 월이 빨간색으로 표시되는 혁신적인 디스플레이가 돋보입니다. 
      날짜 변경은 현지 시각에 따라 즉각적으로 이루어집니다</div>
    <br/><br/><br/><br/>
    <div><img width="100%" src="${ctp}/images/컬랙션23.jpg"></div>
    <div><img width="100%" src="${ctp}/images/컬랙션24.jpg"></div>
    <br/><br/><br/><br/>
    <table border ="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><img width="100%" src="${ctp}/images/컬랙션25.jpg"></td>
          <td align="center" width="50%">
            <div class="font3">레이디-데이트저스트(Lady-Datejust)는 각자의 개성에 따라 스타일을 선택할 수 있도록 다양한 모델을 선보입니다. 오이스터스틸(Oystersteel), 
              18캐럿 옐로우 골드나 에버로즈(Everose) 골드, 또는 오이스터스틸과 18캐럿 골드가 조화를 이룬 롤레조(Rolesor) 버전으로 만나볼 수 있습니다</div>
          </td> 
      </tr>
    </table>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3">플루티드, 돔드 또는 다이아몬드가 세팅된 베젤 고급스러운 다이아몬드로 파베 세팅되어 은은하게 빛나는 다이얼 또는 매혹적인 빛깔의 진주자개 다이얼. 심플하거나 보석이 세팅된 시각 표식 또는 로마 숫자.
            다양한 매력을 간직한 레이디-데이트저스트는 오이스터 퍼페츄얼(Oyster Perpetual) 컬렉션에서 가장 폭넓은 모델을 갖추고 있습니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/컬랙션27.jpg"></td>
      </tr>
    </table>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>