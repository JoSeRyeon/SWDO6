<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>

<head>
<title>POCKET PLANNER - CALENDAR</title>

<!-- modal -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>


<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords"
	content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<!-- Favicon icon -->
<link rel="icon" href="/resources/assets/images/favicon.ico"
	type="image/x-icon">
<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600"
	rel="stylesheet">
<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/bootstrap/css/bootstrap.min.css">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/icon/icofont/css/icofont.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/style.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/css/jquery.mCustomScrollbar.css">

<link href='/resources/assets/fullcalendar/main.css' rel='stylesheet' />
<script src='/resources/assets/fullcalendar/main.js'></script>

<!-- datepicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">



<script>
	var calendar = null;

	var id = null;

	var title = null;
	var start = null;
	var end = null;
	var content = new Array();
	var resultArg = null;

	var arrDB = null;
	var arrDBContent = null;

	function calendarDB(){

			  $.ajax({
			        contentType:'application/json',
			        dataType:'json',
			        url:'/calendar/json',
			        type:'post',
			        async: false,
			        data: { id : "제발"},
			        success:function(resp){

			        	/* 			            
			            $.each(resp, function(index, item){
				            console.log(item);
			            });
 						*/

 						console.log(resp);
				        arrDB = resp;

			        },
			        error:function(){
			            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
			        }
			    }); 
			    
		}

	function calendarContent(){

		  $.ajax({
		        contentType:'application/json',
		        dataType:'json',
		        url:'/calendar/content',
		        type:'post',
		        async: false,
		        data: { id : "제발"},
		        success:function(resp){

					console.log(resp);
					arrDBContent = resp;

					for(var i = 0; i < arrDBContent.length; i++){
						content.push(resp[i].plan_content);
						console.log(content[i]);
					}

		        },
		        error:function(){
		            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
		        }
		    }); 
		    
	}

	

	

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		calendarDB();
		console.log(arrDB);

		calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			//initialDate: '2020-09-12',
			locale : 'ko',
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				//calendarDB();

				resultArg = arg;
				start = arg.start;
				end = arg.end;
				

				console.log(arg.start);

				$("#datepicker1").datepicker("setDate", arg.startStr);
				$("#datepicker2").datepicker("setDate", arg.endStr);
				

				$("#myModal").modal("show");
				calendar.render();

				//console.log(arg);
				//save();
				calendar.unselect();

			},
			eventDrop : function(info) {
/* 				
				alert(info.event.title + " was dropped on "
						+ info.event.start.toISOString());

				if (!confirm("일정을 변경 하시겠습니까?")) {
					info.revert();
				}
 */
				save();
			},
			eventClick : function(arg) {
				//alert(arg.event.title);

				$(document).ready(function() {

					resultArg = arg;
					id = arg.event.id;

					var eventTitle = arg.event.title;
					//console.log(resultArg.event.id);

					calendarContent();
					console.log(arrDBContent);
					
					 $.each(arrDBContent, function(index, item){
				            //console.log(item.plan_num);
				            if(item.plan_num == resultArg.event.id){
				            	$("#content").val(item.plan_content);
					         }
			            });
					
					//alert(eventTitle)
					//$('input[name=title]').attr('value',eventTitle);
					$("#title").val(eventTitle);
					$("#datepicker1").datepicker("setDate", arg.event.startStr);
					$("#datepicker2").datepicker("setDate", arg.event.endStr);
					//$("#content").val(content);
					
					
					
					$("#myModal").modal("show");
				});
				/* 
				if (confirm('일정을 삭제하시겠습니까?')) {
				arg.event.remove()
				} 
				*/

				//save();
			},
			eventResize : function(info) {
/* 				
				alert(info.event.title + " end is now "
						+ info.event.end.toISOString());

				console.log(info.event.end)
				if (!confirm("일정을 변경하시겠습니까?")) {
					console.log(info.event.end)
					info.revert();
				}
 */
				save();
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
	    	events : arrDB

	    
		});

		calendar.render();
	});



	function save() {
		//console.log(arg);

		var allEvent = calendar.getEvents()
		//console.log(allEvent);
		var events = new Array();

		for (var i = 0; i < allEvent.length; i++) {

			var obj = new Object();

			obj.title = allEvent[i]._def.title;
			obj.allDay = allEvent[i]._def.allDay;
			obj.start = allEvent[i]._instance.range.start;
			obj.end = allEvent[i]._instance.range.end;
			obj.content = content[i];

			

			events.push(obj);
		}

		

		console.log(allEvent);

		console.log(JSON.stringify(events));

		$.ajax({
			url : '/calendar/save',
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json; charset=utf-8',
			data : JSON.stringify(events),
			success : function(data) {
				console.log(data);
				calendar.render();
				calendarContent();
			}
		});
	}

	$(document).ready(function() {

		$('.modal').on('hidden.bs.modal', function (e) {
		    $(this).find('form')[0].reset()
		});

		$("#datepicker1, #datepicker2").datepicker({

			dateFormat : 'yy-mm-dd',

		});


	});

	$(document).ready(function() {


		$('#saveButton').on('click', function() {

			title = $("#title").val();
			//content = $("#content").val();
			
			
			var flag = false;
			for(var i = 0; i < arrDBContent.length; i++){
				var temp = $("#content").val();
				if(arrDBContent[i].plan_num == id){
					content[i] = $("#content").val();
					console.log(content[i]);
					flag = true;
				}
			}

			if(!flag){
				content.push($("#content").val());
			}
			

			/* 
			calendarContent();
			var content_calendar = new Array();
			 */
			
			if (title) {
				calendar.addEvent({
					title : title,
					start : start,
					end : end,
					allDay : resultArg.allDay
					
				})
			}

			save();

			$("#myModal").modal("hide");
			

		});


		$("#deleteButton").on('click', function() {
			if (confirm('일정을 삭제하시겠습니까?')) {
				resultArg.event.remove();
				save();
			} 
		});
			
	});
