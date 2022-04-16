<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
<style>
.content-wrap{
	width:460px;
	margin: 0 auto;
	padding: 50px 70px;
	border: 1px solid #ccc;
}
.input-name{
	margin-top: 20px;
	font-size: 18px;
	font-weight: 700;
	margin-left: 5px;
}
.input-box{
	width:100%;
	height: 40px;
	padding-left: 20px;
	margin-top: 10px;
	border: 1px solid #ccc;
}
.submit{
	margin-top: 80px;
	display: flex;
	justify-content: center;
}
.submit>input{
	padding: 0px;
	width: 200px;
	height: 50px;
	border: none;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt">비회원 예약조회</div><br><br>
		<div class="content-wrap">
			<form action="/bookSelect.do" method="post">
				<div class="input-name"><label for="bookName">예약자 성명</label></div>
				<input type=text class="input-box" id="bookName" name="bookName" placeholder="이름을 입력해주세요">
				<div class="input-name"><label for="bookNo">예약번호</label></div>
				<input type=text class="input-box" id="bookNo" name="bookNo" placeholder="예약번호를 입력해주세요">
				<div class="submit"><input type="submit" class="bc1 bs3" value="확인"></div>
			</form>
		</div>
		<br><br><br><br><br>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>