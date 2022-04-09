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
				<table name="my-book-tbl">
					<tr>
						<td>객실사진</td>
						<td>로얄스위트</td>
						<td>체크인/체크아웃</td>
						<td>이용상태</td>
						<td><a href="#">상세보기></a></td>
						<a href="/bookCancle.do?memberNo=30 ">예약취소</a>
					</tr>
				</table>
				<br><br><br><br>
				<div class="mypage-content-title">내 정보<a href="#">수정하기</a></div>
				<table name="my-info">
					<tr>
						<th>이메일</th>
						<td><%=m.getMemberId() %></td>
					</tr>
					<tr>
						<th>닉네임</th><br>
						<td><%=m.getMemberNick() %></td>
					</tr>
					<tr>
						<th>비밀번호</th><br>
						<td><%=m.getMemberPw() %></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td><%=m.getMemberPhone() %></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>