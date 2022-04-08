<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.body{
		margin: 0;
	}
	.tr-1{
		background-color: 
	}
	.notice-tbl tr>th:first-child {
			width:10%;
		}
	.page1-content{
		width: 1000px;
		margin: 0 auto;
		overflow: hidden;
		margin-bottom: 10px;
		flex-grow: 1;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page1-content">
		<div class="belt">NOTICE</div>
		<div class="page-title">공지사항</div>
		<!-- <a class="btn bc1 writeBtn" href="noticeWriteFrm.do">글쓰기</a> -->
		<hr>
			<table class="tbl tr-1 notice-tbl">
					<tr class="tr-2">
						<th>No.</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
					</tr>
		</table>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>