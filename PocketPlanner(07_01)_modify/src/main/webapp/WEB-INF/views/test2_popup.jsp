<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />

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
	

	
	

	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	<!-- fullcalendar -->
	<link href='/resources/assets/fullcalendar/main.css' rel='stylesheet' />
	<script src='/resources/assets/fullcalendar/main.js'></script>
	

	<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
	<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>

	<script type="text/javascript">
	
	/*전역변수 선언*/
	var calendar = null;

	// select와 eventClick의 callback 값을 구분하여 저장
	var resultArg_select = null;
	var resultArg_click = null;
	
	var id = null;
	var title = null;
	var start = null;
	var end = null;
	var allDay = null;
	var content = null;

	//DB 연결 후 받는 값 저장
	var arrDB = null;
	var arrDBContent = null;

	/*DB에 있는 값을 가져와서 fullcalendar의 events 전송*/
	function calendarDB(){

			  $.ajax({
			        contentType:'application/json',
			        dataType:'json',
			        url:'/calendar/json',
			        type:'post',
			        async: false,
			        data: { id : "데이터"},
			        success:function(resp){
				        arrDB = resp;
			        },
			        error:function(){
			            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
			        }
			    }); 
			    
		}

	/*DB에 있는 값 중에 fullcalendar에서는 받지 않는 세부 내용 받아옴*/
	function calendarContent(){

		  $.ajax({
		        contentType:'application/json',
		        dataType:'json',
		        url:'/calendar/content',
		        type:'post',
		        async: false,
		        data: { id : "데이터"},
		        success:function(resp){

					arrDBContent = resp;
					content = new Array();
					
					for(var i = 0; i < arrDBContent.length; i++){
						content.push(resp[i].plan_content);
					}
		        },
		        error:function(){
		            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
		        }
		    }); 
		    
	}

	

	/*fullcalendar API*/ 
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		calendarDB();
		calendarContent();

		calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			//initialDate: '2020-09-12',
			initialView: 'dayGridMonth',
			locale : 'ko',
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			events : 
			    {
			      url: '/calendar/json',
			      method: 'POST',
			      extraParams: {
			        custom_param1: 'something',
			        custom_param2: 'somethingelse'
			      },
			      failure: function() {
			        alert('there was an error while fetching events!');
			      },
			      color: '#FC6180',   // a non-ajax option
			      textColor: 'white' // a non-ajax option		    
			      }
			  ,
			select : function(arg) {

				//    select의 콜백값 arg의 형태 
				//    => arg.start(startStr) / arg.end(endStr) / arg.allDay
				resultArg_select = arg;
				//console.log("resultArg_select(select했을 때 콜백 값) : ", resultArg_select);

				/* 전역변수 값 설정 */
				id = arg.id; //고의로 설정(undefined 설정을 위해서)
				start = arg.start;
				end = arg.end;
				allDay = arg.allDay;

				var str1 = arg.startStr;
				var str2 = arg.endStr;
				
				var date1 = str1.split("T", 1); //split을 사용하면 array 형태로 반환됨
				var date2 = str2.split("T", 1); //split -> array

				$("#myModal").modal("show");

				// Modal 설정 - datepicker 설정
				$("#datepicker1").datepicker("setDate", date1[0]);
				$("#datepicker2").datepicker("setDate", date2[0]);
 				
				
				calendar.render();
				calendar.unselect();

			},
			eventDrop : function(info) {
				save();
			},
			eventClick : function(arg) {

//			    	eventClick의 콜백값 arg의 형태 
//						=> arg.event.start(startStr) / arg.event.end(endStr) / arg.event.allDay	

					resultArg_click = arg;
					//console.log("resultArg(eventClick시 콜백) : ", resultArg_click);

					/* 전역 변수값 설정해주기(일정용) */
					id = arg.event.id;
					allDay = arg.event.allDay;
					start = arg.event.startStr;
					end = arg.event.endStr;

					
				/* modal에 값 로드하기 */	
					
					// 1.modal title 로딩
					$("#title").val(arg.event.title);

					// 2. modal content 로딩
					 calendarContent(); // modal에 content를 로딩하기 위해 content를 받아옴(arrDBContent 설정)
					
					 $.each(arrDBContent, function(index, item){
				            if(item.plan_num == arg.event.id){
					            //modal의 id값이 content인 textarea에 값 넣기
				            	$("#content").val(item.plan_content);
					         }
			            });

			        // 3. modal date 로딩
			        	// allDay의 여부에 따라 startStr과 endStr 값이 다르기 때문에 설정 필요
					if(arg.event.allDay == true){

						$("#datepicker1").datepicker("setDate", arg.event.startStr);
						$("#datepicker2").datepicker("setDate", arg.event.endStr);
							
					}else {

						var tempDate1 = arg.event.startStr;
						var tempDate2 = arg.event.endStr;

						var result1 = tempDate1.split("T",1);
						var result2 = tempDate2.split("T",1);

						$("#datepicker1").datepicker("setDate", result1[0]);
						$("#datepicker2").datepicker("setDate", result2[0]);
						

					}	
					// Modal 띄우기
					$("#myModal").modal("show");
			},
			eventResize : function(info) {
				save();
			},
			editable : true,
			dayMaxEvents : true

	    
		});

		calendar.render();
	});


	// DB에 내용 저장 및 전달
	function save() {

		var allEvent = calendar.getEvents()
		var events = new Array();

		for (var i = 0; i < allEvent.length; i++) {

			var obj = new Object();
			
			obj.title = allEvent[i]._def.title;	
			obj.allDay = allEvent[i].allDay;
			obj.start = allEvent[i].start;
			obj.end = allEvent[i].end;
			obj.content = content[i];

			events.push(obj);
		}

		//console.log("DB내용 저장 - JSON 전달");
		//console.log(events);
		//console.log(allEvent);
		//console.log(JSON.stringify(events));

		$.ajax({
			url : '/calendar/save',
			type : 'POST',
			dataType : 'json',
			contentType : 'application/json; charset=utf-8',
			data : JSON.stringify(events),
			success : function(data) {
				//console.log("DB 저장 성공 : ", data);
				
				calendar.removeAllEvents();
				calendarDB();
				calendar.addEventSource(arrDB);
				
			}
		});

	}

	$(document).ready(function() {

		// Modal 내용 갱신 - 모달을 숨길 때 리셋
		$('.modal').on('hidden.bs.modal', function (e) {
			if(typeof id == "undefined"){
				$(this).find('form')[0].reset();			    
			}
		});

		// Modal을 열 때 설정
		// 경우의 수 : 1. id값을 가지는 경우(eventClick) 2. id값을 가지지 않는 경우(select)
		// allDay 값이 false를 가지는 경우에는 datepicker을 사용 불가능하게 만들어야 함
		$('.modal').on('show.bs.modal', function (e) {

			// 새로 추가하는 경우는 그 전 내용을 비우도록 설정
			if(typeof id == "undefined"){
				$(this).find('form')[0].reset();			    
			}

				// allDay 값에 따라서 datepicker 기능을 다르게 설정
				if(allDay == false){

					//console.log("Modal 설정 - datepicker설정 / allDay : false");
					$("#datepicker1").attr("readonly",true);
					$("#datepicker2").attr("readonly",true);
					$('input[id=datepicker1]').datepicker('disable').removeAttr('disabled');
					$('input[id=datepicker2]').datepicker('disable').removeAttr('disabled');
					
				}
				else{

					//console.log("Modal 설정 - datepicker설정 / allDay : true");
					$("#datepicker1").attr("readonly",false);
					$("#datepicker2").attr("readonly",false);
					$('input[id=datepicker1]').datepicker('enable').removeAttr('disabled');
					$('input[id=datepicker2]').datepicker('enable').removeAttr('disabled');
					
				}
				
		});

		// dateepicker 데이터 포멧 설정
		$("#datepicker1, #datepicker2").datepicker({
			dateFormat : 'yy-mm-dd',
		});

		// save button 클릭 시
		$('#saveButton').on('click', function() {

			// Modal의 값 가져오기
			title = $("#title").val();

			//save 버튼 누르는 경우의 수 
			//id값이 있는지 없는지로 확인 가능(content 값을 위해서)
			// 1. select 로 새로운 일정 추가하기 
			//		1-1. allDay = true 인 경우
			//		1-2. allDay = false 인 경우
			// 2. eventclick으로 이미 추가된 일정 수정하기
			//		2-1. allDay = true 인 경우
			//		2-2. allDay = false 인 경우
			
			
			if(typeof id == "undefined"){
			// 1.select로 새로운 일정 추가
			
				if(resultArg_select.allDay == true){
					
					if (title) {
						calendar.addEvent({
							title : title,
							start :  $("#datepicker1").val(),
							end : $("#datepicker2").val(),
							allDay : resultArg_select.allDay,
							color : '#FC6180'
							
						})				
						content.push($("#content").val());
					}

				}else {

					if (title) {
						calendar.addEvent({
							title : title,
							start :  resultArg_select.start,
							end : resultArg_select.end,
							allDay : resultArg_select.allDay,
							color : '#FC6180'
							
						})
						
						content.push($("#content").val());
					}
					
				}
				
			}
			else{
				//2. eventClick으로 기존 내용 수정
				//console.log(resultArg_click);

				// allDay 값 여부로 start와 end 값을 다르게 설정
				if(resultArg_click.event.allDay == true){

					// id 값을 통하여 현재 event의 정보 가져와서 수정하기
					var event = calendar.getEventById(id);

					//console.log("event를 id로 가져올 경우", event);
					event.setProp("title", title);
					event.setStart($("#datepicker1").val());
					event.setEnd($("#datepicker2").val());
					event.setAllDay(resultArg_click.event.allDay);
	
					//console.log("기존 Event 수정(allDay:true)",calendar.getEventById(id));
					

				}
				else
				{	
					var event = calendar.getEventById(id);

					event.setProp("title", title);
					event.setStart(resultArg_click.event.start);
					event.setEnd(resultArg_click.event.end);
					event.setAllDay(resultArg_click.event.allDay);
					
					//console.log("기존 Event 수정(allDay:false)",calendar.getEventById(id));
	
				}

				
				for(var i = 0; i < arrDBContent.length; i++){
					if(arrDBContent[i].plan_num == id){
						content[i] = $("#content").val();
					}
				}
					
			}

			save();

			$("#myModal").modal("hide");

			//calendar.render();

		});

		// 삭제하기 버튼 클릭
		$("#deleteButton").on('click', function() {
			if (confirm('일정을 삭제하시겠습니까?')) {
				resultArg_click.event.remove();
				save();
			} 
		});
	});
	</script>
	
	
	<style type="text/css">
	
  .popper,
  .tooltip {
    position: absolute;
    z-index: 9999;
    background: black;
    color: white;
    width: 100px;
    border-radius: 3px;
    box-shadow: 0 0 2px rgba(0,0,0,0.5);
    padding: 10px;
    text-align: center;
  }
  .style5 .tooltip {
    background: #1E252B;
    color: #FFFFFF;
    max-width: 200px;
    width: auto;
    font-size: .8rem;
    padding: .5em 1em;
  }
  .popper .popper__arrow,
  .tooltip .tooltip-arrow {
    width: 0;
    height: 0;
    border-style: solid;
    position: absolute;
    margin: 5px;
  }

  .tooltip .tooltip-arrow,
  .popper .popper__arrow {
    border-color: #383535;
  }
  .style5 .tooltip .tooltip-arrow {
    border-color: #1E252B;
  }
  .popper[x-placement^="top"],
  .tooltip[x-placement^="top"] {
    margin-bottom: 5px;
  }
  .popper[x-placement^="top"] .popper__arrow,
  .tooltip[x-placement^="top"] .tooltip-arrow {
    border-width: 5px 5px 0 5px;
    border-left-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    bottom: -5px;
    left: calc(50% - 5px);
    margin-top: 0;
    margin-bottom: 0;
  }
  .popper[x-placement^="bottom"],
  .tooltip[x-placement^="bottom"] {
    margin-top: 5px;
  }
  .tooltip[x-placement^="bottom"] .tooltip-arrow,
  .popper[x-placement^="bottom"] .popper__arrow {
    border-width: 0 5px 5px 5px;
    border-left-color: transparent;
    border-right-color: transparent;
    border-top-color: transparent;
    top: -5px;
    left: calc(50% - 5px);
    margin-top: 0;
    margin-bottom: 0;
  }
  .tooltip[x-placement^="right"],
  .popper[x-placement^="right"] {
    margin-left: 5px;
  }
  .popper[x-placement^="right"] .popper__arrow,
  .tooltip[x-placement^="right"] .tooltip-arrow {
    border-width: 5px 5px 5px 0;
    border-left-color: transparent;
    border-top-color: transparent;
    border-bottom-color: transparent;
    left: -5px;
    top: calc(50% - 5px);
    margin-left: 0;
    margin-right: 0;
  }
  .popper[x-placement^="left"],
  .tooltip[x-placement^="left"] {
    margin-right: 5px;
  }
  .popper[x-placement^="left"] .popper__arrow,
  .tooltip[x-placement^="left"] .tooltip-arrow {
    border-width: 5px 0 5px 5px;
    border-top-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    right: -5px;
    top: calc(50% - 5px);
    margin-left: 0;
    margin-right: 0;
  }
	</style>

 
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
  
  
    <div id='calendar'></div>
    
    
  
  </body>
  
  
</html>