<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 회원정보 ::</title>
</head>
<body>
<!-- 회원정보 관리 페이지입니다. -->
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">내정보관리</div>
				<div class="member-info">
					<form action="/memberUpdate.do" method="post">
						
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>