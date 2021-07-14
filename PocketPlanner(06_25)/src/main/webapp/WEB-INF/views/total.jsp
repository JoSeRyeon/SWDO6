<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="/resources/assets/css/bootstrap/css/bootstrap.min.css">

<!-- Required Jquery -->
<script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script> 
<script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/bootstrap/js/bootstrap.min.js"></script>




<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.3.2/bootbox.min.js"></script> 

 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">




function message(){
	swal({
		  text: '학습목표를 설정해주세요.',
		  content: "input",
		  button: {
				  	text: "입력",
				    closeModal: false,
				    className: "btn btn-primary btn-round"
		  },
		})
		 .then(user_goal => {
		  if (user_goal != null){

			  
			 location.href = "/user/goalSetting?user_goal="+user_goal;
			  }
		})
		
		.catch(err => {
		  if (err) {
		    swal("ERROR", "다시 시도해주세요.", "error");
		  } else {
		    swal.stopLoading();
		    swal.close();
		  } 
		});
};



</script>


</head>
<body>

<button id="promptEx">Prompt Example</button><br>
<button onclick="message()">클릭</button>


<button id="testBtn" class="btn">모달 테스트</button>
  <!-- 회원가입 확인 Modal-->
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">학습 목표</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
				<input type = "text">
				
				</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="#">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>

<button type="button" data-toggle="modal" data-target="#myModal" id = "myModal">Launch modal</button>

</body>	

</html>