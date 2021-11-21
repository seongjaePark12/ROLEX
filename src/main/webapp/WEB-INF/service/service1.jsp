<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<title>title</title>
		<style>
	    a { /* a 태그 style 설정 */
	    text-align: center;
	    text-decoration: none; /* 링크의 밑줄 제거 */
	    color: inherit; /* 링크의 색상 제거 */
	    }
	    a:hover{ /* a 태그 style 설정 */
	    text-align: center;
	    text-decoration: none; /* 링크의 밑줄 제거 */
	    color: lightgray; /* 링크의 색상 제거 */
	    }
    </style>
</head>
<body>
	<jsp:include page="/include/serviceHeader.jsp"/>
	<div width=100%>
    <div><img width="100%" src="${ctp}/images/서비스7.jpg"></div>
    <br/><br/><br/><br/>
    <div class="font1" style="text-align: center;">롤렉스의 서비스 철학</div><br/><br/>
    <br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td><video  width="100%"src="${ctp}/images/서비스2.mp4" autoplay loop control circle style="display: block;"></video></td>
        <td align="center" width="50%">
          <div class="font3">고객에게 신뢰성과 내구성이 뛰어난 시계를 제공해야 한다는 신념 하에 각각의 롤렉스 시계가 품질을 대표하는 시계가 되기를 원했습니다.<br/> 이를 위해, 시계의 디자인과 제조 과정에 세심한 주의를 기울였을 뿐만 아니라, 브랜드가 판매되는 각 국가에 효율적인 애프터 세일즈 서비스를 제공하기로 했습니다.<br/>
            이러한 노력을 통해, 롤렉스는 워크샵에서 작업을 마치고 다시 주인에게 되돌아가는 모든 시계가 최고 수준의 뛰어난 성능을 유지할 수 있도록 했습니다. 
            그 결과, 롤렉스 시계는 오랜 세월에 걸쳐 한 세대에서 다음 세대로 대물림을 할 수 있습니다.</div>
        </td> 
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3">롤렉스는 모든 시계의 개발 단계에서부터 신뢰성과 내구성에 대한 엄격한 기준을 우선시하며 고품질의 시계를 제작하기 위해 언제나 최선을 다하고 있습니다.<br/> 
            다양한 제작 과정에서부터 완성된 시계가 워크숍을 떠나는 순간, 판매 후 서비스를 받게 되는 순간에 이르기까지 모든 단계를 고려해 시계를 개발합니다.</div>
        </td> 
        <td><img width="100%" src="${ctp}/images/서비스1.jpg"></td>
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <div><img width="100%" src="${ctp}/images/서비스5.jpg"></div>
    <br/><br/><br/><br/><br/><br/><br/>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><img width="100%" src="${ctp}/images/서비스2.jpg"></td>
          <td align="center" width="50%">
            <div class="font3">트레이닝 및 애프터 세일즈 서비스</div>
            <div class="font4">애프터 세일즈 서비스 센터가 제공하는 서비스의 품격에 걸맞은 최고의 워치
              메이커를 새롭게 모집하기 위해, 롤렉스는 워치메이커가 되고자 하는 이들을 지원하는 데 심혈을 기울이고 있습니다. 
              전 세계의 여러 지역마다 고유한 워치메이킹 유산이 있는 점을 감안하여 롤렉스는 지리적 위치에 따라 다양한 방식으로 트레이닝을 제공합니다.</div>
          </td> 
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3">롤렉스와의 정기적인 협업을 통해 교육 과정을 지속하고, 
            한 단계 더 나아가 개발하는 학교를 갖춘 나라들도 있습니다.
            롤렉스는 수습생이 실습할 수 있는 시계를 제공합니다. 때문에 트레이닝을 마친 후 롤렉스 서비스 센터에 합류할 때면, 
            수습생은 롤렉스 타임피스의 특성과 기술적인 디테일에 이미 익숙할 것입니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/서비스8.jpg"></td>
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td><img width="100%" src="${ctp}/images/서비스4.jpg"></td>
        <td align="center" width="50%">
          <div class="font3">롤렉스는 2018년, 최신 이니셔티브의 일환으로 실습 및 이론 수업을 결합한 워치메이킹 트레이닝 프로그램을 선보였습니다.
            롤렉스 월드 서비스의 후원을 받아 지사에서 진행되는 이 과정은 롤렉스 시계의 유지보수를 철저하게 익히고 싶은 이들을 위해 고안되었습니다. 
            트레이닝 과정을 완료하고 제네바의 롤렉스 본사에서 주관하는 일련의 시험을 통과한 졸업생들은 전 세계 애프터 세일즈 서비스 워크숍 중 한 곳에서 일하게 됩니다.</div>
          </td> 
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td><img width="100%" src="${ctp}/images/서비스6.jpg"></td> 
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td><video  width="100%"src="${ctp}/images/서비스1.mp4" autoplay loop control circle style="display: block;"></video></td> 
        <td align="center" width="50%">
          <div class="font3">탁월함을 향한 끊임없는 도전</div>
          <div class="font4">시계 제작 및 조립의 모든 측면에서 탁월함을 추구하는 롤렉스는 정교한 기술과 숙련된 전문가로 구성된 팀을 바탕으로 첨단 기술을 활용합니다. 
            이러한 접근방식 덕분에 혁신적인 손목시계를 제작하고 지속적으로 새로운 기술을 개발하는 등 선구적인 업적을 이뤄낼 수 있었습니다.</div>
          </td>
      </tr>
    </table>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>