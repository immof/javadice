<%@page import="com.herejava.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.mypage-content{
	min-height: 800px;
}
</style>
<meta charset="UTF-8">
<title>:: 회원 페이지 ::</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@ include file="/WEB-INF/views/member/mypage_common.jsp" %>
			<div class="mypage-content">
				<div class="mypage-content-title">최근 예약내역</div>
				<p>사진</p>
				<p>객실명이랑 체크인아웃 시간</p>
				<button>이용예정</button>
				<a href="#">상세보기></a>
				<a href = "#">예약취소</a>
				<div class="mypage-content-title">내 정보</div>
				<button target="#">수정하기</button>
				<table name="my-info">
					<tr>
						<th>이메일</th><br>
						<td></td>
					</tr>
					<tr>
						<th>닉네임</th><br>
						<td></td>
					</tr>
					<tr>
						<th>비밀번호</th><br>
						<td></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>