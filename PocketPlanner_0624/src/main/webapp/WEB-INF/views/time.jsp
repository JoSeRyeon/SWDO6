<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/assets/js/jquery/jquery-3.6.0.js"></script>
<script  type="text/javascript">
  
    var time = 3000;
    var min = "";
    var sec = "";
    var saveTime = 0;
    var x;


    $(function(){
	 $("#timerStop").on("click" , function(){
			alert("안녕!");
			clearInterval(x);
			/* if(10 > 0){ */
				$.ajax({
					url: "/timer/save", //요청주소
					type: "get", //전송방식
					data: {
							saveTime : 10
						},
					success: function(data){
						console.log(data);
							
						},
					error: function(e){
						console.log(e);
						}
				});
				saveTime = 0;
			/* } */
		}); });
	

/* 	    //타이머 종료
    function timerStop(){
    	clearInterval(x);
    	if(saveTime > 0){
    		location.href = "/timer/save?saveTime="+saveTime;
            saveTime = 0;
        	} 
    }*/
    function timer50(){
    	clearInterval(x);
    	if(saveTime > 0){
    		location.href = "/timer/save?saveTime="+saveTime;
            saveTime = 0;
        	}
    	
    	document.getElementById("demo").innerHTML = "50분00초";
		time = 3000;
		
        }

    function timer25(){
    	clearInterval(x);
    	if(saveTime > 0){
    		location.href = "/timer/save?saveTime="+saveTime;
            saveTime = 0;
        	}
    	document.getElementById("demo").innerHTML = "25분00초";
		time = 1500;
        }

  

    //타이머 시작
    function timerStart(){
    	
    	x = setInterval(function(){
    		
    			min = parseInt(time/60);
    			sec = time%60;

    			document.getElementById("demo").innerHTML = min + "분" + sec + "초";
    			time--;
    			saveTime++;

    			//타임아웃 시 쉬는 시간 10분 제공
    			/* if(time < 0){
    					clearInterval(x);
    					breaktimerStart();
    					
    					alert("쉬는 시간입니다!");
    					document.getElementById("demo").innerHTML = "10분00초";
    					time = 600;
    					continue; }  */
    					
    			if(time < 0){
    				clearInterval(x);
    				document.getElementById("demo").innerHTML = "00분00초";
    				time = 3000;
    			}
    			
    		} , 1000);
    	}

     
 </script> 
 <style type="text/css">
  
  .btn{
  font-size:20px; 
  padding:10px 40px;
  width: 250px;
  }
  
  </style>
  
</head>
<body>
 <div class="page-body">
                   <div class="row"> 
						<!-- <div style="text-align: center;"> -->
						<h1><div id = "demo"  style = "font-size : 200px; font-weight : bolder;">00분00초</div></h1>
						<div>
							<input type = "button" value = "50분 타이머" class="btn btn-danger btn-round" onclick = "timer50();" id="timer50">
							<input type = "button" value = "25분 타이머" class="btn btn-primary btn-round" onclick = "timer25();" id ="timer25">
						</div><br>
						<div>
							<input type ="button" value = "학습 시작" class="btn btn-primary btn-round" onclick = "timerStart();" >
							<input type ="button" value = "학습 종료" class="btn btn-danger btn-round" onclick = "timerStop();" id = "timeStop">
						</div>
					</div>
</div>	

</body>
</html>