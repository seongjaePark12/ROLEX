<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  	var midCheckOn = 0;
		function sample6_execDaumPostcode() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	              var addr = ''; // 주소 변수
	              var extraAddr = ''; // 참고항목 변수
	
	              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                  addr = data.roadAddress;
	              } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                  addr = data.jibunAddress;
	              }
	
	              // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	              if(data.userSelectedType === 'R'){
	                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                      extraAddr += data.bname;
	                  }
	                  // 건물명이 있고, 공동주택일 경우 추가한다.
	                  if(data.buildingName !== '' && data.apartment === 'Y'){
	                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                  }
	                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                  if(extraAddr !== ''){
	                      extraAddr = ' (' + extraAddr + ')';
	                  }
	                  // 조합된 참고항목을 해당 필드에 넣는다.
	                  document.getElementById("sample6_extraAddress").value = extraAddr;
	              
	              } else {
	                  document.getElementById("sample6_extraAddress").value = '';
	              }
	
	              // 우편번호와 주소 정보를 해당 필드에 넣는다.
	              document.getElementById('sample6_postcode').value = data.zonecode;
	              document.getElementById("sample6_address").value = addr;
	              // 커서를 상세주소 필드로 이동한다.
	              document.getElementById("sample6_detailAddress").focus();
	          }
	      }).open();
	   }
      
  	// 회원가입폼 체크
    function joinCheck() {
    	var mid = myform.mid.value;
    	var pwd = myform.pwd.value;
    	var name = myform.name.value;
    	var birth = myform.birth.value;
    	var email = myform.email.value;
    	var getCode =  myform.getCode.value;
    	var getCode2 =  myform.getCode2.value;
    	var getCode3 =  myform.getCode3.value;
    	
	  	var idPattern = /[A-Za-z0-9]{6,19}$/g;
	  	var pwPattern = /[A-Za-z0-9]{4,12}$/g;
	  	var invaidName = /[a-zA-Z]/g;
	  	var regExp = /^[가-힣a-zA-Z]+$/;
	  	var invaidEmail =/^[a-zA-Z0-9]+$/;
	  	var invaidNum = /^[0-9]+$/;
    	
 
    	if(pwd == "") {
    		alert("비밀번호를 입력하세요");
    		myform.pwd.focus();
    	}else if(pwd.length < 8 || pwd.length > 16){
   			alert("비밀번호는 8~16자까지 입력가능합니다");
   			myform.pwd.value = "";
    	}else if(name == "") {
    		alert("성명을 입력하세요");
    		myform.name.focus();
    	}else if(!regExp.test(name)){
	      alert("이름은 한글/영어로만 구성되어야 합니다.");
	   		myform.name.value = "";
 				myform.name.focus();
    	}else if(email == "") {
    		alert("이메일을 입력하세요");
    		myform.email.focus();
    	}else if(!invaidEmail.test(email)) {
    			alert("이메일은 영문 숫자조합만 가능합니다");
    			myform.email.value= "";
    			myform.email.focus();
    	}else if (getCode == "" || getCode2 == "" || getCode3 == ""){
    		alert("전화번호를 입력하세요");
    		myform.getCode.focus();
    	}else if (!invaidNum.test(getCode)) {
   	    	alert("전화번호는 숫자로만 입력해주세요");
   	    	myform.getCode.value = "";
   	    	myform.getCode.focus();
    	}else if (!invaidNum.test(getCode2)) {
   	    	alert("전화번호는 숫자로만 입력해주세요");
   	    	myform.getCode2.value = "";
   	    	myform.getCode2.focus();
    	}else if (!invaidNum.test(getCode3)) {
   	    	alert("전화번호는 숫자로만 입력해주세요");
   	    	myform.getCode3.value = "";
   	    	myform.getCode3.focus();
    	}else {
   			var sample6_postcode = myform.sample6_postcode.value + " ";
   			var sample6_address = myform.sample6_address.value + " ";
   			var sample6_detailAddress = myform.sample6_detailAddress.value + " ";
   			var sample6_extraAddress = myform.sample6_extraAddress.value + " ";
   			myform.address.value = sample6_postcode + "/" + sample6_address + "/" + sample6_extraAddress + "/" + sample6_detailAddress
   			myform.submit();
    	}
    }
  </script>