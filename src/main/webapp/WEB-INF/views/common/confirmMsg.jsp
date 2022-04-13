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
<title>alert</title>
<link rel="stylesheet" href="/css/sweetalert2.min.css">

</head>
<body>
	<!-- alert 후 페이지를 이동하는 기능용 페이지 -->
	<script>
		window.onload = function(){
			Swal.fire({
				  title: "<%=title%>",
				  text: "<%=msg%>",
				  icon: "<%=icon%>",
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소'
				}).then((result) => {
					  if(result.value){
						  location.href="<%=loc%>";
					  }
					
				})
			})
		}
	</script>
</body>
</html>