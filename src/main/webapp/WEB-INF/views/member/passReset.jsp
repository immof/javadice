<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
<style>
.content-wrap{
	width: 450px;
	margin: 0 auto;
	margin-top: 35px;
}
.form-name>th{
	font-size: 16px;
	text-align: left;
	padding-left: 10px;
}
.form-name>th>span{
	padding-left: 10px;
	font-weight: 400;
}
.form-input>td:first-child{
	width: 450px;
}
.form-input>td:first-child>input{
	border: 1px solid rgb(167, 167, 167);
}
.form-input>td>button{
	margin-left: 5px;
	padding: 0;
	width: 130px;
	height: 45px;
	font-size: 16px;
}
#timeLimit{
	padding-left: 10px;
}
#timeLimit>span{
	color: red;
}
.pass-table{
	border-top: 1px solid #ccc;
	padding-top: 30px;
	display: none;
}
.pass-table [type="submit"]{
	margin-top: 50px;
	margin-bottom: 120px;
	padding: 0;
	height: 60px;
	font-size: 20px;
}
.page-content{
	height: 885px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt">비밀번호 찾기</div>
		<div class="content-wrap">
			<hr><br><br>
			<form action="passChange.do" method="post">
				<table class="auth-table">
					<tr class="form-name">
						<th colspan="2">이메일(ID)<span class="idChkMsg"></span></th>
					</tr>
					<tr class="form-input">
						<td><input type="text" name="memberId" class="input-form"></td>
						<td><button class="bc2 bs1" onclick="sendMail();" type="button">인증번호 받기</button></td>
					</tr>
					<tr class="form-input">
						<td><input type="text" name="memberIdChk" class="input-form" placeholder="인증번호를 입력하세요."></td>
						<td><button class="bc2 bs1" id="authBtn" type="button">확인</button></td>
					</tr>
					<tr>
							<td colspan="2"><span id="timeLimit"></span></td>
					</tr>
				</table>
				<br>
				<table class="pass-table">
					<tr class="form-name">
						<th colspan="2" class="join-pass">비밀번호<span class="pwChkMsg"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="2"><input type="password" name="memberPw" class="input-form"></td>
					</tr>
					<tr class="form-name">
						<th colspan="2">비밀번호 재확인<span class="pwReChkMsg"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="2"><input type="password" name="memberPwRe" class="input-form"></td>
					</tr>
					<tr class="form-input">
						<td colspan="2"><input type="submit" class="bc1 bs4" id="passReset-submit" value="변경하고 로그인 하러 가기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
		const checkArr = [false,false,false];
		const id = $("[name=memberId]");
		id.on("change",function(){
			const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){3,20}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){3,20}.[a-zA-Z]{2,3}$/i;
			const idVal = id.val();
			if(idVal.match(emailReg) != null){
				$(".idChkMsg").text("올바른 형식의 이메일입니다.");
				$(".idChkMsg").css("color","green");
			}else{
				$(".idChkMsg").text("이메일 형식을 확인하여주세요.");
				$(".idChkMsg").css("color","red");
			};
		});
		
		const pw = $("[name=memberPw]");
		pw.on("change",function(){
			const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/;
			const pwVal = pw.val();
			if(pwVal.match(pwReg) != null){
				$(".pwChkMsg").text("사용할 수 있는 패스워드 입니다.");
				$(".pwChkMsg").css("color","green");
				checkArr[1] = true;
			}else{
				$(".pwChkMsg").text("1개 이상의 영어, 숫자, 특수기호를 사용해야 합니다.");
				$(".pwChkMsg").css("color","red");
				checkArr[1] = false;
			};
			const pwReVal = $("[name=memberPwRe]").val();
			if(pwReVal != ""){
				if(pwVal == pwReVal){
					$(".pwReChkMsg").text("두 비밀번호가 일치합니다.");
					$(".pwReChkMsg").css("color","green");
					checkArr[2] = true;
				}else{
					$(".pwReChkMsg").text("두 비밀번호가 일치하지 않습니다.");
					$(".pwReChkMsg").css("color","red");
					checkArr[2] = false;
				}	
			}
		});
		
		const pwRe = $("[name=memberPwRe]")
		pwRe.on("change",function(){
			const pwVal = $("[name=memberPw]").val();
			const pwReVal = pwRe.val();
			if(pwVal == pwReVal){
				$(".pwReChkMsg").text("두 비밀번호가 일치합니다.");
				$(".pwReChkMsg").css("color","green");
				checkArr[2] = true;
			}else{
				$(".pwReChkMsg").text("두 비밀번호가 일치하지 않습니다.");
				$(".pwReChkMsg").css("color","red");
				checkArr[2] = false;
			}
		})
		
		let mailCode;
		function sendMail(){
			const email = $("[name=memberId]").val();
			alert("아이디를 조회하는 중입니다.");
			$.ajax({
				url : "/sendMailPassReset.do",
				data : {email:email},
				type : "post",
				success : function(data){
					if(data == "null"){
						alert("해당 이메일의 회원은 가입되어 있지 않습니다.");
					}else{
						alert("이메일로 인증번호가 발송되었습니다. 메일함을 확인해주세요.");
						mailCode = data;
						authTime();	
					}
				},
				error : function(){
					console.log("sendMail 에러");
				}
			});
			let intervalId;
			function authTime(){
				$("#timeLimit").html("<span id='min'>3</span> : <span id='sec'>00</span>");
				intervalId = window.setInterval(function(){
					timeCount();
				},1000);
			}
			function timeCount(){
				const min = Number($("#min").text());
				const sec = $("#sec").text();
				if(sec == "00"){
					if(min == 0){
						mailCode = null;
						clearInterval(intervalId);
					}else{
						$("#min").text(min-1);
						$("#sec").text(59);
					}
				}else{
					const newSec = Number(sec)-1;
					if(newSec<10){
						$("#sec").text("0"+newSec);
					}else{
						$("#sec").text(newSec);
					}
				}
			}
			$("#authBtn").on("click",function(){
				const msg = $("#timeLimit");
				if(mailCode == null){
					msg.text("인증시간이 만료되엇습니다.");
					msg.css("color","red");
				}else{
					if($("[name=memberIdChk]").val() == mailCode){
						alert("인증이 성공하였습니다.");
						$("[name=memberId]").attr("readonly",true);
						clearInterval(intervalId);
						msg.text("");
						checkArr[0] = true;
						$(".pass-table").css("display","block");
					}else{
						alert("인증코드를 확인하세요");
					}
				}
			});
		}
		
		$("#passReset-submit").on("click",function(e){
			let count = 0;
			for(let i = 0;i<checkArr.length;i++){
				if(checkArr[i]){
					count++;
				}
			}
			if(count != 3){
				e.preventDefault();
			}
		})
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>