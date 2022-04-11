<%@page import="com.herejava.member.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); 
	String pageNavi = (String)request.getAttribute("pageNavi");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>

#searchMember{
	width:170px; 
	height:30px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/admin/mypage_common.jsp"%>
			
			<div class="mypage-content">
				<div class="mypage-content-title">
					<span>회원목록</span>
					<form action="/searchMember.do">
						<input type="text" name="searchMember" placeholder="회원 검색(아이디/이름/닉네임)" >
						<button type="submit" class="material-icons">search</button>
					</form>
				</div>
				
				<table class="tbl tbl-hover">
					<tr class="tr-3">
						<th>번호</th><th>아이디</th><th>이름</th><th>닉네임</th><th>핸드폰번호</th><th>적립금</th><th>등급</th><th>예약내역</th>
					</tr>
					<%for(Member mem : list) {%>
						<tr class="tr-1">
							<td><%=mem.getMemberNo() %></td>
							<td><%=mem.getMemberId() %></td>
							<td><%=mem.getMemberName() %></td>
							<td><%=mem.getMemberNick() %></td>
							<td><%=mem.getMemberPhone() %></td>
							<td><%=mem.getMemberPoint() %></td>
							<td><%=mem.getMemberLevel() %></td>
							<td><button class="btn bc3 searchBtn">예약조회</button></td>
						</tr>
					<%} %>
				</table>
					<div id="pageNavi"><%=pageNavi%></div>
			</div>
			
		</div>
		<!-- flex-wrap -->
		
	</div>
	<!-- page-content -->
	<%@include file="/WEB-INF/views/common/footer.jsp"  %>
	<script>
		
	</script>
</body>
</html>