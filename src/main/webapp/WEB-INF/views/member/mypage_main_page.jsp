<%@page import="com.herejava.member.vo.Member"%>
<%@page import="com.herejava.book.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 회원 페이지 ::</title>
<style>
	.mypage-content{
		min-height: 800px;
	}
	.my-info>.tr-info{
		padding: 15px;
	}
	.tr-info{
		padding: 15px;
	}
	.th-info{
		text-align: left;
	}
	.td-info{
		text-align: left;
	}
	#ud-btn{
		text-decoration: underline;
		color: #555555;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@ include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">최근 예약내역</div>
					<table>
						<tr>
							<td>사진</td>
							<td>로얄스위트</td>
							<td>이용예정</td>
						</tr>
						<tr>
							<td>체크인체크아웃날짜</td>
							<td><button>예약취소</button></td>
						</tr>
					</table>
				<table>
					<tr>
						<td></td>
						<td></td>
					</tr>
				</table>
				
				<div class="mypage-content-title">내 정보</div>
				<table>
					<tr>
						<th>이메일</th>
						<td><%=m.getMemberId() %></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><%=m.getMemberNick() %></td>
					</tr>	
						<th>비밀번호</th>
						<td><%=m.getMemberPw() %></td>
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