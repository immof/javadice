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
				  title: 'Are you sure?',
				  text: "You won't be able to revert this!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then((result) => {
				  if (result.isConfirmed) {
				    Swal.fire(
				      'Deleted!',
				      'Your file has been deleted.',
				      'success'
				    )
				  }
				})
		}
	</script>
</body>
</html>