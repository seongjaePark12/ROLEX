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
	<title>롤렉스서비스</title>
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
    <div><img width="100%" src="${ctp}/images/관리0.jpg"></div>
    <br/><br/><br/><br/>
    <div class="font1" style="text-align: center;">롤렉스 시계관리</div>
    <br/><br/><br/><br/>
    <div class="font1" style="text-align: center;">롤렉스는 시계를 구매하신 날부터 평생 동안 시계의 성능이 동일하게 유지되기를 바라는 마음으로 평소에 약간의 관리를 해 주실 것을 권해드립니다.</div>
    <br/><br/><br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><img width="100%" src="${ctp}/images/관리1.jpg"></td>
          <td align="center" width="50%">
            <div class="font3">구매 후 첫 착용 시</div>
            <div class="font4">롤렉스 시계를 구매하신 후 처음으로 착용하거나 시계가 멈춘 경우, 
              시계가 정확하고 올바르게 작동하려면 수동으로 태엽을 감아줘야 합니다. 
              태엽을 수동으로 감기 위해서는 와인딩 크라운을 완전히 푼 다음 시계 방향으로 여러 번 감아 주세요. 
              (반시계 방향으로 감는 경우, 태엽이 감기지 않습니다.) 태엽을 적정 수준으로 감기게 하기 위해서는 크라운을 최소 25회 돌려주시기 바랍니다. 
              조작 후에는 완벽한 방수를 위해 크라운을 다시 완전히 잠가주세요. 
              이후에는 손목에 착용하고 있기만 하면 자동으로 와인딩됩니다.</div>
          </td> 
      </tr>
    </table>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3">수동 와인딩</div>
          <div class="font4">롤렉스를 착용하는 도중에는 시계를 별도로 와인딩할 필요가 없습니다. 
            시계를 풀어 놓을 경우, 모델에 따라 2일 이상 “충전”된 상태를 유지합니다. 
            그러나 2일 이상 시계를 착용하지 않은 상태에서 시계가 멈췄다면, 
            다시 착용하기 전에 시간을 맞추면서 수동으로 태엽을 감아 주실 것을 권합니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/관리2.jpg"></td>
      </tr>
    </table>
    <br/><br/>
    <div><img width="100%" src="${ctp}/images/관리3.jpg"></div>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><video  width="100%"src="${ctp}/images/관리4.mp4" autoplay loop control circle style="display: block;"></video></td>
          <td align="center" width="50%">
            <div class="font3">시간 및 날짜 설정</div>
            <div class="font4">롤렉스 시계는 크라운을 풀고 두 단계 잡아당겨 세팅합니다. 초침이 멈추면 시간을 설정할 수 있습니다.
              모든 모델에는 고유의 세부 사용자 가이드 및 기능이 있습니다.</div>
          </td> 
      </tr>
    </table>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3">일상적인 관리법</div>
          <div class="font4">롤렉스의 전문 기술이 담긴 롤렉스 시계는 일상적으로 관리해야 할 부분이 매우 적습니다. 
            초극세사 천을 사용하여 정기적으로 시계를 닦아주면 시계의 광택 유지에 도움이 됩니다. 
            가끔 따뜻한 비눗물과 부드러운 솔을 사용해 케이스와 브레슬릿을 세척하는 것을 권장해 드립니다. 
            시계를 세척하기 전, 방수를 위해 반드시 크라운을 잠가주시기 바랍니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/관리5.jpg"></td>
      </tr>
    </table>
    <br/><br/>
    <div><img width="100%" src="${ctp}/images/관리6.jpg"></div>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font4">메탈 브레슬릿을 갖춘 롤렉스 시계에 물(바닷물 포함)은 자연스러운 요소입니다. 
            모든 롤렉스 오이스터 퍼페츄얼(Oyster Perpetual) 모델은 최소한 수심 100m까지 방수가 되며, 
            첼리니(Cellini) 모델은 50m까지 방수가 됩니다. 다이빙을 즐긴 뒤 혹은 해변에서 하루를 보낸 뒤에는 담수를 이용해 소금과 모래를 씻어내기만 하면 됩니다. 
            일상에서는 일과를 마무리한 후 시계를 착용한 채로 샤워할 수 있습니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/관리7.jpg"></td>
      </tr>
    </table>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><img width="100%" src="${ctp}/images/관리8.jpg"></td>
          <td align="center" width="50%">
            <div class="font4">롤렉스의 오이스터(Oyster) 케이스는 시계를 물로부터 보호하며 완벽한 방진 및 방수 기능을 제공합니다. 
              시계의 방수 기능 유지를 위해 오이스터 케이스는 완벽하게 밀폐된 상태로 사용해야 합니다. 
              롤렉스 크라운은 스크류-다운 방식으로 단단하게 고정되어 마치 잠수함의 해치와도 같은 방수 기능을 제공합니다. 
              시간이나 날짜를 재설정하거나 시계를 수동으로 와인딩할 경우, 
              더 이상 돌아가지 않을 때까지 크라운을 완전히 잠가주시기 바랍니다.</div>
          </td> 
      </tr>
    </table>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font4">롤렉스 오이스터(Oyster) 케이스는 내장된 무브먼트를 충격으로부터 최적의 상태로 보호하기 때문에 롤렉스 시계를 착용한 상태로 마음껏 운동을 즐길 수 있습니다. 
            롤렉스는 시계의 정확성을 무엇보다 중요하게 여기며 실제 착용한 상태에서도 정밀함을 보장하기 위해 모든 시계를 엄격하게 테스트합니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/관리9.jpg"></td>
      </tr>
    </table>
    <br/><br/>
    <div><img width="100%" src="${ctp}/images/관리10.jpg"></div>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
          <td><video  width="100%"src="${ctp}/images/관리11.mp4" autoplay loop control circle style="display: block;"></video></td>
          <td align="center" width="50%">
            <div class="font3">착용자가 만들어내는 동력</div>
            <div class="font4">롤렉스 시계는 기계 공학의 정수입니다. LB의 “심장”과도 같은 무브먼트는 착용자가 만드는 동력을 바탕으로 움직입니다. 
              일상생활 중 착용자가 손목을 움직일 때마다 시계 내부에 위치한 퍼페츄얼 로터(Perpetual rotor)가 부드럽게 회전하며 에너지를 발생시킵니다. 
              이렇게 발생한 에너지는 시계의 메인스프링으로 전달되어 시계를 작동하기 위한 지속적이고 안정적인 동력을 제공합니다.</div>
          </td> 
      </tr>
    </table>
    <br/><br/>
    <table border="0" width=100% cellspacing=0>
      <tr colspan="2">
        <td align="center" width="50%">
          <div class="font3">착용자 맞춤 설정</div>
          <div class="font3">롤렉스의 “심장”은 착용자의 라이프스타일에 맞추어 박동할 것입니다. 
            어떤 상황에서도 최상의 시계 성능을 유지하길 원하시는 경우, 롤렉스 공식 판매점에서 정확성을 테스트해 보시기 바랍니다. 
            필요할 경우 착용자의 라이프스타일과 완벽하게 일치하도록 밸런스 휠을 정밀하게 조정해 성능을 최적화해드립니다.</div>
          </td> 
          <td><img width="100%" src="${ctp}/images/관리12.jpg"></td>
      </tr>
    </table>
  </div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>