<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 회원정보 ::</title>
<style>
	.tbl input{
		border: 1px solid #a7a7a7;
	}
	.tbl tr>td:first-child{
		text-align: left;
		width: 13%;
	}
	.tbl tr>td:nth-child(2){
		width: 40%;
	}
	.tbl tr:nth-child(2)>td:last-child{
		text-align: left;
		text-decoration: underline;
	}

	.tbl tr:last-child a{
		text-decoration: underline;
	}
	
	.updateInfo-btn{
		width: 100%;
		height: 50px;
		font-size: 18px;
		border: none;
	}
</style>
</head>
<body>
<!-- 회원정보 관리 페이지입니다. -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">내정보관리</div>
				<div class="member-info">
					<form action="/memberUpdate.do" method="post">
						<table class="tbl">
							<tr class="tr-3">
								<td>이메일(ID)</td>
								<td><input class="input-form" type="text" placeholder="<%=m.getMemberId() %>" disabled></td>
							</tr>
							<tr class="tr-3">
								<td>비밀번호</td>
								<td><input class="input-form" type="text" placeholder="*************" disabled></td>
								<td><a href="#">변경하기</a></td>
							</tr>
							<tr class="tr-3">
								<td>이름</td>
								<td><input class="input-form" type="text" placeholder="<%=m.getMemberName() %>" ></td>
							</tr>
							<tr class="tr-3">
								<td>닉네임</td>
								<td><input class="input-form" type="text" placeholder="<%=m.getMemberNick() %>" ></td>
							</tr>
							<tr class="tr-3">
								<td>휴대폰번호</td>
								<td><input class="input-form" type="text" placeholder="<%=m.getMemberPhone() %>" ></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><button class="bc1 updateInfo-btn" type="submit" value="">정보 수정하기</button></td>
								<td></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><a href="#" class=fc-8>회원탈퇴</a></td>
								<td></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>