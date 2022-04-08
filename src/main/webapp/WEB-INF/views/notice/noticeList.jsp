<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="belt"></div>
	<div class="page-content">
	<div class="page-title"></div>
	<a class="btn bc1 writeBtn" href="noticeWriteFrm.do">글쓰기</a>
	<table class="tbl tbl-hover notice-tbl">
				<tr class="tr-2">
					<th>No.</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
				</tr>
	</table>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>