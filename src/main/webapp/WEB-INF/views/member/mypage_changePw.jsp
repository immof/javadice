<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::비밀번호 변경::</title>
<style>
	.tbl input{
		border: 1px solid #a7a7a7;
	}
	.tbl tr>td:first-child{
		text-align: left;
		width: 15%;
	}
	.tbl tr>td:nth-child(2){
		width: 40%;
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
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">비밀번호 변경하기</div>
				<div class="member-info">
					<form action="/memberUpdatePw.do" method="post">
						<table class="tbl">
							<tr class="tr-3">
								<td>현재 비밀번호</td>
								<td><input class="input-form" type="text"></td>
								<td>
							</tr>
							<tr class="tr-3">
								<td>변경할 비밀번호</td>
								<td><input class="input-form"></td>
							</tr>
							<tr class="tr-3">
								<td>비밀번호 확인</td>
								<td><input class="input-form"></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><button class="bc1 updateInfo-btn" type="submit" value="">정보 수정하기</button></td>
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