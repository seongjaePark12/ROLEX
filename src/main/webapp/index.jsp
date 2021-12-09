<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<title>Rolex</title>
	<jsp:include page="/js/MainJs.jsp"/>
	<jsp:include page="/js/cilckNo.jsp"/>
	<jsp:include page="/css/mainCss.jsp"/>
	<style>
		div.scrollmenu {
		  overflow: auto;
		  white-space: nowrap;
		}
		
		div.scrollmenu a {
		  display: inline-block;
		  color: white;
		  text-align: center;
		  padding: 14px;
		  text-decoration: none;
		}
		
		div.scrollmenu a:hover {
		  background-color: #E3E3E3;
		}
	</style>
</head>
<body oncontextmenu='return false' onselectstart='return false' ondragstart='return false'>
	<jsp:include page="/include/menuHeader.jsp"/>
	<div style="width: 100%;">
		<div class="w3-container w3-white w3-xlarge" style="width: 100%;">
			<div class="font1">롤렉스 시계는 꼼꼼하게 정성을 들여 조립됩니다.</div>
			<div class="font2">
				우수한 정확성과 품격을 지닌 롤렉스 컬렉션에 대해 자세히 알아보시기 바랍니다.<br/>
			  롤렉스는 어떤 상황에도 어울리는 다양한 모델을 선보입니다.<br/>
				스타일과 기능이 완벽하게 어우러진 롤렉스 시계의 다양한 셀렉션을 만나보시기 바랍니다.<br/>
			</div>
			<br/><br/><br/>
			<div class="font1">롤렉스 컬렉션 -<a href="${ctp}/collectionWatch.watch" class="font2">모두보기</a></div><br/>
			<div class="scrollmenu">
			  <a href="${ctp}/cul2.watch"><img src="${ctp}/images/컬랙션3.jpg"/></a>
			  <a href="${ctp}/cul3.watch"><img src="${ctp}/images/컬랙션4.jpg"/></a>
			  <a href="${ctp}/cul4.watch"><img src="${ctp}/images/컬랙션5.jpg"/></a>
			  <a href="${ctp}/cul5.watch"><img src="${ctp}/images/컬랙션2.jpg"/></a>
			  <a href="${ctp}/cul6.watch"><img src="${ctp}/images/컬랙션6.jpg"/></a>
			  <a href="${ctp}/cul7.watch"><img src="${ctp}/images/컬랙션7.jpg"/></a>
			</div>
			<br/><br/>
			<div align=center>
				<video width="100%"src="${ctp}/images/메인영상1.mp4" autoplay loop control circle style="display: block;" muted></video>
			</div>
			<br/><br/>
			<div class="font1">오랜 시간 동안 롤렉스 시계는 가장 높은 산의 정상부터 가장 깊은 바닷속까지 탐험하는 전 세계의 탐험가들 및 도전하며 성취하는 전문가들과 함께했습니다.</div><br/><br/>
			<div class="font2">
				오늘날 롤렉스는 전 세계의 정상급 스포츠 이벤트인 골프를 비롯해 요트, 테니스, 모터 스포츠, 
				승마 등의 행사를 후원합니다. 롤렉스는 전 세계의 문화, 과학 및 탐험 발전에 특별하고 지속적인 기여를 하고 있습니다.
			</div>
			<br/><br/>
			<div align=center>
				<video width="100%"src="${ctp}/images/메인영상2.mp4" autoplay loop control circle style="display: block;" muted></video>
			</div>
			<br/><br/>
			<div class="font1">롤렉스 후원 활동의 역사는 탁월함을 향한 끝없는 열정을 보여줍니다. 이러한 브랜드 정신은 워치메이킹부터 스포츠, 탐험, 예술 분야의 가장 위대한 인물들까지 모든 롤렉스 활동의 기반이 됩니다.</div><br/><br/>
			<div class="font2">
				20세기 초는 탐험과 스포츠에 있어 다양한 도전이 이루어지는 시기였습니다. 
				워치메이킹의 세계에서, 언제나 한계를 넘어서고자 했던 롤렉스의 창립자 한스 빌스도르프(Hans Wilsdorf)는 
				전통적인 회중시계를 방수와 방진 기능이 있는 손목시계로 대체하고자 하며 당대 최고의 혁신을 꿈꿨습니다.
			</div>
			<br/><br/>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>