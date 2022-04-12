<%@page import="com.herejava.promotion.vo.Promotion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%Promotion p = (Promotion)request.getAttribute("p"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
<style>
h3{
	text-align: center;
	font-weight: 400;
	color: rgb(102, 102, 102);
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt">Promotion</div>
		<h3>JAVADICE CITY 에서 준비한 특별한 프로모션 상품들을 경험해보세요.</h3>
		<%=p.getPromotionNo() %><br>
		<%=p.getPromotionTitle() %><br>
		<%=p.getPromotionSubTitle() %><br>
		<%=p.getPromotionContent() %><br>
		<%=p.getStartDate() %><br>
		<%=p.getEndDate() %><br>
		<%=p.getFilepath() %><br>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>