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
</head>
<body>
	<jsp:include page="/include/serviceHeader.jsp"/>
	 <div width=100%>
    <div><img width="100%" src="${ctp}/images/서비스10.jpg"></div>
    <br/><br/><br/><br/>
    <div class="font3" style="text-align: center;">롤렉스 서비스</div>
    <div class="font4" style="text-align: center;">모든 공식 롤렉스 판매점과 롤렉스 지사에서 롤렉스 시계의 서비스를 받을 수 있습니다.</div>
    <br/><br/><br/><br/>
    <div><img width="100%" src="${ctp}/images/서비스5.jpg"></div>
    <div class="font3" style="text-align: center;">서비스 프로세스</div>
    <div class="font4" style="text-align: center;">접수된 시계와 관련된 고객의 요청 사항은 모두 기록됩니다. 그런 다음 시계를 워치메이커에게 보냅니다.</div>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width="100%" height = "600px" cellspacing=0 background="${ctp}/images/서비스22.png">
      <br/><br/><br/><br/>
      <tr colspan="2" >
        <div class="font3" style="text-align: center;">시계검사</div>
        <div class="font4">워치메이커가 시계를 주의 깊게 점검하고, 수행할 작업의 견적을 작성합니다. 견적이 승인되면 서비스가 시작됩니다.</div>
        <!-- <td align="center" ></td> -->
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td><video  width="100%"src="${ctp}/images/서비스11.mp4" autoplay loop control circle style="display: block;"></video></td>
        <td align="center" width="50%">
          <div class="font3">서비스 준비</div>
          <div class="font4">케이스에서 브레슬릿을 먼저 분리한 후, 다이얼과 바늘이 장착된 무브먼트를 제거합니다. 
            무브먼트와 케이스, 브레슬릿은 별도의 과정을 통해 점검하고 다시 조립합니다.</div>
        </td>  
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td align="center" width="50%">
            <div class="font3">무브먼트 분해</div>
            <div class="font4">무브먼트를 완전히 분해하여 모든 부품을 세심하게 검사합니다.
              롤렉스의 기준을 더 이상 충족시키지 못하는 부품은 모두 교체합니다.</div>
            </td> 
        <td><img width="100%" src="${ctp}/images/서비스11.jpg"></td>
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width="100%" height = "1200px" cellspacing=0 background="${ctp}/images/서비스12.png">
      <tr colspan="2" >
        <td align="center" >
          <div class="font3" style="color: white">부품 세척</div>
          <div class="font4" style="color: white">초음파 세척기로 각 부품의 불순물을 모두 제거합니다.</div></td>
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <div class="font3" align="center">무브먼트의 조립과 윤활 작업</div>
    <div class="font4" align="center">세척한 부품을 건조시킨 후, 무브먼트를 완전히 다시 조립하고 윤활유를 주입합니다. 
      워치메이커는 브랜드의 정확도 기준에 따라 무브먼트의 정밀도를 1차로 조정합니다.</div>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td><video  width="100%"src="${ctp}/images/서비스12.mp4" autoplay loop control circle style="display: block;"></video></td>
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/><br/>
    <div class="font3" align="center">케이스와 브레슬릿 마무리</div>
    <div class="font4" align="center">케이스를 완전히 분해하고, 케이스 본체, 베젤, 케이스 백 및 
      브레슬릿은 원래 마감에 따라 다시 폴리싱 또는 새틴 마감 처리를 합니다. 
      이러한 섬세한 작업에는 세심한 주의와 탁월한 기술이 필요합니다.</div>
    <br/><br/><br/><br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3">케이스 조립</div>
          <div class="font4">세척 및 마무리 작업을 마친 케이스 부품을 다시 조립하고 씰을 교체합니다. 
            케이스의 방수 기능을 검사합니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/서비스13.jpg"></td>
      </tr>
    </table>
    <br/><br/><br/><br/><br/><br/>
    <table border ="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><img width="100%" src="${ctp}/images/서비스14.jpg"></td>
          <td align="center" width="50%">
            <div class="font3">무브먼트의 케이싱</div>
            <div class="font4">워치메이커는 모든 요소의 기능과 외관을 엄격히 검사한 후, 다이얼과 바늘이 장착된 무브먼트를 다시 케이스에 넣습니다.</div>
          </td> 
      </tr>
    </table>
    <br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3">정밀도 검사</div>
          <div class="font4">워치메이커는 무브먼트를 케이스에 넣은 후, 
            무브먼트의 크로노미터 정확성을 다시 한 번 측정하고 롤렉스의 까다로운 기준을 충족시키는 데 필요한 최종 조정을 합니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/서비스15.jpg"></td>
      </tr>
    </table>
    <br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr>
          <td><img width="100%" src="${ctp}/images/서비스16.jpg"></td>
      </tr>
    </table>
    <br/><br/><br/><br/>
    <div class="font3" align="center">케이스 백을 눌러 잠근 다음, <br/>최소 24시간 동안 롤렉스 고유의 추가 시험과정을 통해 무브먼트의 성능을 확인합니다.<br/></div>
      <br/><br/><br/><br/>
    <table border="0" width="100%" height = "600px" cellspacing=0 background="${ctp}/images/서비스17.jpg">
      <tr colspan="2" >
        <div class="font3"></div>
        <td align="center" class="font3" style="color: white;">방수 테스트<br/>수압 테스트를 거쳐 시계의 방수 기능을 확인한 후, 케이스에 브레슬릿을 다시 장착합니다.</td>
      </tr>
    </table>
    <br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><img width="100%" src="${ctp}/images/서비스18.jpg"></td>
          <td align="center" width="50%">
            <div class="font3">최종 점검</div>
            <div class="font4">시계를 최종 점검할 준비가 되면 워치메이커는 시계가 완벽하게 작동하고 외관에 흠이 없는지 확인합니다.</div>
          </td> 
      </tr>
    </table>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>