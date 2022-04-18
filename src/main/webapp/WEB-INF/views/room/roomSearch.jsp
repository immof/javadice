<%@page import="java.text.DecimalFormat"%>
<%@page import="com.herejava.room.vo.Room"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<Room> list = (ArrayList<Room>)request.getAttribute("list");
DecimalFormat formatter = new DecimalFormat("###,###");
String checkIn = (String)request.getAttribute("checkIn");
String checkOut = (String)request.getAttribute("checkOut");
int bookPeople = (Integer)request.getAttribute("bookPeople");
int diffDays = (Integer)request.getAttribute("diffDays");
String alert = (String)request.getAttribute("alert");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
<!--풀캘린터 CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet'>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
<style>
table{
	border-spacing : 0;
}
.room-show{
	width: 950px;
	margin: 0 auto;
	padding-top: 30px;
	padding-bottom: 30px;
	border-top: 1px solid #333;
}
.room-wrap *{
	font-size: 16px;
}
.room-image{
	width:290px;
	padding-right: 30px;
}
.room-image>img{
	width: 290px;
	height: 180px;
}
.room-name>th{
	font-size: 30px;
	font-weight: 400;
	width: 25%;
	height: 30px;
	text-align: left;
	padding-bottom: 5px;
	border-bottom: 1px solid #333;
}
.room-name>th>span{
	margin-left: 10px;
}
.room-name>td:nth-of-type(2){
	width: 150px;
	font-size: 20px;
	color: rgb(167, 167, 167);
	border-bottom: 1px solid #333;
}
.room-name>td:nth-of-type(3){
}
.room-name>td:nth-of-type(4){
	width: 200px;
}
.room-name>td:nth-of-type(4)>span{
	padding-right: 15px;
}
.room-option>td{
	height: 40px;
}
.room-count>td{
	padding-top: 25px;
}
.room-count>td>span{
	padding-left: 10px;
	font-size: 18px;
	font-weight: 700;
	color: #ccc;
}
.room-capacity>td>span{
	padding-left: 10px;
	font-size: 18px;
	font-weight: 700;
	color: #ccc;
}
.room-capacity>td>a>button{
	border: none;
	padding: 0;
	height: 50px;
	line-height: 50px;
}
.room-capacity>td>button{
	border: none;
	padding: 0;
	height: 50px;
	line-height: 50px;
}
.index-wrap{
	width: 565px;
	padding-top: 20px;
	padding-bottom: 80px;
	margin: 0 auto;
}
.index{
	display: flex;
}
.index>li{
	margin-right: 30px;
}
.index>li>span{
	display: inline-block;
	background-color: rgb(224, 224, 224);
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border-radius: 15px;
	margin-right: 5px;
}
.index>.selected>span{
	background-color: rgb(172, 158, 137);
}
/*풀캘린더 디자인*/
.calendar-wrap{
	width: 600px;
	margin: 0 auto;
	padding-top: 10px;
}
.calendar-wrap .fc-button{
	background-color: #998465;
	border: 1px solid #ccc;
}
.calendar-wrap .fc-button span{
	color: #fff;
}
.fc .fc-button-primary:disabled{
	background-color: #432f31;
	border-none;
}
/*서치바 디자인*/
.search-head{
	width: 100%;
	background-color: #ac9e89;
}
.search-tab{
	width: 900%;
	height: 50px;
	line-height: 50px;
	padding: 50px 80px;
}
.search-content>span>span>p{
	display: inline-block;
	font-weight: 900;
}
.search-content>span>span>span{
	padding-left: 20px;
	font-size: 30px;
	color: #fff;
}
.search-content>span{
	width: 1050px;
	display: flex;
	justify-content: space-between;
}
.search-content>span>button{
	width: 200px;
	padding: 0;
	height: 60px;
	background-color: #ac9e89;
	border: 1px solid #fff;
	color: #fff;
	font-size: 20px;
}
.search-content>span>button:hover{
	background-color: #685f51;
    cursor: pointer;
    border: none;
    transition: 0.3s;
}
.search-head{
	position: relative;
}
.search-head>p{
	position: absolute;
	color: #fff;
	top: 10px;
	left: 20px;
}
.search-head>p:hover{
	cursor: pointer;
}
#park{
	color: #fff;
	padding-top: 5px;
}
#peopleVal{
	padding-left: 0px;
}
.peopleBtn{
	color: #fff;
	padding: 0 10px;
	font-size: 20px;
}
.peopleBtn:hover{
	cursor: pointer;
}
.checkDate:hover{
	cursor: pointer;
}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="search-head">
			<p id="call">▲ 달력 숨기기     (원하시는 날짜를 달력에서 드래그 하십시오.)</p>
			<div class="search-tab">
				<div class="search-content">
					<span>
						<span>
							<p>체크인</p>
							<span id="checkIn" class="checkDate"><%=checkIn %></span>
						</span>
						<span>
							<p id="park"><%=diffDays %>박</p>
						</span>
						<span>
							<p>체크아웃</p>
							<span id="checkOut" class="checkDate"><%=checkOut %></span>
						</span>
						<span>
							<p>예약인원</p>
							<p class="peopleBtn" style="font-size: 33px;">-</p>
							<span id="peopleVal"><%=bookPeople %></span><span style="padding-left:0;">인</span>
							<p class="peopleBtn" style="font-size: 33px;">+</p>
						</span>
						<button class="searchBtn">검색</button>	
					</span>
				</div>
			</div>
		</div>
		
		<div class="calendar-wrap">
				<div id="calendar"></div>
		</div>
		<div class="belt">RESERVATION</div><br>
		<div class="index-wrap">
		<ul class= "index">
			<li class="selected">───<span>1</span>객실 선택</li>
			<li>───<span>2</span>예약 정보 입력</li>
			<li>───<span>3</span>결제하기</li>
		</ul>
		</div>
		<%for(Room r : list){ %>
			<div class="room-wrap">
				<table class="room-show">
					<tr class="tr-1 room-name">
						<td class="room-image" rowspan="4"><img src="/img/<%=r.getFilepath()%>"></td>
						<th><span></span><%=r.getRoomName() %></th>
						<td style="color:#998465;">
						<%
						String engRoomName = "";
						String roomSize = "";
						String price = formatter.format(r.getRoomPrice());
						switch(r.getRoomNo()){
						case 6:
							engRoomName = "Royal Suite";
							roomSize = "60~65m²";
							break;
						case 7:
							engRoomName = "Premier Suite";
							roomSize = "55~60m²";
							break;
						case 8:
							engRoomName = "Premier";
							roomSize = "50~55m²";
							break;
						case 9:
							engRoomName = "Deluxe";
							roomSize = "45~50m²";
							break;
						case 10:
							engRoomName = "Standard";
							roomSize = "40~45m²";
							break;
						}
						%>
						<%=engRoomName %>
						</td>
						<td></td>
						<td><span>|</span> 객실면적<%=roomSize %></td>
					</tr>
					<tr class="tr-1 room-option">
						<td colspan="4"><%=r.getRoomOption() %></td>
					</tr>
					<tr class="tr-1 room-count">
						<td colspan="4">예약 가능한 객실 수 : <span style="color:#998465;"><%=r.getRoomCount() %></span></td>
					</tr>
					<tr class="tr-1 room-capacity">
						<td colspan="3">객실 최대 인원 : <span style="color:#998465;"><%=r.getRoomCapacity() %></span></td>
						<td>
							<%if(r.getRoomCount() != 0){ %>
							<a href="/bookInfoInput.do?roomNo=<%=r.getRoomNo() %>&roomPrice=<%=r.getRoomPrice() %>&bookPeople=<%=bookPeople %>&checkIn=<%=checkIn %>&checkOut=<%=checkOut %>&payStayDay=<%=diffDays %>&roomName=<%=r.getRoomName() %>&roomCapacity=<%=r.getRoomCapacity() %>">
                            	<button class="bc1 bs4">
							<%=price %> KRW
								</button>
							</a>
							<%}else{ %>
							<button class="bc1 bs4">
							예약불가
							</button>
							<%} %>
							
						</td> 
					</tr>
				</table>
			</div>
		<%} %>
	</div>
	<br><br><br><br>
	<script>
		<%if(alert != null){%>
			alert("<%=alert%>");
		<%}%>
		//달력 보였다 숨겼다
		$("#call").on("click",function(){
			const calendar = $(".calendar-wrap");
			calendar.slideToggle();
			if($(this).text()=="▲ 달력 숨기기     (원하시는 날짜를 달력에서 드래그 하십시오.)"){
				$(this).text("▼ 달력 보이기");
			}else{
				$(this).text("▲ 달력 숨기기     (원하시는 날짜를 달력에서 드래그 하십시오.)");
			}
		});
		//달력 만들기
		document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	          initialView: 'dayGridMonth',
	          selectable: true,
	          select: function(info){
	        		//숙박일수
	        	  	let park = (info.end-info.start)/(1000*60*60*24)-1;
	        	  	//체크인
	        	  	const checkIn = info.startStr;
	        	  	//체크아웃 쪼개기
	        	  	let endStr = info.endStr;
	        	  	let year = endStr.substr(0,4);
	        	  	let month = endStr.substr(5,2);
	        	  	let day = endStr.substr(8,2)-1;
	        	  	//하루 클릭시
	        	  	if(checkIn.substr(8,2)==day){
	        	  		day++;
	        	  		park = 1;
	        	  	}
	        	  	//체크아웃 구하기
	        	  	if(day<10){
	        	  		day = "0"+day;
	        	  	}
	        	  	//드래그 해서 말일 선택시
	        	  	if(day=="00"){
	        	  		let endDayMonth = month-1;
	        	  		let endDay = new Date(year,endDayMonth,day);
	        	  		if(endDayMonth < 10){
	        	  			month = "0" + endDayMonth;
	        	  			console.log(month);
	        	  		}else{
	        	  			month = endDayMonth;
	        	  		}
	        	  		day = endDay.getDate();
	        	  	}
	        	  	//체크아웃 합치기
	        	  	const checkOut = year+"-"+month+"-"+day;
	        	    $("#checkIn").text(checkIn);
	        	    $("#checkOut").text(checkOut);
	        	    if(park<10){
	        	    	$("#park").text("0"+park+" 박");	
	        	    }else{
	        	    	$("#park").text(park+" 박");
	        	    }
	          }
	        });
	        calendar.render();
	      });
		//숙박인원 증가 감소
		$(".checkDate").on("click",function(){
			$("#call").click();
		});
		$(".peopleBtn").on("click",function(){
			const peopleVal = Number($("#peopleVal").text());
			if($(this).text() == "-"){
				if(peopleVal > 1){
					$("#peopleVal").text(peopleVal-1);
				}
			}else{
				if(peopleVal < 9){
					$("#peopleVal").text(peopleVal+1);	
				}
			}
		})
		$(".searchBtn").on("click",function(){
			const checkIn = $("#checkIn").text();
			const checkOut = $("#checkOut").text();
			const bookPeople = $("#peopleVal").text();
			$(location).attr('href','/bookSearch.do?checkIn='+checkIn+'&checkOut='+checkOut+'&bookPeople='+bookPeople);
		})
		//처음부터 안보이면 달력 뭉개져서 로딩하고 숨김
		$("#call").click();
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>