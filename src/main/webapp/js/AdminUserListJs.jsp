<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
  <script>
  	function UserReset(idx) {
			var ans = confirm("정말로 탈퇴처리 하시겠습니까?");
			if(ans) location.href="${ctp}/adminUserReset.boss?idx="+idx;
		}
  	//등급별 검색
  	function levelSearch() {
			var level = adminForm.level.value;
			location.href="${ctp}/adminUserList.boss?level="+level;
		}
  	// 개별회원검색
  	function midSearch() {
			var mid = adminForm.mid.value;
			if(mid == ""){
				alert("아이디를 입력하세요");
				adminForm.mid.focus();
			}else{
				location.href="${ctp}/adminUserList.boss?mid="+mid;
			}
		}
/*   	function allCheck(one) {
		  let seasonLen = document.myform.one.length;
		  let all = document.myform.all.value;

		  if(one.checked) {
		    for(var i=0; i<seasonLen; i++) {
		      myform.one[i].checked = true;
		    }
		  }
		  else {
		    for(var i=0; i<seasonLen; i++) {
		      myform.one[i].checked = false;
		    }
		  }
		} */
  </script>