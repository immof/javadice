<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.member.vo.Member"%>
<%@page import="com.herejava.book.vo.BookData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<BookData> list = (ArrayList<BookData>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 회원 페이지 ::</title>
<style>
	.mypage-content{
		min-height: 800px;
	}
	.th-1{
		text-align: left;
		padding: 10px 20px;
	}
	.td-1{
		text-align: left;
		padding: 5px 10px;
	}
	.tr-1>*{
		text-align: left;
	}
	.p-1{
		text-align: right;
		text-decoration : underline;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@ include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">최근 예약내역</div>
				<% if(list.size() >= 2) {
					for(int i=0;i<2;i++) {
						BookData b = list.get(i);%>
						<%=b.getFilePath() %>
						<%=b.getRoomName() %>
						<%=b.getCheckIn() %>
						<%=b.getCheckOut() %>
						<%=b.getBookState() %>
					<% }%>
				<%}else if(list.size() == 1) {
					BookData b = list.get(0);%>
					<%=b.getFilePath() %>
					<%=b.getRoomName() %>
					<%=b.getCheckIn() %>
					<%=b.getCheckOut() %>
					<%=b.getBookState() %>
				<% }else {%>
					<p>최근 예약내역이 없습니다.</p>
				<%} %>
				
				<a href="/bookView.do?bookNo=30">상세보기></a>
				<button class="btn bc3 bs6">예약취소</button>
					
				<div class="mypage-content-title">
					내 정보 <p class="p-1">수정하기></p>
				</div>
				
				<table class="my_info_tbl">
					<tr class="tr-1">
						<th class="th-1">이메일</th>
						<td class="td-1"><%=m.getMemberId() %></td>
					</tr>
					<tr class="tr-1">
						<th class="th-1">닉네임</th>
						<td class="td-1"><%=m.getMemberNick() %></td>
					</tr>	
						<th class="th-1">비밀번호</th>
						<td class="td-1"><%=m.getMemberPw() %></td>
					<tr class="tr-1">	
						<th class="th-1">휴대폰번호</th>
						<td class="td-1"><%=m.getMemberPhone() %></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>