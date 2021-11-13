<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
/* function midCheck(){
	  var url = "join_idCheck.html";
	  windowName = "중복체크";
	  var opt = "width = 700px,height = 300px, left=500px,top=200px";
	  newWindow = window.open(url,windowName,opt);
	} */
	function childCloseWin(){
	  windowName.close();
	}

	// function sample4_execDaumPostcode(){
	//   var width = 500; //팝업의 너비
	//   var height = 600;
	    
	//   new daum.Postcode({
//	     oncomplete: function(data) {
//	         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

//	         // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
//	         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
//	         var roadAddr = data.roadAddress; // 도로명 주소 변수
//	         var extraRoadAddr = ''; // 참고 항목 변수

//	         // 법정동명이 있을 경우 추가한다. (법정리는 제외)
//	         // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
//	         if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
//	             extraRoadAddr += data.bname;
//	         }
//	         // 건물명이 있고, 공동주택일 경우 추가한다.
//	         if(data.buildingName !== '' && data.apartment === 'Y'){
//	             extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
//	         }
//	         // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
//	         if(extraRoadAddr !== ''){
//	             extraRoadAddr = ' (' + extraRoadAddr + ')';
//	         }

//	         // 우편번호와 주소 정보를 해당 필드에 넣는다.
//	         document.getElementById('sample4_postcode').value = data.zonecode;
//	         document.getElementById("sample4_roadAddress").value = roadAddr;
//	         document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	        
//	         // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
//	         if(roadAddr !== ''){
//	             document.getElementById("sample4_extraAddress").value = extraRoadAddr;
//	         } else {
//	             document.getElementById("sample4_extraAddress").value = '';
//	         }

//	         var guideTextBox = document.getElementById("guide");
//	         // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
//	         if(data.autoRoadAddress) {
//	             var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
//	             guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
//	             guideTextBox.style.display = 'block';

//	         } else if(data.autoJibunAddress) {
//	             var expJibunAddr = data.autoJibunAddress;
//	             guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
//	             guideTextBox.style.display = 'none';
//	         } else {
//	             guideTextBox.innerHTML = '';
//	             guideTextBox.style.display = 'none';
//	         }
//	       }
	  
	//   }).open({
//	     left: (window.screen.width / 2) - (width / 2),
//	     top: (window.screen.height / 2) - (height / 2),
	//   });
	// }

	function joinCheck() {
	  console.log("clicked");
	  idCheck();
	  pwdCheck();
	  pwdEqual();
	  // checkEmail();
	  checkName();
	  checkPhone();
	  // checkAddress();
	  // checkAddress2();
	}
	function idCheck() {
	  var mid = document.getElementById("mid");
	  var idPattern = /^[A-za-z0-9]{6,19}$/g;
	  if(mid.length < 4 || mid.length > 16){
	    mid.value = "";

	  }
	  if (mid.value == "") {
	    mid.focus();
	  } else {
	    if (!idPattern.test(mid.value)) {
	      mid.value = "";
	      mid.focus();
	    }
	  }
	}

	function pwdCheck() {
	  var pwd = document.getElementById("pwd");
	  var pwPattern = /^[A-za-z0-9]{4,12}$/g;
	  if(mid.length < 8 || mid.length > 16){
	    pwd.value = "";

	  } 
	  if (pwd.value == "") {
	    pwd.focus();
	  } else {
	    if (!pwPattern.test(pwd.value)) {
	      alert("비밀번호는 영문, 숫자, 특수문자만 입력가능합니다.");
	      pwd.value = "";
	      pwd.focus();
	    }
	  }
	  isEqualId();
	}
	function pwdCheck() {
	  var pwdTest = document.getElementById("pwdTest");
	  var pwPattern = /^[A-za-z0-9]{4,12}$/g;
	  if (pwdTest.value == "") {
	  
	  } else {
	    if (!pwPattern.test(pwdTest.value)) {
	      pwdTest.value = "";
	      pwdTest.focus();
	    }
	  }
	}
	function isEqualId() {
	  var pwd = document.getElementById("pwd");
	  var mid = document.getElementById("mid");
	  if (pwd.value == mid.value) {
	    pwd.value = "";
	    pwdTest.value = "";
	    pwd.focus();
	  }
	}
	function pwdEqual() {
	  var pwd = document.getElementById("pwd");
	  var pwdTest = document.getElementById("pwdTest");
	  if (pwd.value != pwdTest.value) {
	    alert("비밀번호가 서로 다릅니다");
	    pwd.value = "";
	    pwdTest.value = "";
	    pwd.focus();
	  }
	}
	function checkName() {
	  var name = document.getElementById("name").value;
	  var invaidName = /([^가-힣a-zA-Z])/g;
	  if (name == "") {

	  } else {
	    if (invaidName.test(name)) {
	      alert("이름은 한글/영어로만 구성되어야 합니다.");
	      name.value = "";
	      name.focus();
	    }
	  }
	}
	function checkPhone() {
	  var getCode = document.getElementById("getCode").value;
	  var invaidNum = /([^0-9])/g;
	  if (getCode == "") {
	  } else {
	    if (invaidNum.test(getCode)) {
	      getCode.value = "";
	      getCode.focus();
	    }
	  }
	}

	// function checkAddress() {
	//   var sample4_roadAddress = document.getElementById("sample4_roadAddress").value;
	//   if (sample4_roadAddress == "") {
	  
	//   } 
	//   else {
	    
	//   }
	// }
	// function checkAddress2() {
	//   var sample4_detailAddress = document.getElementById("sample4_detailAddress").value;
	//   if (sample4_detailAddress == "") {

	//   }
	//   else {
//	     }
	// }
	// function checkEmail() {
	//   var email = document.getElementById("email").value;
	//   var invaidEmail =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])/g
	//   if (email == "") {
	//   } else {
//	     if (invaidEmail.test(email)) {
//	       email.value = "";
//	       email.focus();
//	     }
	//   }
	// }
</script>