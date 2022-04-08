<%@page import="com.herejava.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Member m = (Member)request.getAttribute("member");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/page_leftMenu.jsp" %>
	<h2><%=m.getMemberNick() %>님 마이페이지 입니다. 테스트</h2>
</body>
</html>