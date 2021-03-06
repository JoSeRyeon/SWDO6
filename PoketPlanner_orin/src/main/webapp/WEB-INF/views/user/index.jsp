<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>FullCalendar Example</title>
    

    <link rel="stylesheet" href="/resources/assets/fullcalendar/fullcalendar.min.css" />
    <link rel="stylesheet" href="/resources/assets/fullcalendar/bootstrap.min.css">
    <link rel="stylesheet" href='/resources/assets/fullcalendar/select2.min.css' />
    <link rel="stylesheet" href='/resources/assets/fullcalendar/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="/resources/assets/fullcalendar/main.css">

    <script>

    document.addEventListener('DOMContentLoaded', function() {
        var initialLocaleCode = 'ko';
        var localeSelectorEl = document.getElementById('locale-selector');
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
          },
          initialDate: '2021-06-17',
          locale: initialLocaleCode, //or 'ko'
          buttonIcons: false, // show the prev/next text
          weekNumbers: true,
          navLinks: true, // can click day/week names to navigate views
          editable: true,
          dayMaxEvents: true, // allow "more" link when too many events
          events: [

              
          ]
          
        });

        calendar.render();
    });

    </script>


</head>

<body>
    <div class="container">
    
            <div id="wrapper">
            <div id="loading"></div>
            <div id='calendar'></div>
        </div>

        <!-- ?????? ????????? ???????????? -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">????????????1</a></li>
                <li><a tabindex="-1" href="#">????????????2</a></li>
                <li><a tabindex="-1" href="#">????????????3</a></li>
                <li><a tabindex="-1" href="#">????????????4</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>


        <!-- ?????? ?????? MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">????????????</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">?????????</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">??????</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">???</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">??????</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="????????????1">????????????1</option>
                                    <option value="????????????2">????????????2</option>
                                    <option value="????????????3">????????????3</option>
                                    <option value="????????????4">????????????4</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">??????</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">?????????</option>
                                    <option value="#9775fa" style="color:#9775fa;">?????????</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">?????????</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">?????????</option>
                                    <option value="#f06595" style="color:#f06595;">?????????</option>
                                    <option value="#63e6be" style="color:#63e6be;">?????????</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">?????????</option>
                                    <option value="#4d638c" style="color:#4d638c;">??????</option>
                                    <option value="#495057" style="color:#495057;">?????????</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">??????</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                        <button type="button" class="btn btn-primary" id="save-event">??????</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">??????</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">??????</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">??????</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">?????????</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="????????????1">????????????1</option>
                            <option value="????????????2">????????????2</option>
                            <option value="????????????3">????????????3</option>
                            <option value="????????????4">????????????4</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view">????????????</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="??????"
                                checked>??????</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="??????"
                                checked>??????</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="??????"
                                checked>??????</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="??????"
                                checked>??????</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="??????"
                                checked>??????</label>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->

    <script src="/resources/assets/fullcalendar/jquery.min.js"></script>
    <script src="/resources/assets/fullcalendar/bootstrap.min.js"></script>
    <script src="/resources/assets/fullcalendar/moment.min.js"></script>
    <script src="/resources/assets/fullcalendar/fullcalendar.min.js"></script>
    <script src="/resources/assets/fullcalendar/ko.js"></script>
    <script src="/resources/assets/fullcalendar/select2.min.js"></script>
    <script src="/resources/assets/fullcalendar/bootstrap-datetimepicker.min.js"></script>
    <script src="/resources/assets/fullcalendar/main_git.js"></script>
    <script src="/resources/assets/fullcalendar/addEvent.js"></script>
    <script src="/resources/assets/fullcalendar/editEvent.js"></script>
    <script src="/resources/assets/fullcalendar/etcSetting.js"></script>
</body>

</html>