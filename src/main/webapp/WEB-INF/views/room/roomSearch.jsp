<%@page import="java.text.DecimalFormat"%>
<%@page import="com.herejava.room.vo.Room"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<Room> list = (ArrayList<Room>)request.getAttribute("list");
DecimalFormat formatter = new DecimalFormat("###,###");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
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
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt"></div>
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
						<td class="room-image" rowspan="4"><img src="aa.jpg"></td>
						<th><span></span><%=r.getRoomName() %></th>
						<td>
						<%
						String engRoomName = "";
						String roomSize = "";
						String price = formatter.format(r.getRoomPrice());
						switch(r.getRoomNo()){
						case 6:
							engRoomName = "Royal Sweet";
							roomSize = "60~65m²";
							break;
						case 7:
							engRoomName = "Premium Sweet";
							roomSize = "55~60m²";
							break;
						case 8:
							engRoomName = "Sweet";
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
						<td colspan="4">예약 가능한 객실 수 : <span><%=r.getRoomCount() %></span></td>
					</tr>
					<tr class="tr-1 room-capacity">
						<td colspan="3">객실 최대 인원 : <span><%=r.getRoomCapacity() %></span></td>
						<td><button class="bc1 bs4">
							<%if(r.getRoomCount() != 0){ %>
							<%=price %> KRW
							<%}else{ %>
							예약불가
							<%} %>
						</button></td> 
					</tr>
				</table>
			</div>
		<%} %>
	</div>
	<br><br><br><br>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>