<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.book.vo.BookData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<BookData> list = (ArrayList<BookData>) request.getAttribute("list");
	String pageNavi = (String) request.getAttribute("pageNavi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 예약내역 ::</title>
<style>
		.notice-tbl a:hover {
			text-decoration: underline;
		}
		
		.notice-tbl tr {
			border-bottom: 1px solid #ccc;
		}
		
		.notice-tbl tr>th:first-child {
			width: 10%;
		}
		
		.notice-tbl tr>th:nth-child(2) {
			width: 45%;
		}
		
		.notice-tbl tr>td:nth-child(2) {
			text-align: left;
		}
		
		.notice-tbl tr>th:nth-child(3) {
			width: 15%;
		}
		
		.notice-tbl tr>th:nth-child(4) {
			width: 20%;
		}
		
		.notice-tbl tr>th:nth-child(5) {
			width: 10%;
		}
		
		#pageNavi {
			margin: 30px;
		}
		.img-0{
			width: 150px;
			height: 90px;
		}
		.hr-0{
			color: #ac9e89;
		}
		.p-0{
			text-align: center;
			font-size: 18px;
			font-weight: bold;
			padding: 45px 0px;
		}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="flex-wrap">
			<%@ include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">내 예약내역</div>
				<table class="tbl my_book_list_tbl">
					<tr class="tr-1 tr-head">
						<th>객실정보</th>
						<th>객실타입</th>
						<th>이용날짜</th>
						<th>예약상태</th>
						<th>리뷰어쩌고</th>
					</tr>
				</table>
				<hr class="hr-0">

				<table class="tbl tbl-hover">
					<%
					if(list.size()>0){
						for (BookData bd : list) {
						%>
						<tr class="tr-1">
							<td>
								<a href="/bookView.do?bookNo=<%=bd.getBookNo() %>">
								<img class="img-0" src="/img/<%=bd.getFilePath()%>">
							</td>
							<td>
								<a href="/bookView.do?bookNo=<%=bd.getBookNo() %>">
								<%=bd.getRoomName()%>
							</td>
							<td><%=bd.getCheckIn()%> - <%=bd.getCheckOut()%></td>
							<td>
							<%	String bookState = "";
							switch(bd.getBookState()) {
								case 0: bookState = "이용예정";
									break;
								case 1: bookState = "이용완료";
									break;
								case 2: bookState = "취소완료";
									break;
							}; %>
							<%=bookState %>
							</td>
							<td>
								#
							</td>
						</tr>
						<%
						}
					}else {
					%>
					<p class="p-0">예약내역이 없습니다.</p>
					<%} %>
				</table>
				<div id="pageNavi"><%=pageNavi%></div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>