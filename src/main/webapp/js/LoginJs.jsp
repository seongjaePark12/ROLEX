<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	function loginCheck() {
		  let regMid = /^[a-z][a-z0-9_]{3,19}$/g;
		  let regPwd = /^[a-z0-9_][~!@#$%^&*()_+|<>?:{}]{3,19}/g;

		  let mid = document.getElementById("mid").value;
		  let pwd = document.getElementById("pwd").value;

		  if(regMid.test(mid)) {
		    if(!regPwd.test(pwd)) {
		      myform.submit();
		    } else {
		      alert("비밀번호는 영문자 + 숫자 + 특수문자 조합 4~20자까지만 가능합니다");
		      document.getElementById("pwd").value = "";
		      document.getElementById("pwd").focus();
		    }
		  } 
		  else {
		    alert("아이디는 영문자 + 숫자 조합 4~20자까지만 가능합니다.\n * 첫 글자는 영문만 가능");
		    document.getElementById("mid").focus();
		    document.getElementById("mid").value = "";
		  }
		}
</script>