<%@page import="com.herejava.book.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	Book b = (Book)request.getAttribute("b");
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
		<ul>
			<li><%=b.getBookNo() %></li>
			<li><%=b.getRoomNo() %></li>
			<li><%=b.getMemberNo() %></li>
			<li><%=b.getBookPeople() %></li>
			<li><%=b.getBookName() %></li>
			<li><%=b.getBookPhone() %></li>
			<li><%=b.getBookDay() %></li>
			<li><%=b.getBookState() %></li>
			<li><%=b.getCheckIn() %></li>
			<li><%=b.getCheckOut() %></li>
		</ul>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>