<%@page import="java.text.DecimalFormat"%>
<%@page import="com.herejava.pay.vo.Pay"%>
<%@page import="com.herejava.notice.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Book b = (Book)request.getAttribute("b");
    	int d = (Integer)request.getAttribute("d");
    	Pay pay = (Pay)request.getAttribute("pay");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 예약 정보 ::</title>
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
					<%if(b.getRoomNo() == 6){ %>
					<tr><td class="tdtd">객실정보</td><td>로열 스위트</td></tr>
					<%}else if(b.getRoomNo() == 7){ %>
					<tr><td class="tdtd">객실정보</td><td>프리미어 스위트</td></tr>
					<%}else if(b.getRoomNo() == 8){ %>
					<tr><td class="tdtd">객실정보</td><td>프리미어</td></tr>
					<%}else if(b.getRoomNo() == 9){ %>
					<tr><td class="tdtd">객실정보</td><td>디럭스</td></tr>
					<%}else if(b.getRoomNo() == 10){ %>
					<tr><td class="tdtd">객실정보</td><td>스탠다드</td></tr>
					<%} %>
					<tr><td class="tdtd">숙박일</td><td><%=d%>박 <%=d+1 %>일</td></tr>
					<tr><td class="tdtd">예약인원</td><td><%=b.getBookPeople() %>명</td></tr>
					<tr><td class="tdtd">예약자명</td><td><%=b.getBookName() %></td></tr>
					<tr><td class="tdtd">전화번호</td><td><%=b.getBookPhone() %></td></tr>
					<tr><td class="tdtd">예약번호</td><td><%=b.getBookNo() %></td></tr>
				</table>
				<br>
				<div class="page1-title title2">결제 정보</div>
				<table class="tbl1 table2">
					<%if(pay == null){ %>
						<tr><td class="tdtd">결제금액</td><td>0 원</td></tr>
						<tr><td class="tdtd">적립금사용</td><td>0 포인트</td></tr>
					<%}else{ 
						DecimalFormat decFormat = new DecimalFormat("###,###");
						String usePoint = decFormat.format(pay.getUsePoint());
						String payAmount = decFormat.format(pay.getPayAmount());
					%>
						<tr><td class="tdtd">결제금액</td><td><%=payAmount %> 원</td></tr>
						<tr><td class="tdtd">적립금사용</td><td><%=usePoint %> 포인트</td></tr>
					<%} %>
				</table>
				
			</div>
		</div>
	</div>
</body>
<%@include file="/WEB-INF/views/common/footer.jsp" %>	
</html>