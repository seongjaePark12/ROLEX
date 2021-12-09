<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var width = $(window).width();

// 로드 이후 내가 이벤트 동작시 시전 댐
$(document).ready(function(){
	var nav1 = window.matchMedia("screen and (min-width: 1280px)");
	var nav2 = window.matchMedia("screen and (min-width: 1024px)");
	var nav3 = window.matchMedia("screen and (min-width: 768px)");
	var nav4 = window.matchMedia("screen and (min-width: 600px)");

	// 1280 이상에서만 스크롤 동작시 작동
	$(window).scroll(function(){
		if (nav1.matches) {
			if($(this).scrollTop()){
				$(".rolex").slideUp(500);
				$("#nav").css('background-color','black');
				document.getElementBydId("navleft").style.display = '';
				document.getElementById("navright").style.display = '';
				document.getElementById("Topcenter").style.flex = 'none';
				document.getElementById("Topleft").style.display = '';
				document.getElementById("Topright").style.display = '';
			}
			else{
				$(".rolex").slideDown(500);
				$("#nav").css('background','linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(255,255,255,0))');
				document.getElementById("navleft").style.display = 'none';
				document.getElementById("navright").style.display = 'none';
				document.getElementById("Topcenter").style.flex = '1';
				document.getElementById("Topleft").style.display = '';
				document.getElementById("Topright").style.display = '';
			}
		}
		if (nav2.matches) {
			if($(this).scrollTop()){
				$(".rolex").slideUp(500);
				$("#nav").css('background-color','black');
		/* 		document.getElementBydId("navleft").style.display = ''; */
				document.getElementById("navright").style.display = '';
				document.getElementById("Topcenter").style.flex = 'none';
				document.getElementById("Topleft").style.display = '';
				document.getElementById("Topright").style.display = '';
			}
			else{
				$(".rolex").slideDown(500);
				$("#nav").css('background','linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(255,255,255,0))');
				document.getElementById("navleft").style.display = 'none';
				document.getElementById("navright").style.display = 'none';
				document.getElementById("Topcenter").style.flex = '1';
				document.getElementById("Topleft").style.display = '';
				document.getElementById("Topright").style.display = '';
			}
		}
		if (nav3.matches) {
			if($(this).scrollTop()){
				$(".rolex").slideUp(500);
				$("#nav").css('background-color','black');
				document.getElementById("navleft").style.display = '';
				document.getElementById("navright").style.display = '';
				document.getElementById("Topcenter").style.flex = 'none';
				document.getElementById("Topleft").style.display = '';
				document.getElementById("Topright").style.display = '';
			}
			else{
				$(".rolex").slideDown(500);
				$("#nav").css('background','linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(255,255,255,0))');
				document.getElementById("navleft").style.display = 'none';
				document.getElementById("navright").style.display = 'none';
				document.getElementById("Topcenter").style.flex = '1';
				document.getElementById("Topleft").style.display = '';
				document.getElementById("Topright").style.display = '';
			}
		}
		if (nav4.matches) {
			if($(this).scrollTop()){
				$(".rolex").slideUp(500);
				$("#nav").css('background-color','black');
				document.getElementById("navleft").style.display = '';
				document.getElementById("navright").style.display = '';
				document.getElementById("Topcenter").style.flex = 'none';
				document.getElementById("Topleft").style.display = '';
				document.getElementById("Topright").style.display = '';
			}
			else{
				$(".rolex").slideDown(500);
				$("#nav").css('background','linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(255,255,255,0))');
				document.getElementById("navleft").style.display = 'none';
				document.getElementById("navright").style.display = 'none';
				document.getElementById("Topcenter").style.flex = '1';
				document.getElementById("Topleft").style.display = '';
				document.getElementById("Topright").style.display = '';
			}
		}
	});
		
		// 검생창을 띄우기 위함
		$("#btnSearch").click(function(){
			if($("#SearchIcon").hasClass("fa fa-search")){
				var part = '';
				var query = {part:part};
				$.ajax({
					url : "#", // 이건 컨트롤로 보낸다
					type : "get",
					data : query,
					success:function(data) {
						$("#searchTitle").html(part+"실시간 순위");
						for(var i=0; i<5; i++){
							$("#search"+i).html("<li id='search"+i+"'><i class='fa fa-search'></i> <a href='#?search="+data[i].word+"' style='color: black;'>"+data[i].word+"</a></li>");
						}
					}
				});
				
				$("#SearchIcon").attr('class','fa fa-close');
				$("#SearchIcon1").attr('class','fa fa-close');
				$("#SearchDiv").css('display','table');
				$("#nav").css('background-color','black');
				$("#search").focus();
			}
			else{
				$("#SearchIcon").attr('class','fa fa-search');
				$("#SearchIcon1").attr('class','fa fa-search');
				$("#SearchDiv").css('display','none');
				$("#nav").css('background','linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(255,255,255,0))');
			}
		});
		
		// 검생창을 띄우기 위함
		$("#btnSearch1").click(function(){
				var part = '';
				
				var query = {part:part};
				$.ajax({
					url : "#", // 이건 컨트롤로 보낸다
					type : "post",
					data : query,
					success:function(data) {
						$("#searchTitle").html(part+"실시간 순위");
							for(var i=0; i<5; i++){
								$("#search"+i).html("<li id='search"+i+"'><i class='fa fa-search'></i> <a href='#?search="+data[i].word+"' style='color: black;'>"+data[i].word+"</a></li>");
							}
					}
				});
				
				$("#SearchIcon1").attr('class','fa fa-close');
				$("#SearchIcon").attr('class','fa fa-close');
				$("#SearchDiv").css('display','table');
				$("#nav").css('background-color','black');
				$("#search").focus();
			
		});
	});
	// 검색창에서 검색하기
	function enterKey(){
		if(window.event.keyCode == 13){
			var search = document.getElementById("search").value;
			if(search == ""){
				alert("검색어를 입력해주세요.");
				$("#search").focus();
			}
			else{
				location.href="#?search="+search.trim();
			}
		}
	};
</script>