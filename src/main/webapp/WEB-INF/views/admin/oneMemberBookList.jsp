<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.book.vo.BookData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<BookData> list = (ArrayList<BookData>) request.getAttribute("list");
	String pageNavi = (String) request.getAttribute("pageNavi");
	Member mem = (Member) request.getAttribute("mem");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#pageNavi {
		margin: 30px;
	}
	.img-0{
		width: 150px;
		height: 90px;
	}
	.tbl tr>th{
		border-top: 1px solid #ccc;
		background-color: rgb(204,204,204,0.4);
	}
	.tbl-hover th, .tbl-hover td{
		border-bottom: 1px solid #A7A7A7;
	}
	.detailBtn:hover{
		cursor: pointer;
	}
	.subMenuTab>ul{
		overflow: hidden;
		text-align: center;
	}
	.subMenuTab>ul>li{
		margin: 30px 10px;
		float:left;
		border: 1px solid #dcdcdc;
	}
	.subMenuTab>ul>li>a{
		font-size: 20px;
		display: block;
		height: 40px;
		line-height: 40px;
		width: 150px;
		background-color: rgba(172,158,137,0.15);
	}
	.subMenuTab>ul>li>a:hover{
		background-color: rgba(172,158,137,0.5);
	}
	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="flex-wrap">
			<%@ include file="/WEB-INF/views/admin/mypage_admin.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title"><%=mem.getMemberNick() %>님의 예약내역</div>
					
					<div class="subMenuTab">
						<ul>
							<li style="margin-left:100px;"><a href="/adminBookList.do?memberNo=<%=mem.getMemberNo() %>&memberNick=<%=mem.getMemberNick() %>&reqPage=1">전체보기</a></li>
							<li><a href="#">이용예정</a></li>
							<li><a href="#">이용완료</a></li>
							<li><a href="#">취소내역</a></li>
						</ul>
					</div>
					<% if(list.size()!=0){ %>
						<table class="tbl tbl-hover">
							<tr>
								<th> </th><th>객실명</th><th>체크인 / 체크아웃</th><th> </th><th> </th>
							</tr>
						<%for (BookData bd : list) {%>
							<tr class="tr-1">
								<td><img class="img-0" src="/img/<%=bd.getFilePath()%>"></td>
								<td><%=bd.getRoomName()%></td>
								<td><%=bd.getCheckIn()%> / <%=bd.getCheckOut()%></td>
								<td><a class="detailBtn" style="text-decoration: underline;" href="/bookView.do?bookNo=<%=bd.getBookNo()%>&masterCheck=true">상세보기></a></td>
								<%if(bd.getBookState()==0){%>
									<td><div class="btn bc3 delbookbtn">예약취소</div></td>
								<%}else if(bd.getBookState()==1){%>
									<td><div class="btn bc1 reviewBtn">리뷰보기</div></td>
								<%}else if(bd.getBookState()==2){%>
									<td><div class="btn" style="background-color: #a7a7a7;color: #fff;">취소완료</div></td>
								<%}%>
							</tr>
						<%} %>
						</table>
						<div id="pageNavi"><%=pageNavi%></div>
					<%}else{%>
						<h4 style="margin: 50px; text-align:center">예약한 내역이 없습니다.</h4>
					<%} %>
					
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>