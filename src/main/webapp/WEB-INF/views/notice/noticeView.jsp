<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.notice.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Notice n = (Notice)request.getAttribute("n");//근데여기선 쓰고있고
    %>
   <!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
		.btn {
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
		}
		.file{
			width: 100px;
			background-color: rgb(245, 245, 245);
		}
		.tr-2>.nc_title{
			text-align: left;
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
		<div class="page1-title">공지사항
			<button class="btn bc2" onclick="home();">목록으로</button> 
		</div>
		<br>
		<br>
		<table class="tbl" id="noticeView">
			<tr class="tr-2">
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
		<span style="line-height:80%"></span>
		<table class="tbl" id="noticeView" style="line-height:140%">
			<tr class="tr-1">
				<th class="td-3 file">첨부파일</th>
				<td colspan="5">
					<%if(n.getFilename() != null) {%>
						<a href="/fileDown.do?noticeNo=<%=n.getNoticeNo() %>"><%=n.getFilename() %></a>
					<%} %>
				</td>
			</tr>
		</table>
		<br>
		<br>
		<table class="tbl" id="noticeEview">
			<tr class="tr-1">
				<th class="td-3 eTitle">이전글<span class="material-icons icon1">expand_less</span></th>
				<td colspan="5" onclick=""><%=n.getNoticeTitle() %></td>
			</tr>
			<tr class="tr-1">
				<th class="td-3 eTitle">다음글<span class="material-icons icon1">expand_more</span></th>
				<td colspan="5" onclick=""><%=n.getNoticeTitle() %></td>
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