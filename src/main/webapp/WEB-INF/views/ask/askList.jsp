<%@page import="com.herejava.ask.vo.AskComment"%>
<%@page import="com.herejava.ask.vo.Ask"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Ask> list = (ArrayList<Ask>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    	ArrayList<AskComment> askCo = (ArrayList<AskComment>)request.getAttribute("askCo");
    	boolean done = false;
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
		margin-bottom: 80px;
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
		width:6%;
	}
	.notice-tbl tr>th:nth-child(3) {
		width:52%;
	}
	.notice-tbl tr>th:nth-child(4) {
	}
	.notice-tbl tr>th:nth-child(5) {
		width:15%;
	}
	.notice-tbl tr>th:last-child {
	}
	#pageNavi{
			margin-top:30px;
		}
	.writeBtn{
		margin-left: 730px;
		width: 80px;
		height: 40px;
		line-height: 10px;
		border-radius: 5px;
	}
		#noti-title{
		text-align: left;
	}
	.wait-answer{
		background-color:#a7a7a7; color:#fff; font-size:13px; width: 30px; display:block;
	}
	.done-answer{
		background-color:#ac9e89; color:#fff; font-size:13px; width: 30px; display:block;
	}
</style>
<meta charset="UTF-8">
<title>:: 문의 사항 ::</title>
</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page1-content">
		<div class="belt">Q & A</div>
		<br>
		<%@include file="/WEB-INF/views/common/notice_submenu.jsp" %>
		<br>
		<div class="page1-title">문의사항
			<%if(m!=null && m.getMemberLevel() == 1){ %>
			<a class="btn bc1 writeBtn" href="askWriteFrm.do">글쓰기</a>
			<%} %>
		</div>
			<table class="tbl tr-1 notice-tbl">
					<tr class="tr-2">
						<th>No.</th>
						<th style="padding-left:5px; padding-right:5px;"></th>
						<th>제목</th>
						<th style="padding-left:5px; padding-right:5px;">작성자</th>
						<th>등록일</th>
					</tr>	
						<%for(Ask a : list) { %>
							<%
							done = false;
								for(AskComment aco : askCo){
									if(a.getAskNo() == aco.getAskRef()){
										done = true;
										break;
									}
								}
							%>
					<tr class="tr-1">
							<td><%=a.getAskNo() %></td>
							<%if(done){ %>
							<td style="padding-left:5px; padding-right:5px;"><span class="done-answer"> 완료 </span></td>
							<%}else{ %>
							<td style="padding-left:5px; padding-right:5px;"><span class="wait-answer"> 대기 </span></td>
							<%} %>
							<td id="noti-title">
								<a href="/askView.do?askNo=<%=a.getAskNo() %>">
									<%=a.getAskTitle() %>							
								</a>
							</td>
							<td style="padding-left:5px; padding-right:5px;"><%=a.getMemberNick() %></td>
							<td><%=a.getAskEnrollDate() %></td>
					</tr>					
						<%} %>
					
		
		</table>
		<div id="pageNavi"><%=pageNavi %></div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>