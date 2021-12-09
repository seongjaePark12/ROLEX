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
	<title>공지사항 수정</title>
	<script>
		var cnt = 1;
    
    // 자료 전송을 위한 폼체크
    function fCheck() {
    	var fName = myform.fName1.value;
    	var maxSize = 1024 * 1024 * 100; 	// 100MB까지 허용
    	var title = myform.title.value;
    	var content = myform.content.value;
    	
    	if(title.trim() == "") {
    		alert("파일 제목을 입력하세요?");
    		myform.title.focus();
    		return false;
    	}
    	else if(content.trim() == "") {
    		alert("글내용을 입력하세요");
    		myform.content.focus();
    		return false;
    	}
    	
    	var fileSize = 0;
    	for(var i=1; i<=cnt; i++) {
    		fName = "fName" + i;
    		if(document.getElementById(fName) != null) {
	    		if(document.getElementById(fName).value != "" && document.getElementById(fName).value != null) {
	    			tempFname = document.getElementById(fName).value;
	    			var ext = tempFname.substring(tempFname.lastIndexOf(".")+1);
	    			var uExt = ext.toUpperCase();
	    			
	    			if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "ZIP" && uExt != "PPT" && uExt != "PPTX" && uExt != "HWP") {
	    				alert("업로드 가능한 파일은 'jpg/gif/png/zip/ppt/pptx/hwp' 입니다.");
	    				return false;
	    			}
	    			else if(tempFname.indexOf(" ") != -1) {
	    				alert("업로드할 파일명에는 공백이 없어야 합니다.")
	    				return false;
	    			}
	    			else {
	    				fileSize += document.getElementById(fName).files[0].size;
	    			}
	    		}
    		}
    	}
    	if(fileSize > maxSize) {
    		alert("업로드하는 파일의 최대용량은 20MByte 이내입니다.");
    		return false;
    	}
    	else {
    		myform.fileSize.value = fileSize;
    		myform.submit();
    	}
    }
  	function DelCheck(idx){
    	var query = {
    			idx : idx,
    			fSName :  "${vo.fSName}"
    	}
  		var ans = confirm("삭제 하시겠습니까?");
  		if(!ans) return;
  		
  		$.ajax({
  			type : "post",
  			url : "${ctp}/adminUpdateFileDelete.boss",
  			data : query,
  			success:function(){
  				location.reload();
  			}
  		});
  	}
  </script>
</head>
<body>
	<jsp:include page="/include/pageHeader.jsp"/>
	<jsp:include page="/include/adminNav.jsp"/>
		<div class="container">
		<form name="myform" method="post" action="${ctp}/adminNoticeUpdateOk.boss" enctype="multipart/form-data">
			<table class="table table-boderless">
				<tr>
					<td><h2>게시판 수정</h2></td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th>글쓴이</th>
					<td>${sMid}</td>
				</tr>
				<tr>
					<th>현재 등록된파일</th>
					<td>
	    		 <c:set var="fSName" value="${vo.fSName}"/>
		       	 <c:set var="fSNames" value="${fn:split(fSName,'/')}"/>
		       	 <c:forEach var="fSName" items="${fSNames}" varStatus="st">
		       	 	<c:set var="fSNameLen" value="${fn:length(fSName)}"/>
		       	 	<c:set var="ext" value="${fn:substring(fSName,fSNameLen-3,fSNameLen)}"/>
		       	 	<c:set var="extUpper" value="${fn:toUpperCase(ext)}"/>
		       	 	<c:if test="${extUpper=='JPG'||extUpper=='GIF'||extUpper=='PNG'}">
		       	 		<img src="${ctp}/data/notice/${fSName}" width="350px"/><br/>
		       	 	</c:if>
		       	</c:forEach>
		       	<a href="javascript:DelCheck(${vo.idx});" class="btn btn-outline-warning btn-sm ">삭제</a>
					</td>
				</tr>
				<tr>
					<th>파일</th>
					<td>
	    		 <input type="file" name="fName1" id="fName1" class="form-control-file border" accept=".jpg,.gif,.png,.zip,.ppt,.pptx,.hwp"/>
					</td>
				</tr>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="title" value="${vo.title}" class="form-control" autofocus required /></td>
				</tr>
				<tr>
					<th>글내용</th>
					<td><textarea rows="6" name="content" class="form-control" required >${vo.content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
						<input type="button" value="글수정" onclick="fCheck()" class="btn btn-outline-warning"/>
						<input type="reset" value="다시입력" class="btn btn-outline-warning"/>
						<input type="button" value="돌아가기" onclick="location.href='${ctp}/adminNotice.boss';" class="btn btn-outline-warning"/>
					</td>
				</tr>
			</table>
			<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
			<input type="hidden" name="fileSize"/>
			<input type="hidden" name="idx" value="${vo.idx}"/>
			<input type="hidden" name="pag" value="${pag}"/>
			<input type="hidden" name="pagSize" value="${pagSize}"/>
			<input type="hidden" name="fSName" value="${vo.fSName}"/>
		</form>
	</div>
	<br/>	
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>