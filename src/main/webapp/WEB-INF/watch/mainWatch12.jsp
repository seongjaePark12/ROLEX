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
	<title>CELLINI MOONPHASE</title>
</head>
<body>
	<jsp:include page="/include/serviceHeader.jsp"/>
   <div width="100%">
    <div><img width="100%" src="${ctp}/images/탑12.png"></div>
    <br/><br/><br/><br/>
    <div class="font1">가죽 스트랩 브레슬릿을 갖춘 18캐럿 에버로즈 골드 소재의 Cellini Moonphase.</div>
    <div class="font2">Cellini Moonphase는 달의 위치 변화를 보여주는 디스플레이를 갖추었습니다. 첼리니 문페이즈의 화이트 다이얼은 6시 방향에 위치한 블루 에나멜 디스크를 통해 음력 주기를 보여줍니다. 보름달은 메테오라이트로 표현됩니다.</div>
    <br/><br/><br/><br/>
    <div><img width="100%" src="${ctp}/images/탑12_1.png"></div>
    <br/><br/> <br/><br/>
    <div align="center"><img width="80%" src="${ctp}/images/탑12_2.png"></div>
    <br/><br/>
    <div align="center" class="font3">상세내용</div>
    <br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr>

        <td align="center" class="font3"><b>모델 케이스</b></td>
        <td align="center" class="font3"><b>무브먼트</b></td>
      </tr>
      <tr>
          <td align="center"><img width="90%" src="${ctp}/images/탑12_3.png"></td>
          <td align="center"><img width="90%" src="${ctp}/images/상세1.jpg"></td>
      </tr>
      <tr>
        <td  width="50%" align="center" class="font7">
          <b>모델 케이스</b><br/>
          39mm, 18캐럿 에버로즈 골드, 폴리싱 처리<br/><br/>
          <b>직경</b><br/>
          39mm<br/><br/>
          <b>소재</b><br/>
          18캐럿 에버로즈 골드<br/><br/>
          <b>베젤</b><br/>
          더블 베젤, 돔드 및 플루티드<br/><br/>
          <b>와인딩 크라운</b><br/>
          스크류-다운 방식의 플레어형 와인딩 크라운, 롤렉스 로고 각인<br/><br/>
          <b>크리스탈</b><br/>
          돔드 사파이어 크리스탈<br/><br/>
          <b>방수</b><br/>
          수심 50m 방수<br/><br/>
        </td> 
        <td  width="50%" align="center" class="font7">
          <b>무브먼트</b><br/>
          오토매틱 와인딩 메케니컬 퍼페츄얼 무브먼트<br/><br/>
          <b>칼리버</b><br/>
          3195, 롤렉스 매뉴팩처<br/><br/>
          <b>정밀도</b><br/>
          하루 –2/+2초의<br/>
          평균 허용 오차<br/><br/>
          <b>기능</b><br/>
          다이얼 중앙에 시, 분, 초침 위치. 24시간 표시. 
          독립적으로 움직이는 시침을 이용한 듀얼 타임존 기능.
          날짜 순간 변경 기능. 
          시간 맞출 때 초침이 정지하여 정확한 시간 설정이 가능<br/><br/>
          <b>와인딩</b><br/>
          영구회전자 퍼페츄얼 로터를 통한 양방향 오토매틱 와인딩<br/><br/>
          <b>파워 리저브</b><br/>
          약 48시간<br/><br/>
        </td> 
      </tr>
      </table>
      <br/><br/><br/>
      <table border="0" width=100% cellspacing=0>
        <tr>
          <td align="center" class="font7"><b>브레슬릿</b></td>
          <td align="center" class="font7"><b>다이얼</b></td>
        </tr>
        <tr>
            <td align="center"><img width="90%" src="${ctp}/images/일반65.jpg"></td>
            <td align="center"><img width="90%" src="${ctp}/images/일반66.jpg"></td>
        </tr>
        <tr>
          <td  width="50%" align="center" class="font7">
            <b>브레슬릿</b><br/>
            오이스터, 넓은 3열 링크<br/><br/>
            <b>브레슬릿 소재</b><br/>
            오이스터스틸<br/><br/>
            <b>클라스프</b><br/>
            풀림 방지 기능이 있는 폴딩 오이스터록 세이프티 클라스프, 편안한 착용감을 위해 브레슬릿 길이를 쉽게 5mm 늘이거나 줄일 수 있는 이지링크<br/><br/>
          </td> 
          <td  width="50%" align="center" class="font7">
            <b>다이얼</b><br/>
            Z-blue<br/><br/>
            <b>세부 사항</b><br/>
            푸른색 야광이 오랫동안 지속되는 크로마라이트 시각 표식<br/><br/>
          </td> 
        </tr>
      </table>
      <br/><br/><br/>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>