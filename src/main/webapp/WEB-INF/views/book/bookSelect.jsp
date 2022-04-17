<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Book b = (Book)request.getAttribute("b");
	String roomName = (String)request.getAttribute("roomName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
<style>
.content-wrap{
	width: 900px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	border-top : 1px solid #ccc;
	border-bottom : 1px solid #ccc;
	padding: 50px 0;
}
.page-content{
	text-align: center;
}
.tr-1>th{
	width: 200px;
	height: 50px;
}
.tr-1>td{
	text-align: left;
}
.page-content>.toMain{
	width: 200px;
	height: 50px;
	padding: 0;
}
table{
	margin-left: -35px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt">예약내역</div><br><br>
		<div class="content-wrap">
			<table>
				<tr class="tr-1">
					<th>객실정보</th>
					<td><%=roomName %> </td>
				</tr>
				<tr class="tr-1">
					<th>체크인</th>
					<td><%=b.getCheckIn()%> 15:00 </td>
				</tr>
				<tr class="tr-1">
					<th>체크아웃</th>
					<td><%=b.getCheckOut() %> 11:00 </td>
				</tr>
				<tr class="tr-1">
					<th>예약인원</th>
					<td><%=b.getBookPeople() %> </td>
				</tr>
				<tr class="tr-1">
					<th>예약자명</th>
					<td><%=b.getBookName() %> </td>
				</tr>
				<tr class="tr-1">
					<th>전화번호</th>
					<td><%=b.getBookPhone() %> </td>
				</tr>
				<tr class="tr-1">
					<th>예약번호</th>
					<td><%=b.getBookNo() %> </td>
				</tr>
			</table>
		</div><br><br>
		<button class="bc2 bs3 toMain" onclick="location.href='/'">메인으로</button>
		<br><br><br><br><br><br><br>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>