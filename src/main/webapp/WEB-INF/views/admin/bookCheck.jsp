<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Book> book = (ArrayList<Book>)request.getAttribute("book");
    String pageNavi = (String)request.getAttribute("pageNavi");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 관리</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class=page-content>
		<%@include file="/WEB-INF/views/admin/mypage_admin.jsp"%>
			
			<div class="mypage-content">
			<div class="mypage-content-title">회원목록</div>
				
				<table class="tbl tbl-hover">
					<tr class="tr-3">
						<th>예약 번호</th><th>예약자 성명</th><th>총 인원</th><th>체크인</th><th>체크아웃</th>
					<%for(Book b : book) {%>
						<tr class="tr-1">
							<td><%=b.getBookNo() %></td>
							<td><%=b.getBookName() %></td>
							<td><%=b.getBookPeople() %></td>
							<td><%=b.getMemberNo() %></td>
							<td><%=b.getCheckIn() %></td>
							<td><%=b.getCheckOut() %></td>
							<td><button class="btn bc2 searchBtn">상세보기</button></td>
						</tr>
					<%} %>
				</table>
					<div id="pageNavi"><%=pageNavi%></div>
			</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>