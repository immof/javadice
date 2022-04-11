<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.notice.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Notice n = (Notice)request.getAttribute("n");//근데여기선 쓰고있고
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#noticeView th, #noticeView td{
			border: 1px solid #A7A7A7;
		}
		#noticeContent{
			min-height: 300px;
			text-align: left;
			font-family: ns-light;
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
		}
		.nc_title{
			font-family: ns-light;
			text-align: left;
			font-size: 20px;
			 width: 700px;
		}
		.btn {
			width:100px;
			height: 50px;
			margin-left: 700px;
			font-size: 14px;
			border-radius: 10px;
		}
	</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
		<div class="page1-content">
		<div class="belt">NOTICE</div>
		<br>
		<%@include file="/WEB-INF/views/common/notice_submenu.jsp" %>
		<br>
		<br>
		<div class="page1-title">공지사항
			<button class="btn bc2" onclick="home();">목록으로</button> 
		</div>
		
		<hr color=#A7A7A7>
		<br>
		<br>
		<table class="tbl" id="noticeView">
			<tr class="tr-3">
				<th class="nc_title"><%=n.getNoticeTitle() %></th>
				<th><%=n.getNoticeEnrollDate() %></th>
			</tr>
			<tr class="tr-1">
				<td colspan="2">
					<div id="noticeContent"><%=n.getNoticeContentBr() %></div>
				</td>
			</tr>
			<%if(m!= null && m.getMemberId().equals(n.getNoticeWriter())) {%>
			<tr class="tr-1">
				<th colspan=6>
					<a class="btn bc1" href="/noticeUpdateFrm.do?noticeNo=<%=n.getNoticeNo() %>">수정</a>
					<button class="btn bc1" onclick="noticeDelete('<%=n.getNoticeNo() %>');">삭제</button>
				</th>
			</tr>
			<%} %>
		</table>

		</div>
		<script>
			function home(){
				location.href="/noticeList.do?reqPage=1";
			}
		</script>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>