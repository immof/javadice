<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::회원탈퇴::</title>
<style>
	.info-tbl{
		width: 60%;
		margin: 150px auto;
	}
	.info-tbl tr{
		height: 50px;
	}
	.info-tbl input{
		border: 1px solid #a7a7a7;
	}
	
	.info-tbl tr>td:first-child{
		width: 10%;
		text-align: center;
	}
	
	.info-tbl tr>td:nth-child(2){
		width: 20%;
	}
	.info-tbl tr:nth-child(3)>td{
		vertical-align: top;
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
				<div class="mypage-content-title">회원탈퇴</div>
				<div class="member-info">
					<form action="/memberUpdatePw.do" method="post">
						<table class="info-tbl">
							<tr class="tr-3">
								<td></td>
								<td>
									<h4>정말로 탈퇴하시겠습니까?</h4>
									<h6 style="color: #a7a7a7;">탈퇴하시면 정보를 복구할 수 없습니다.</h6>
								</td>
							</tr>
							<tr class="tr-3">
								<td>비밀번호 확인</td>
								<td>
									<input class="input-form">
								</td>
							</tr>
							<tr>
								<td></td>
								<td><p class="fc-9"></p></td>	
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><button class="bc3 updateInfo-btn" type="submit" value="">탈퇴하기</button></td>
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