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
	<title>Day-Date</title>
</head>
<body oncontextmenu = "return false;">
	<jsp:include page="/include/serviceHeader.jsp"/>
  <div width="100%">
    <div><img width="100%" src="${ctp}/images/컬랙션55.png"></div><br/>
    <div class="font1">1956년, 탄생한 데이-데이트(Day-Date)는 다이얼에 날짜뿐만 아니라 약자가 아닌 전체 단어로 표시된 요일이 순간적으로 바뀌는 현대적인 캘린더 기능을 장착한 최초의 방수 오토매틱 크로노미터 손목시계입니다.</div>
    <div class="font2">탁월한 정밀함과 신뢰성, 가독성 그리고 독보적인 존재감을 자랑하는 이 품격 있는 모델은 가장 높은 명성을 자랑하는 시계로 자리 잡았습니다</div>
    <br/><br/><br/><br/>
    <h2 align="center">상품 바로가기</h2>
    <table  border="0" width=100% cellspacing=0>
      <tr align="center"> 
        <td  colspan="2">
          <a href="${ctp}/mainWatch3.watch"><img width="70%" src="${ctp}/images/시계3.png"><br/>
            <div class="font5">DAY-DATE 40</div>
            <div class="font6">오이스터, 40mm, 화이트 골드</div>
          </a>
        </td>
        <td >
          <a href="${ctp}/mainWatch20.watch"><img width="70%" src="${ctp}/images/시계28.png"><br/>
            <div class="font5">DAY-DATE 36</div>
            <div class="font6">오이스터, 36mm, 옐로우 골드와 다이아몬드</div>
          </a>
        </td>
      </tr>  
    </table>
    <br/><br/><br/><br/>
    <div><img width="100%" src="${ctp}/images/컬랙션56.png"></div>
    <br/><br/><br/><br/>
    <div class="font1">다양한 전문 기술</div>
    <br/><br/><br/><br/>
    <div class="font2">여행을 자주 하는 이를 위한 우아한 시계, 스카이-드웰러는 두 개의 시간대를 동시에 표시하며, 
      연간 캘린더 기능을 갖추고 있습니다. 참조 시각은 24시간용 디스크를 통해 24시간 형식으로 표시되며, 현지 시각은 12시간용 일반 시침으로 읽을 수 있습니다.
      사로스(Saros) 연간 캘린더는 30일과 31일이 있는 달을 자동으로 인식합니다. 
      특허를 받은 메커니즘으로 작동하는 사로스 시스템은 다이얼의 둘레에 있는 12개의 창에 현재 월이 빨간색으로 표시되는 혁신적인 디스플레이가 돋보입니다. 
      날짜 변경은 현지 시각에 따라 즉각적으로 이루어집니다.</div>
    <br/><br/><br/><br/>
    <div><img width="100%" src="${ctp}/images/컬랙션18.jpg"></div>
    <div><img width="100%" src="${ctp}/images/컬랙션19.jpg"></div>
    <br/><br/><br/><br/>
    <table border ="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><img width="100%" src="${ctp}/images/컬랙션21.jpg"></td>
          <td align="center" width="50%">
            <div class="font3">베젤은 플루티드 베젤, 스무스 베젤 또는 보석이 세팅된 베젤이 사용됩니다.</div>
          </td> 
      </tr>
    </table>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3"> 반원형 링크 3열로 구성된 메탈 소재의 프레지던트(President) 브레슬릿은 오이스터 퍼페츄얼 데이-데이트(Oyster Perpetual Day-Date)의 1956년 출시를 위해 특별히 제작되었습니다. 
            세련미와 편안함을 상징하는 프레지던트 브레슬릿은 롤렉스가 엄선한 최고급 메탈로 제작됩니다. 데이-데이트(Day-Date)는 세계 각국의 언어로 표시됩니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/컬랙션22.jpg"></td>
      </tr>
    </table>
    <br/><br/>
    <div><img width="100%" src="${ctp}/images/컬랙션20.jpg"></div>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>