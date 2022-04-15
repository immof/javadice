<%@page import="com.herejava.ask.vo.AskComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.ask.vo.Ask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Ask a = (Ask)request.getAttribute("a");
    	ArrayList<AskComment> commentList = (ArrayList<AskComment>)request.getAttribute("commentList");
		ArrayList<AskComment> reCommentList = (ArrayList<AskComment>)request.getAttribute("reCommentList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#noticeEview td, #noticeEview th{
			border: 1px solid #A7A7A7;
		}
		#noticeView th, #noticeView td{
			border: 1px solid #A7A7A7;
		}
		.tbl{
			border-radius: 10px;
		}
		#noticeContent{
			min-height: 400px;
			text-align: left;
			font-family: ns-light;
		}
		.page1-content{
		width: 900px;
		margin: 0 auto;
		overflow: hidden;
		margin-bottom: 40px;
		flex-grow: 1;
		}
		.page1-title{
		font-family: ns-bold;
   	    padding: 10px 0px;
    	font-size: 1.2rem;
    	border-bottom: solid 1px #A7A7A7;
		}
		.nc_title{
			font-family: ns-light;
			text-align: left;
			font-size: 20px;
			 width: 700px;
		}
		.home {
			width:90px;
			height: 40px;
			border-radius: 5px;
			margin-left: 720px;
		}
		.tbl>.tr-1,.tr-2{
			border-radius: 10px;
		}
		.page1-title>.btn{
			font-size: 14px;
			text-align: center;
			line-height: 10px;
		}
		.tbl>tr>.nc_title {
			text-align: left;
		}
		.eTitle{
			width: 100px;
			background-color: rgb(245, 245, 245);
			line-height: 30px;
		}
		.file{
			width: 100px;
			background-color: rgb(245, 245, 245);
		}
		.tr-2>.nc_title{
			text-align: left;
		}
		
		.bss6 {
			margin: 0 auto;
			margin-top: 30px;
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
		<Br>
		<br>
		<div class="page1-title">문의사항
			<button class="btn bc1 home" onclick="home();">목록으로</button> 
		</div>
		<br>
		<br>
		<table class="tbl" id="noticeView">
			<tr class="tr-2">
				<th class="nc_title"><%=a.getAskTitle() %></th>
				<th><%=a.getAskEnrollDate() %></th>
			</tr>
			<tr class="tr-1">
				<td colspan="2">
					<div id="noticeContent"><%=a.getAskContentBr() %></div>
				</td>
			</tr>
			 
		</table>
		<span style="line-height:80%"></span>
		<table class="tbl" id="noticeView" style="line-height:140%">
			<tr class="tr-1">
				<th class="td-3 file">첨부파일</th>
				<td>
					<%if(a.getFilepath1() != null) {%>
						<a href="/fileDown.do?askNo=<%=a.getFilepath1() %>"><%=a.getFilepath1() %></a>
					<%} %>
				</td>
				<td colspan="5">
					<%if(a.getFilepath2() != null) {%>
						<a href="/fileDown.do?noticeNo=<%=a.getFilepath2() %>"><%=a.getFilepath2() %></a>
					<%} %>
				</td>
				<td colspan="5">
					<%if(a.getFilepath3() != null) {%>
						<a href="/fileDown.do?noticeNo=<%=a.getFilepath3() %>"><%=a.getFilepath3() %></a>
					<%} %>
				</td>
			</tr>
		</table>
		<%if(m != null && m.getMemberNo() == a.getMemberNo()) {%>
		<table class="tbl" id="noticeView">
			<tr class="tr-1">
			</tr>
			</table>
			<table class="bss6">
				<tr>
					<td>
						<a class="btn bc1 bs6" href="/askUpdateFrm.do?noticeNo=<%=a.getAskNo() %>">수정</a>
						<button class="btn bc1 bs6" onclick="askDelete('<%=a.getAskNo() %>');">삭제</button>
					</td>
				</tr>
			</table>
		<%} %>
		
			
		<span style="line-height:150%;">
		<br>
		</span>
		<table class="tbl" id="noticeEview">
			<tr class="tr-1 eview">
				<th class="td-3 eTitle">이전글<span class="material-icons icon1">expand_less</span></th>
				<td colspan="5" onclick=""><%=a.getAskTitle() %></td>
			</tr>
			<tr class="tr-1 eview">
				<th class="td-3 eTitle">다음글<span class="material-icons icon1">expand_more</span></th>
				<td colspan="5" onclick=""><%=a.getAskTitle() %></td>
			</tr>
		</table>
		
		<script>
			function home(){
				history.back();
			}
		</script>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>