<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
    
 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
 	
    <script src='/resources/assets/fullcalendar/main.js'></script>
    
    <link href="/resources/assets/fullcalendar/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link href='/resources/assets/fullcalendar/main.css' rel='stylesheet' />
    <link href="/resources/assets/fullcalendar/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    
    <script type="text/javascript" src="/resources/assets/fullcalendar/bootstrap/js/modal.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/assets/fullcalendar/bootstrap/css/modal.css">
    
    
    
	<style type="text/css">a {color: black;} </style>


<script>
	
	var event = null;
	var calendar = null;
	  document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	
	    calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: {
	        left: 'prevYear,prev,next,nextYear today',
	        center: 'title',
	        right: 'dayGridMonth,dayGridWeek,dayGridDay'
	      },
	      //initialDate: '2020-09-12',
	      locale: 'ko',
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectMirror: true,
	      select: function(arg) {
	        var title = prompt('일정을 추가하세요:');
	        if (title) {
	          calendar.addEvent({
	            title: title,
	            start: arg.start,
	            end: arg.end,
	            allDay: arg.allDay
	          })
	        }
	        allSave();
	        calendar.unselect()
	      },
	      eventClick: function(arg) {
	        if (confirm('변경?')) {
		      list(arg.event);
		      //arg.event.remove()
		    
		    var test;
			$(document).ready(function() {
                test = $("#myModal").modal("show");
            });


   

	        }
	      },
	      editable: true,
	      dayMaxEvents: true // allow "more" link when too many events
		     
	    });
	
	    calendar.render();
	  });


		var list = function(arg){
			var title = arg.title;
			var start = arg.start;
			var end = arg.end

			event = arg;
			
			console.log(arg);


		        //document.getElementById("registerSchedule").style.display="block";
	        	
		    
			};


			function save(){
				//console.log(event);
				
				var title = event.title;
				var start = event.start;
				var end = event.end

				var new_title = $("#recipient-name").val();
				var message = $("#message-text").val()
				
				console.log(event.id);
				
				console.log(title);
				console.log(start);
				console.log(end);
				console.log(new_title);
				console.log(message);

				
			}


			function allSave(){
				var allEvent = calendar.getEvents();

				console.log(allEvent);

				var events = new Array(); 
				for(var i = 0; i < allEvent.length; i++){

					var obj = new Object();
					
					obj.title = allEvent[i]._def.title;
					obj.allDay = allEvent[i]._def.allDay;
					obj.start = allEvent[i]._instance.range.start;
					obj.end = allEvent[i]._instance.range.end;

					events.push(obj);
				}
				


				var jsonData = JSON.stringify(events);
				
				console.log(jsonData);

				saveData(jsonData);
			}

			function saveData(jsonData){
				$.ajax({
					type : 'POST',
					url : '/callendar/save',
					traditional : true,
					data : { jsonData : jsonData},
					dataType:'json',
					contentType : "application/json; charset=utf-8"
				})
				.done(function(result){
					})
				.fail(function(request, status, error){
					alert("에러 발생 : " + error)
					})
			}
		
	</script>

    <style>

	  body {
	    margin: 40px 10px;
	    padding: 0;
	    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	    font-size: 14px;
	  }
	
	  #calendar {
	    max-width: 1100px;
	    margin: 0 auto;
	  }

	</style>
  </head>
  <body>
  
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 id="modal-title" class="modal-title"></h4>
			</div>
			<div class="modal-body">
				<table class="table">
					<tr>
						<td>사용자명</td>
						<td><input class="form-control" id="userName" type="text"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea class="form-control" id="contents" rows="10"></textarea></td>
					</tr>					
				</table>
			</div>
			<div class="modal-footer">
				<button id="modalSubmit" type="button" class="btn btn-success">Submit</button>
				<button type="button" id = "remove" class="btn btn-default" data-dismiss="modal">Remove</button>
			</div>
		</div>
	</div>
</div>

	<div>
    	<div id='calendar'></div>
	</div>
	
	


</body>
</html>