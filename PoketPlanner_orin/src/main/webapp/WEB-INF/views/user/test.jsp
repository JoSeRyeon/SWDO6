<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
 
<head>
    <meta charset="UTF-8">
    <title>해당하는 페이지 이름</title>
    
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script src='/resources/assets/fullcalendar/main.js'></script>
	<link href='/resources/assets/fullcalendar/main.css' rel='stylesheet' />



    <script type="text/javascript" src="/resources/assets/fullcalendar/bootstrap/js/modal.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/assets/fullcalendar/bootstrap/css/modal.css">


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
	        //var title = prompt('일정을 추가하세요:');

	        action='create';
			type = 'POST'
			$("#modal-title").text("새 글 작성");
			var userName = $("#myModal").modal();
        	console.log(userName);
	        
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
		      //list(arg.event);
		      //arg.event.remove()
		      event = arg;

		      console.log(event);
		      
			$(document).ready(function() {
               // $("#exampleModal").modal("show");

                console.log(event);
				action='create';
				type = 'POST'
				$("#modal-title").text("새 글 작성");
				$("#myModal").modal();


				if(event){

					calendar.addEvent({
			            title: event.title,
			            start: event.start,
			            end: event.end,
			            allDay: event.allDay
			          })

			         
					
				}


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

				//console.log(allEvent);

				for(var i = 0; i < allEvent.length; i++){
					//alert(allEvent[i]._def.title)
					}
			}
		
	</script>
 
 
</head>
 
<body>

	<div class="container">
		
		<table class="table table-bordered">
			<thead>
				<tr>
					<th class="col-md-1">bno</th>
					<th class="col-md-7">contents</th>
					<th class="col-md-2">userName</th>
					<th class="col-md-2">수정 / 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}">
					<tr id="tr${board.bno}">
						<td>${board.bno}</td>
						<td><a href="/board/${board.bno}">${board.contents}</a></td>
						<td>${board.userName}</td>
						<td>
							<div class="btn-group">
								<button name="modify" value="${board.bno}"
									class="btn btn-xs btn-warning">수정</button>
								<button name="delete" value="${board.bno}"
									class="btn btn-xs btn-danger">삭제</button>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>

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
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

	<div>
    	<div id='calendar'></div>
	</div>
</body>
 
</html>
 