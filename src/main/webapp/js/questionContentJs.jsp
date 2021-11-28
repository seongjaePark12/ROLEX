<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<script>
  	function delCheck(){
  		var ans = confirm("게시글을 삭제하시겠습니까?");
  		if(ans) location.href="${ctp}/adminQuestionDelete.boss?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&lately=${lately}";
  	}

  	// 댓글 입력 처리
  	function replyCheck(){
  		var content = $("#content").val();
  		var hostIp = '${pageContext.request.remoteAddr}';
  		var questionIdx = '${vo.idx}';
  		var mid = '${vo.mid}';
  		query = {
  				questionIdx : questionIdx,
  				mid : mid,
  				content : content,
  				hostIp : hostIp
  		}
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/adminQuestionReplyInput.boss",
  			data : query,
  			success:function(){
  				location.reload();
  			}
  		});
  	}
  	
  	// 댓글 수정처리
  	function replyUpdateCheck(replyIdx){
  		var content = $("#content").val();
  		var hostIp = '${pageContext.request.remoteAddr}';
  		
  		query = {
  				replyIdx : replyIdx,
  				content : content,
  				hostIp : hostIp
  		}
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/adminQuestionReplyUpdateOk.boss",
  			data : query,
  			success:function(){
  				location.reload();
  			}
  		});
  	}
  	
  	// 댓글 삭제
  	function replyDelCheck(replyIdx){
  		var query = {replyIdx : replyIdx};
  		var ans = confirm("댓글을 삭제 하시겠습니까?");
  		if(!ans) return;
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/adminQuestionReplyDelete.boss",
  			data : query,
  			success:function(){
  				location.reload();
  			}
  		});
  	}
  </script>