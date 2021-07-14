<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <title>POCKET PLANNER </title>
   
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
                        
                        <!-- 로고 이미지 -->
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
                        
                        <!-- 상단 프로필  -->
                         <ul class="nav-right">
                         
                            <li class="user-profile header-notification">
                                <a href="#!">
                                	<!-- 프로필 이미지 (고정) -->
                                    <img src="/resources/assets/images/userProfile.png" class="img-radius" alt="User-Profile-Image">
                                    
                                    <!-- 유저 이름 -->
                                    <span>John Doe</span>
                                    
                                    <!-- 프로필에 마우스를 올리면 생성되는 메뉴 -->
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
            
            <!-- 오른 쪽 메뉴 칸 -->
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    <nav class="pcoded-navbar">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        <div class="pcoded-inner-navbar main-menu">
                         
                            
                            <div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">뭐로 바꾸지,,</div>
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
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">캘린더</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/timer/main">
                                        <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">학습타이머</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                                
                                
                                
                            </ul>
                            
                           <!--  <ul class="pcoded-item pcoded-left-item"> 
                                <li>
                                    <a href="form-elements-component.html">
                                        <span class="pcoded-micon"><i class="ti-layers"></i><b>FC</b></span>
                                        <span class="pcoded-mtext" data-i18n="nav.form-components.main">학습타이머</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul> -->
                                
                    </nav>
                    
                    <!-- 메인 창 상단블록 -->
                    
                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <div class="main-body">
                                <div class="page-wrapper">

                                    <div class="page-body">
                                        <div class="row"> 
                                        
                                        
                                            <!-- 총 학습시간  --> 
                                            <div class="col-md-3 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
                                                        <span class="text-c-blue f-w-600">총 학습시간</span>
                                                        <h4>50시간3분25초</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                                <i class="text-c-blue f-16 icofont icofont-warning m-r-10"></i><!-- Get more space -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            
                                            <!-- 오늘 학습시간  -->
                                            <!-- card1 start -->
                                            <div class="col-md-3 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="icofont icofont-warning-alt bg-c-green card1-icon"></i>
                                                        <span class="text-c-green f-w-600">오늘 학습시간</span>
                                                        <h4>45분 09초</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                                <i class="text-c-green f-16 icofont icofont-tag m-r-10"></i><!-- Tracked via microsoft -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            
                                            <!-- 학습 목표 -->
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-6" >
                                                <div class="card widget-card-1" >
                                                    <div class="card-block-small" onclick = "goalSetting()">
                                                        <i class="icofont icofont-social-twitter bg-c-yellow card1-icon"></i>
                                                        <span class="text-c-yellow f-w-600">학습목표</span>
                                                        <h4>프로젝트가 빨리 끝났으면 좋겠다.</h4>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                                <i class="text-c-yellow f-16 icofont icofont-refresh m-r-10"></i><!-- Just update -->
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            
                                            
                                            <!-- 학습 통계  -->
                                            
                                            <div class="col-md-12 col-xl-12" >
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h5>주별 학습통계</h5>
                                                        <div class="card-header-left ">
                                                        </div>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="icofont icofont-simple-left "></i></li>
                                                                <li><i class="icofont icofont-maximize full-card"></i></li>
                                                                <li><i class="icofont icofont-minus minimize-card"></i></li>
                                                                <li><i class="icofont icofont-refresh reload-card"></i></li>
                                                                <li><i class="icofont icofont-error close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div id="statestics-chart" style="height:517px;"></div>
                                                    </div>
                                                </div>
                                            </div>



                                			<!-- 할 일 목록  -->
                                            
                                            <div class="col-md-12 col-xl-6">
                                                <div class="card add-task-card">
                                                    <div class="card-header">
                                                        <div class="card-header-left">
                                                            <h5>할 일 목록</h5>
                                                        </div>
                                                        <div class="card-header-right">
                                                            <button class="btn btn-card btn-primary">ADD TASK </button>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="to-do-list">
                                                            <div class="checkbox-fade fade-in-primary d-block">
                                                                <label class="check-task d-block">
                                                                    <input type="checkbox" value="">
                                                                    <span class="cr">
                                                                        <i class="cr-icon icofont icofont-ui-check txt-default"></i>
                                                                    </span>
                                                                    <span><h6>Schedule Meeting with Compnes <span class="label bg-c-green m-l-10 f-10">2 week</span></h6></span>
                                                                    <div class="task-card-img m-l-40">
                                                                        <a href="#!"><img src="/resources/assets/images/avatar-2.jpg" data-toggle="tooltip" title="Lary Doe" alt="" class="img-40"></a>
                                                                        <a href="#!"><img src="/resources/assets/images/avatar-3.jpg" data-toggle="tooltip" title="Alia" alt="" class="img-40 m-l-10"></a>
                                                                    </div>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="to-do-list">
                                                            <div class="checkbox-fade fade-in-primary d-block">
                                                                <label class="check-task d-block">
                                                                    <input type="checkbox" value="">
                                                                    <span class="cr">
                                                                        <i class="cr-icon icofont icofont-ui-check txt-default"></i>
                                                                    </span>
                                                                    <span><h6>Meeting With HOD's and borad</h6><p class="text-muted m-l-40">23 january 2003</p></span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="to-do-list">
                                                            <div class="checkbox-fade fade-in-primary d-block">
                                                                <label class="check-task d-block">
                                                                    <input type="checkbox" value="">
                                                                    <span class="cr">
                                                                        <i class="cr-icon icofont icofont-ui-check txt-default"></i>
                                                                    </span>
                                                                    <span><h6>Create template, admin with responsive<span class="label bg-c-pink m-l-10">2 week</span></h6></span>
                                                                    <div class="task-card-img m-l-40">
                                                                        <a href="#!"><img src="/resources/assets/images/avatar-2.jpg" data-toggle="tooltip" title="Alia" alt="" class="img-40"></a>
                                                                        <a href="#!"><img src="/resources/assets/images/avatar-3.jpg" data-toggle="tooltip" title="Suzen" alt="" class="img-40 m-l-10"></a>
                                                                        <a href="#!"><img src="/resources/assets/images/avatar-4.jpg" data-toggle="tooltip" title="Lary Doe" alt="" class="img-40 m-l-10"></a>
                                                                        <a href="#!"><img src="/resources/assets/images/avatar-2.jpg" data-toggle="tooltip" title="Josephin Doe" alt="" class="img-40 m-l-10"></a>
                                                                    </div>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="to-do-list">
                                                            <div class="checkbox-fade fade-in-primary d-block">
                                                                <label class="check-task d-block">
                                                                    <input type="checkbox" value="">
                                                                    <span class="cr">
                                                                        <i class="cr-icon icofont icofont-ui-check txt-default"></i>
                                                                    </span>
                                                                    <span><h6>Meeting With HOD's and borad</h6>
                                                                        <p class="text-muted m-l-40">23 january 2003</p></span>
                                                                        <div class="task-card-img m-l-40">
                                                                            <a href="#!"><img src="/resources/assets/images/avatar-2.jpg" data-toggle="tooltip" title="Lary Doe" alt="" class="img-40"></a>
                                                                            <a href="#!"><img src="/resources/assets/images/avatar-3.jpg" data-toggle="tooltip" title="Alia" alt="" class="img-40 m-l-10"></a>
                                                                            <a href="#!"><img src="/resources/assets/images/avatar-2.jpg" data-toggle="tooltip" title="Josephin Doe" alt="" class="img-40 m-l-10"></a>
                                                                        </div>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Data widget End -->
                                                
                                            </div>
                                        </div>
                                    </div>

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
