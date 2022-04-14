<%@page import="com.herejava.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String title = (String)request.getAttribute("title");
    	String msg = (String)request.getAttribute("msg");
    	String icon = (String)request.getAttribute("icon");
    	String loc = (String)request.getAttribute("loc");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
 <script src="/js/jquery-3.6.0.js"></script>
<script src="/js/sweetalert.min.js"></script>
</head>
<body>
	<!-- alert 후 페이지를 이동하는 기능용 페이지 -->
	<script>
		window.onload = function(){
			swal({
				title: "<%=title %>",
				text: "<%=msg %>",
				icon: "<%=icon %>"
			}).then(function(){
				location.href = "<%=loc %>"
			});
		}
	</script>
</body>
</html>