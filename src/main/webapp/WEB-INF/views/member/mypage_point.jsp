<%@page import="java.text.DecimalFormat"%>
<%@page import="com.herejava.point.vo.Point"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Point> list = (ArrayList<Point>)request.getAttribute("list"); 
    	int totalPoint = (int)request.getAttribute("totalPoint");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.mypage-content-title{
	display: flex;
	justify-content: space-between;
}
.point-date{
	width: 25%;

}
.point-date2{
	width: 25%;

}
.point-date3{
	width: 25%;

}
.point-status{
	width: 15%;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<!--
DecimalFormat decFormat = new DecimalFormat("###,###");

String str = decFormat.format(12300000);
System.out.println(str);

str = decFormat.format(505000);
System.out.println(str);
-->			
		<%
			DecimalFormat decFormat = new DecimalFormat("###,###");
			String total = decFormat.format(totalPoint);
			
		%>
		<div class="mypage-content-title"><h4>내 적립금</h4><p style="color: #c87431; text-align: right;">총 <%=total %>원</p></div>
			<table class="tbl" id="point-tbl" border="0"> 
				<tr class="tr-1">
				</tr>
				<tr class="tr-1" style="border-bottom: 1px solid #ac9e89;">
					<th class="point-date1"style="text-align: left;">결제일</th>
					<th class="point-date2"style="text-align: left;">예약번호</th>
					<th class="point-date3"style="text-align: left;">결제번호</th>
					<th class="point-status">상태</th>
					<th class="point-amount"style="text-align: right;">금액</th>
				</tr>
			<%for(Point p : list){ %>
				<%if(p.getPayAmount() > 0 ) {%> 
					<tr class="tr-1">
					<th class="point-date1"style="text-align: left;"><%=p.getBookDay() %></th>
					<th class="point-date2"style="text-align: left;"><%=p.getBookNo() %></th>
					<th class="point-date3"style="text-align: left;"><%=p.getPayNo() %></th>
				<%if(p.getUsePoint() != 0 && p.getPlusPoint() != 0) {%> 
					<th class="point-status">적립</th>
					<%String plus = decFormat.format(p.getPlusPoint());%>
					<th class="point-amount"style="text-align: right;">+ <%=plus %>원</th>
				</tr>
					<th class="point-date1"style="text-align: left;"><%=p.getBookDay() %></th>
					<th class="point-date2"style="text-align: left;"><%=p.getBookNo() %></th>
					<th class="point-date3"style="text-align: left;"><%=p.getPayNo() %></th>
					<th class="point-status" style="color: #c87431">사용</th>
					<%String use = decFormat.format(p.getUsePoint());%>
					<th class="point-amount"style="text-align: right;">- <%=use %>원</th>
				</tr>
				<%}else if(p.getUsePoint() == 0 && p.getPlusPoint() != 0){ %>
					<th class="point-status">적립</th>
					<%String plus = decFormat.format(p.getPlusPoint());%>
					<th class="point-amount"style="text-align: right;">+ <%=plus %>원</th>
				</tr>
				<%}else if(p.getUsePoint() != 0 && p.getPlusPoint() == 0){ %>
					<th class="point-status" style="color: #c87431">사용</th>
					<%String use = decFormat.format(p.getUsePoint());%>
					<th class="point-amount"style="text-align: right;">- <%=use %>원</th>
				</tr>
				<%} %>
			<%} %>
			<%} %>
			</table>
			</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>