</script>


</head>

<body>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
					<table class="table">
						<tr>
							<td>타이틀</td>
							<td><input class="form-control" name = title id="title" type="text" value=""></td>
						</tr>
						<tr>
							<td>날짜</td>
							<td><input class="form-control" type="text" id="datepicker1">
								~ <input class="form-control" type="text" id="datepicker2">
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea class="form-control" id="content" name = "content" rows="10"></textarea></td>
						</tr>
					</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="deleteButton">Delete</button>
					<button id="saveButton" type="button" class="btn btn-primary">Save</button>
				</div>
			</div>
		</div>
	</div>




	<!-- Pre-loader start -->
	<div class="theme-loader">
		<div class="ball-scale">
			<div class='contain'>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">

					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
				<div class="ring">
					<div class="frame"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- Pre-loader end -->


	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<nav class="navbar header-navbar pcoded-header">
				<div class="navbar-wrapper">

					<div class="navbar-logo">
						<a class="mobile-menu" id="mobile-collapse" href="#!"> <i
							class="ti-menu"></i>
						</a> <a class="mobile-search morphsearch-search" href="#"> <i
							class="ti-search"></i>
						</a> <a href="/"> <!-- 로고 이미지 --> <img
							src="/resources/assets/images/logo1.png" alt="Theme-Logo" />
						</a> <a class="mobile-options"> <i class="ti-more"></i>
						</a>
					</div>

					<div class="navbar-container container-fluid">
						<ul class="nav-left">
							<li>
								<div class="sidebar_toggle">
									<a href="javascript:void(0)"><i class="ti-menu"></i></a>
								</div>
							</li>

							<li><a href="#!" onclick="javascript:toggleFullScreen()">
									<i class="ti-fullscreen"></i>
							</a></li>
						</ul>

						<!-- 상단 프로필  -->
						<ul class="nav-right">

							<li class="user-profile header-notification"><a href="#!">

									<!-- 프로필 이미지 (고정) --> <img
									src="/resources/assets/images/userProfile.png"
									class="img-radius" alt="User-Profile-Image"> <!-- 로그인 여부에 따라 화면 변동 -->
									<!-- 유저 이름  --> <c:choose>
										<c:when test="${empty sessionScope.loginVO}">
											<span>로그인을 해주세요!</span>
										</c:when>
										<c:otherwise>
											<span>${sessionScope.loginVO.user_nm }</span>
										</c:otherwise>
									</c:choose> <i class="ti-angle-down"></i>
							</a> <!-- 프로필에 마우스를 올리면 생성되는 메뉴 --> <c:choose>
									<c:when test="${empty sessionScope.loginVO}">
										<!-- 로그인 안 했을 경우  -->
										<ul class="show-notification profile-notification">

											<li><a href="/user/loginForm"> <i
													class="ti-layout-sidebar-left"></i> Sign in
											</a></li>
											<li><a href="/user/joinForm"> <i
													class="ti-layout-sidebar-left"></i> Sign Up
											</a></li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul class="show-notification profile-notification">
											<li><a href="/user/updateForm"> <i class="ti-user"></i>
													Profile
											</a></li>
											<li><a href="/user/logout"> <i
													class="ti-layout-sidebar-left"></i> Logout
											</a></li>
										</ul>
									</c:otherwise>
								</c:choose></li>
						</ul>
					</div>
				</div>
			</nav>

			<!-- 오른 쪽 메뉴 칸 -->
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<nav class="pcoded-navbar">
						<div class="sidebar_toggle">
							<a href="#"><i class="icon-close icons"></i></a>
						</div>
						<div class="pcoded-inner-navbar main-menu">


							<div class="pcoded-navigatio-lavel"
								data-i18n="nav.category.navigation">뭐로 바꾸지,,</div>
							<ul class="pcoded-item pcoded-left-item">
								<li class="active"><a href="/"> <span
										class="pcoded-micon"><i class="ti-home"></i><b>D</b></span> <span
										class="pcoded-mtext" data-i18n="nav.dash.main">HOME</span> <span
										class="pcoded-mcaret"></span>
								</a></li>


								<li><a href="/calendar/main"> <span
										class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>FC</b></span>
										<span class="pcoded-mtext"
										data-i18n="nav.form-components.main">캘린더</span> <span
										class="pcoded-mcaret"></span>
								</a></li>
								<li><a href="/timer/main"> <span class="pcoded-micon"><i
											class="ti-timer"></i><b>FC</b></span> <span class="pcoded-mtext"
										data-i18n="nav.form-components.main">학습타이머</span> <span
										class="pcoded-mcaret"></span>
								</a></li>
							</ul>
					</nav>

					<!-- 캘린더 -->

					<div class="pcoded-content">
						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<div id='calendar'></div>
									<div id="styleSelector"></div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>


		<!-- Required Jquery -->
		<script type="text/javascript"
			src="/resources/assets/js/jquery/jquery.min.js"></script>
		<script type="text/javascript"
			src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script>
		<script type="text/javascript"
			src="/resources/assets/js/popper.js/popper.min.js"></script>
		<script type="text/javascript"
			src="/resources/assets/js/bootstrap/js/bootstrap.min.js"></script>
		<!-- jquery slimscroll js -->
		<script type="text/javascript"
			src="/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
		<!-- modernizr js -->
		<script type="text/javascript"
			src="/resources/assets/js/modernizr/modernizr.js"></script>
		<!-- am chart -->
		<script src="/resources/assets/pages/widget/amchart/amcharts.min.js"></script>
		<script src="/resources/assets/pages/widget/amchart/serial.min.js"></script>
		<!-- Todo js -->
		<script type="text/javascript "
			src="/resources/assets/pages/todo/todo.js "></script>
		<!-- Custom js -->
		<script type="text/javascript"
			src="/resources/assets/pages/dashboard/custom-dashboard.js"></script>
		<script type="text/javascript" src="/resources/assets/js/script.js"></script>
		<script type="text/javascript "
			src="/resources/assets/js/SmoothScroll.js"></script>
		<script src="/resources/assets/js/pcoded.min.js"></script>
		<script src="/resources/assets/js/demo-12.js"></script>
		<script
			src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
		<script>
			var $window = $(window);
			var nav = $('.fixed-button');
			$window.scroll(function() {
				if ($window.scrollTop() >= 200) {
					nav.addClass('active');
				} else {
					nav.removeClass('active');
				}
			});
		</script>
</body>

</html>
