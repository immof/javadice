<%@page import="com.herejava.notice.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Book b = (Book)request.getAttribute("b");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보</title>
	<style>
		.page1-title{
		font-family: ns-bold;
   	    padding: 3px 0px;
    	font-size: 1.2rem;
    	border-bottom: solid 2px #A7A7A7;
		}
		.tbl1{
			margin-top: 30px;
			margin-left: 30px;
		}
		.tbl1 td{
			height: 50px;
		}
		.tdtd{
			 width: 100px;
			 font-family: ns-bold;
			 text-align: center;
		}
		.title2{
			margin-top: 50px;
		}
		.table2{
			margin-bottom: 150px;
		}
	</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/admin/mypage_admin.jsp"%>
			
			<div class="mypage-content">
				<div class="page1-title">예약 정보 </div>
				<table class="tbl1">
					<tr><td class="tdtd">객실정보</td><td>정보</td></tr>
					<tr><td class="tdtd">체크인</td></tr>
					<tr><td class="tdtd">체크아웃</td></tr>
					<tr><td class="tdtd">예약인원</td></tr>
					<tr><td class="tdtd">예약자명</td></tr>
					<tr><td class="tdtd">전화번호</td></tr>
					<tr><td class="tdtd">예약번호</td></tr>
				</table>
				<br>
				<div class="page1-title title2">결제 정보</div>
				<table class="tbl1 table2">
					<tr><td class="tdtd">적립금사용</td></tr>
					<tr><td class="tdtd">결제금액</td></tr>
				</table>
				
			</div>
		</div>
	</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>	
</body>
</html>