<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><예약조회 테스트_이신영_20220409 오전9시14분 ver.></h2><hr>
		<form action="/bookView.do" method="get">
			<h3>예약내역 조회를 하시려면 예약번호를 입력하세요</h3>
			<input type="text" name="bookNo" id="bookNo">
			<button type="submit">제출</button>
		</form>
		<form action="/bookCancle.do" method="get">
			<h3>예약취소를 하시려면 예약번호를 입력하세요</h3>
			<input type="text" name="bookNo" id="bookNo">
			<button type="submit">취소하기</button>
		</form>
</body>
</html>