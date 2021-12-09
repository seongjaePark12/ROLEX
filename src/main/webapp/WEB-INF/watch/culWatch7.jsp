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
	<title>Cellini</title>
</head>
<body oncontextmenu = "return false;">
	<jsp:include page="/include/serviceHeader.jsp"/>
     <div width="100%">
    <div><img width="100%" src="${ctp}/images/컬랙션63.png"></div>
    <div><img width="100%" src="${ctp}/images/컬랙션100.jpg"></div>
    <br/><br/><br/><br/> <br/><br/><br/><br/>
    <h2 align="center">상품 바로가기</h2>
    <table  border="0" width=100% cellspacing=0>
      <tr align="center"> 
        <td  colspan="2">
          <a href="${ctp}/mainWatch12.watch"><img width="40%" src="${ctp}/images/시계12.png"><br/>
            <div class="font3">CELLINI MOONPHASE</div>
            <div class="font4">39mm, 18캐럿 에버로즈 골드, 폴리싱처리</div>
          </a>
        </td>
      </tr>  
    </table>
    <br/><br/><br/><br/>
    <div><img width="100%" src="${ctp}/images/컬랙션37.jpg"></div>
    <div><img width="100%" src="${ctp}/images/컬랙션38.jpg"></div>
    <br/><br/><br/><br/>
    <table border ="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td><img width="100%" src="${ctp}/images/컬랙션39.jpg"></td>
        <td align="center" width="50%">
          <div class="font3"> 첼리니(Cellini) 컬렉션은 워치메이킹 전통의 가장 매혹적이고 탁월한 측면을 기념합니다. 
            시계의 모든 요소 속에 우아함과 고급스러움을 자랑하며, 케이스는 LB가 자체 주조한 18캐럿 화이트 골드나 에버로즈(Everose) 골드로만 제작됩니다.
          </div>
        </td> 
      </tr>
    </table>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3">클래식한 39mm 사이즈의 라운드 형태는 전통의 충실한 반영이지만, 
            세련된 러그와 폴리싱 마감, 더블 베젤(하나는 돔형, 다른 하나는 정교한 플루티드 처리)은 독창적인 시도를 보여줍니다.</div>
        </td> 
          <td><img width="100%" src="${ctp}/images/컬랙션40.jpg"></td>
      </tr>
    </table>
    <br/><br/>
    <table border ="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><img width="100%" src="${ctp}/images/컬랙션41.jpg"></td>
          <td align="center" width="50%">
            <div class="font3">다이얼에도 특별한 노하우와 전통이 반영되어 있습니다. 
              래커 처리 또는 블랙 또는 실버 도금 처리한 클래식한 “Rayon flammé de la gloire” 기요쉬 모티프 위에 골드 아플리케 시각 표식이 자리 잡고 있습니다. 
              전통적인 스타일을 강조한 시계들로써, 블랙 또는 브라운 컬러의 가죽 스트랩에 18캐럿 골드 버클을 장착한 모델들만 있습니다.</div>
          </td> 
      </tr>
    </table>
    <br/><br/>
    <div><img width="100%" src="${ctp}/images/컬랙션42.png"></div>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>