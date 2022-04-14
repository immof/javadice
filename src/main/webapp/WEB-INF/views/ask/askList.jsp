<%@page import="com.herejava.ask.vo.Ask"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Ask> list = (ArrayList<Ask>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    %>
<!DOCTYPE html>
<html>
<head>
<style>
	.body{
		margin: 0;
	}
	.notice-tbl tr>th{
		border-top: 1px solid #ccc;
		background-color: rgb(204,204,204,0.4);
	}
	.page1-content{
		width: 900px;
		margin: 0 auto;
		overflow: hidden;
		margin-bottom: 10px;
		flex-grow: 1;
	}
	.page1-title{
		font-family: ns-bold;
   	    padding: 20px 0px;
    	font-size: 1.3rem;
    	margin-top: 50px;
    	margin-bottom: 30px;
    	border-bottom: 2px solid #ccc;
	}
	.notice-tbl a:hover{
			text-decoration: underline;
		}
	.notice-tbl tr{
		border-bottom: 1px solid #ccc;
		text-align: center;
		}
	.notice-tbl tr>th:first-child {
		width:9%;
	}
	.notice-tbl tr>th:nth-child(2) {
		width:45%;
	}
	.notice-tbl tr>th:nth-child(2) {
		text-align: center;
	}
	.notice-tbl tr>th:nth-child(3) {
		width:15%;
	}
	.notice-tbl tr>th:nth-child(4) {
		width:20%;
	}
	.notice-tbl tr>th:last-child {
		width:10%;
	}
	#pageNavi{
			margin:10px;
			margin-bottom: 20px;
		}
	
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page1-content">
		<div class="belt">NOTICE</div>
		<br>
		<%@include file="/WEB-INF/views/common/notice_submenu.jsp" %>
		<br>
		<div class="page1-title">문의사항</div>
		<!-- <a class="btn bc1 writeBtn" href="noticeWriteFrm.do">글쓰기</a> -->
			<table class="tbl tr-1 notice-tbl">
					<tr class="tr-2">
						<th>No.</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회</th>
					</tr>	
						<%for(Ask a : list) { %>
					<tr class="tr-1">
							<td><%=a.getAskNo() %></td>
							<td><%=a.getAskTitle() %>
							<td><%=a.getMemberNick() %>
							<td><%=a.getAskEnrollDate() %></td>
							<td><%=a.getAskReadCount() %></td>	
					</tr>					
						<%} %>
					
		
		</table>
		<br>
		<div id="pageNavi"><%=pageNavi %></div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>