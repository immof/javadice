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
 <link rel="stylesheet" href="/css/default.css" />
<script src="/js/sweetalert2.all.min.js"></script>
</head>
<body>
	<!-- alert 후 페이지를 이동하는 기능용 페이지 -->
	<script>
		window.onload = function(){
			
					console.log("함수준비");
					location.href = "<%=loc %>"
					toastShow(title, icon);
		}
		function toastShow(title, icon){
					console.log("함수실행?");
			const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: 2500,
		    timerProgressBar: true,
		    didOpen: (toast) => {
		     // toast.addEventListener('mouseenter', Swal.stopTimer)
		      toast.addEventListener('mouseleave', Swal.resumeTimer)
		    }
		  })
		  Toast.fire({
		    title: "<%=title %>",
		    icon: "<%=icon %>"
		  })
			
		}
	</script>
</body>
</html>