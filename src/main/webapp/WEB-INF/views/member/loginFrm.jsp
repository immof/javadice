<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
<style>
	h1{
		text-align: center;
		margin-bottom: 30px;
		font-size: 40px; 
	}
	.input-wrap{
		width: 450px;
		margin: 0 auto;
		margin-top: 75px;
		padding: 40px;
		border: 1px solid rgb(167, 167, 167);
	}
	.login-input{
		padding: 15px;
		padding-left: 30px;
		border: 1px solid rgb(167, 167, 167);
		overflow: hidden;
	}
	.login-input:first-child{
		border-bottom: none;
	}
	.login-input *{
		font-size: 16px;
		color: rgb(167, 167, 167);
		float: left;
	}
	.flex-wrap{
		width: 5%;
		height: 44px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.flex-wrap>span{
		font-size: 35px;
	}
	.login-input>input{
		border: none;
		outline: none;
		margin-left: 10px;
		padding: 10px;
		width: 90%;
	}
	.login-button{
		margin-top: 50px;
	}
	.login-button>button{
		height: 60px;
		line-height: 60px;
		border: none;
		padding: 0;
		font-size: 25px;
	}
	.login-p{
		text-align: center;
		font-size: 18px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt">LOG IN</div>
		<br><br><hr>
		<form action="/login.do" method="post">
			<div class=input-wrap>
				<div class="login-input">
					<div class="flex-wrap"><span class="material-icons">person</span></div>
					<input type="text" name="memberId" id="memberId" class="input-form" placeholder="이메일(ID)">
				</div>
				<div class="login-input">
					<div class="flex-wrap"><span class="material-icons">lock_open</span></div>
					<input type="password" name="memberPw" id="memberPw" class="input-form" placeholder="비밀번호">
				</div>
				<div class="login-button"><button type="submit" class="bc1 bs4">로그인</button></div>
			</div>
		</form>
		<br><br><br>
		<p class="login-p" style="color:#333; font-size:18px;">
		회원이 아니신가요?<br>
		회원은 결제 금액의 10%가 적립됩니다.
		</p>
		<br><br>
		<p class="login-p" ><a href="/joinFrm.do" style="color:#ccc;">회원 가입 하러 가기</a></p>
		<br><br><br><br>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>