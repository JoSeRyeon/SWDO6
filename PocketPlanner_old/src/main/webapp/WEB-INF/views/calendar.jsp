<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <title>POCKET PLANNER - CALENDAR </title>
   
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="CodedThemes">
      <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
      <meta name="author" content="CodedThemes">
      <!-- Favicon icon -->
      <link rel="icon" href="/resources/assets/images/favicon.ico" type="image/x-icon">
      <!-- Google font-->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="/resources/assets/css/bootstrap/css/bootstrap.min.css">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="/resources/assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="/resources/assets/icon/icofont/css/icofont.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
      <link rel="stylesheet" type="text/css" href="/resources/assets/css/jquery.mCustomScrollbar.css">
  
  	<link href='/resources/assets/fullcalendar/main.css' rel='stylesheet' />
    <script src='/resources/assets/fullcalendar/main.js'></script>
    
    <script>

    var calendar = null;

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

         calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          //initialDate: '2020-09-12',
          navLinks: true, // can click day/week names to navigate views
          selectable: true,
          selectMirror: true,
          select: function(arg) {
            var title = prompt('?????? ?????????: ');
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay
              })
            }

            //console.log(arg);

            save();
            
            calendar.unselect()
          },
          eventDrop: function(info) {
        	    alert(info.event.title + " was dropped on " + info.event.start.toISOString());
        	    
        	    if (!confirm("????????? ?????? ???????????????????")) {
        	      info.revert();
        	    }

        	    save();
        	  },
          eventClick: function(arg) {
            if (confirm('????????? ?????????????????????????')) {
              arg.event.remove()
            }

            save();
          },
          eventResize: function(info) {
        	    alert(info.event.title + " end is now " + info.event.end.toISOString());

        	    console.log(info.event.end)
        	    if (!confirm("????????? ?????????????????????????")) {
            	    console.log(info.event.end)
        	      info.revert();
        	    }

        	    save();
        	  },
          editable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: [
          ]
        });

        
        calendar.render();
      });


    function save(){
		//console.log(arg);

		var allEvent = calendar.getEvents()
		//console.log(allEvent);
		var events = new Array();

		for(var i = 0; i < allEvent.length; i++){

			var obj = new Object();
			
			obj.title = allEvent[i]._def.title;
			obj.allDay = allEvent[i]._def.allDay;
			obj.start = allEvent[i]._instance.range.start;
			obj.end = allEvent[i]._instance.range.end;

			events.push(obj);
		}

		console.log(JSON.stringify(events));

		$.ajax({
				url: '/calendar/save',
				type: 'POST',
				dataType: 'json',
				data: {
					jsonData : JSON.stringify(events)
				},
				success: function(data) {
					console.log(data);
				}
			});
    }
    
    
    </script>
  
  
  </head>

  <body>
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
                        <a class="mobile-menu" id="mobile-collapse" href="#!">
                            <i class="ti-menu"></i>
                        </a>
                        <a class="mobile-search morphsearch-search" href="#">
                            <i class="ti-search"></i>
                        </a>
                        <a href="/">
                        
                        <!-- ?????? ????????? -->
                            <img src="/resources/assets/images/logo1.png" alt="Theme-Logo" />
                        </a>
                        <a class="mobile-options">
                            <i class="ti-more"></i>
                        </a>
                    </div>

                    <div class="navbar-container container-fluid">
                        <ul class="nav-left">
                            <li>
                                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                            </li>

                            <li>
                                <a href="#!" onclick="javascript:toggleFullScreen()">
                                    <i class="ti-fullscreen"></i>
                                </a>
                            </li>
                        </ul>
                        
                        <!-- ?????? ?????????  -->
                         <ul class="nav-right">
                         
                            <li class="user-profile header-notification">
                                <a href="#!">
                                	<!-- ????????? ????????? (??????) -->
                                    <img src="/resources/assets/images/userProfile.png" class="img-radius" alt="User-Profile-Image">
                                    
                                    <!-- ?????? ?????? -->
                                    <span>John Doe</span>
                                    
                                    <!-- ???????????? ???????????? ????????? ???????????? ?????? -->
                                    <i class="ti-angle-down"></i>
                                </a>
                                <ul class="show-notification profile-notification">
                                    <!-- <li>
                                        <a href="#!">
                                            <i class="ti-settings"></i> Settings
                                        </a>
                                    </li> -->
                                    <li>
                                        <a href="#">
                                            <i class="ti-user"></i> Profile
                                        </a>
                                    </li>
                                     <li>
                                        <a href="/user/loginForm">
                                            <i class="ti-layout-sidebar-left"></i> Sign in
                                        </a>
                                    </li>
                                     <li>
                                        <a href="/user/joinForm">
                                            <i class="ti-layout-sidebar-left"></i> Sign Up
                                        </a>
                                    </li>
                                    <li>
                                        <a href="auth-normal-sign-in.html">
                                            <i class="ti-layout-sidebar-left"></i> Logout
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            
            <!-- ?????? ??? ?????? ??? -->
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu">
                         
                            
                            <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">?????? ?????????,,</div>
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="active">
                                    <a href="/">
                                        <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.dash.main">HOME</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                
                               
                                <li>
                                    <a href="/calendar/main">
                                        <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">?????????</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/timer/main">
                                        <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">???????????????</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                            
                          
                                
                    </nav>
                    
                    <!-- ????????? -->
                    
                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <div id='calendar'></div>
                                    <div id="styleSelector">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>

        
<!-- Required Jquery -->
<script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="/resources/assets/js/modernizr/modernizr.js"></script>
<!-- am chart -->
<script src="/resources/assets/pages/widget/amchart/amcharts.min.js"></script>
<script src="/resources/assets/pages/widget/amchart/serial.min.js"></script>
<!-- Todo js -->
<script type="text/javascript " src="/resources/assets/pages/todo/todo.js "></script>
<!-- Custom js -->
<script type="text/javascript" src="/resources/assets/pages/dashboard/custom-dashboard.js"></script>
<script type="text/javascript" src="/resources/assets/js/script.js"></script>
<script type="text/javascript " src="/resources/assets/js/SmoothScroll.js"></script>
<script src="/resources/assets/js/pcoded.min.js"></script>
<script src="/resources/assets/js/demo-12.js"></script>
<script src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
var $window = $(window);
var nav = $('.fixed-button');
    $window.scroll(function(){
        if ($window.scrollTop() >= 200) {
         nav.addClass('active');
     }
     else {
         nav.removeClass('active');
     }
 });
</script>
</body>

</html>
