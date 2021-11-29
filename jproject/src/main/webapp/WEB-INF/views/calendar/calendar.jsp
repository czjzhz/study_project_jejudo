<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<link href='${path}/calendar/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='${path}/calendar/fullcalendar/lib/main.js'></script>
<script src='${path}/calendar/fullcalendar/lib/ko.js'></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
/* 
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      }); */
	var calendar = null;
	document.addEventListener('DOMContentLoaded', function() { 
		var calendarEl = document.getElementById('calendar'); 
      		// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속 성2:속성값2..}) 
		
		calendar = new FullCalendar.Calendar(calendarEl, { 
			headerToolbar: { 
				left: 'prev,next today', 
				center: 'title', 
				right: 'dayGridMonth,timeGridWeek,timeGridDay'
			}, 
		initialDate: '2021-11-27',// 초기 로딩 날짜. 
		navLinks: true,  // can click day/week names to navigate views 
		selectable: true, 
		selectMirror: true, 
		// 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용.. 
		select:function(arg) { 
			console.log(arg); 
		
			var title = prompt('입력할 일정:'); 
			// title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가 
			if (title) { 
				calendar.addEvent({ 
				title: title, 
				start: arg.start, 
	    	  	end: arg.end, 
	    	  	allDay: 
	    	  	arg.allDay, 
	    	  	backgroundColor:"yellow", 
	    	  	textColor:"blue" 
	    	  	}) 
			} 
			calendar.unselect()
		},
		eventClick: function(arg) { 
			// 있는 일정 클릭시, 
			console.log("#등록된 일정 클릭#"); 
			console.log(arg.event); 
		
			if (confirm('일정을 삭제 하시겠습니까?')) { 
				arg.event.remove() 
			} 
		}, 
		editable: true, 
		dayMaxEvents: true, // allow "more" link when too many events 
//		events: 
		//================ ajax데이터 불러올 부분 =====================// 
		locale:'ko'
		}); 
			calendar.render(); 
	});
		
 	function allSave() {
 		var allEvent = calendar.getEvents();
 		console.log(allEvent);
 		
 		var events = new Array();
 		
 		for(var i=0; i<allEvent.length; i++){
 			
 			var obj = new Object();
 			
 			obj.title = allEvent[i]._def.title;				// 일정 명칭
 			obj.allday = allEvent[i]._def.allDay;			// 하루종일 일정인지 알려주는 boolean값
 			obj.start = allEvent[i]._instance.range.start;	// 시작 날자 및 시간
 			obj.end = allEvent[i]._instance.range.end;	// 마치는 날자 및 시간
 			
 			events.push(obj);
 		}
 		var jsondata = JSON.stringify(events);
 		console.log(jsondata);
 		
 		savedata(jsondata);
 	}
      
 	function savedata(jsondata){
 		$.ajax({
 			type:'POST',
 			url: "calendar.do",
 			data: {"alldata": jsondata},
 			dataType: 'json',
 			async: false
 		})
 		.done(function(result){	
 		})
 		.fail(function(request, status, error){
 			alert("오류발생:"+error);
 		})
 	}
 	
 	
    </script>
</head>
<body>
	<div id='calendar'></div>
	<input type="button" onclick="javascript:allSave();" value="저장">
</body>
</html>