<%@page import="oracle.net.aso.r"%>
<%@page import="com.herejava.book.vo.Book"%>
<%@page import="com.herejava.room.vo.Room"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	Book b = (Book)request.getAttribute("b");
    	Room r = (Room)request.getAttribute("r");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<table>
			<tr>
				<td><%=r.getFilepath() %></td>
			</tr>
			<tr>
				<th>객실정보</th>
				<td><%=b.getBookNo() %></td>
			</tr>
			<tr>
				<th>체크인</th>
				<td><%=b.getCheckIn() %> 15:00</td>
			</tr><tr>
				<th>체크아웃</th>
				<td><%=b.getCheckOut() %> 11:00</td>
			</tr><tr>
				<th>예약정보</th>
				<td>성인 <%=b.getBookPeople() %></td>
			</tr><tr>
				<th>예약자명</th>
				<td><%=b.getBookNo() %></td>
			</tr><tr>
				<th>전화번호</th>
				<td><%=b.getBookNo() %></td>
			</tr>
		</table>
		<table>
			<th>총 결제금액</th>
			<td>xxxxx 원</td>
			<button>예약취소</button>
		</table>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>