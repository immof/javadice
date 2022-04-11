<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.book.vo.BookData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String pageNavi = (String)request.getAttribute("pageNavi");
    	ArrayList<BookData> list = (ArrayList<BookData>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@ include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">내 예약내역</div>
					<!-- 테스트 시작-->
					<table class="tbl tbl-hover">
						<%for(BookData b : list) {%>
						<tr class="tr-1">
							<td>파일패스</td>
							<td>로얄스위트</td>
							<td><%=b.getCheckIn() %> - <%=b.getCheckOut() %></td>
							<td><%=b.getBookState() %></td>
						</tr>
						<%} %>
					</table>
					<!-- 테스트 끝 -->
				
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>