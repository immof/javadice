<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
</head>
<style>
.join-wrap{
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
.form-name>.join-pass{
	padding-top: 10px;
}
.form-name>.join-name{
	padding-top: 30px;
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
.form-input:last-child>td>input{
	margin-top: 50px;
	margin-bottom: 120px;
	padding: 0;
	height: 60px;
	font-size: 20px;
}
#timeLimit{
	padding-left: 10px;
}
#timeLimit>span{
	color: red;
}
.join-p{
		text-align: center;
		font-size: 18px;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt">회원가입</div>
		<div class="join-wrap">
			<hr><br><br>
			<form action="join.do" method="post">
				<table class="join-table">
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
					<tr class="form-name">
						<th colspan="2" class="join-name">이름<span class="nameChkMsg"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="2"><input type="text" name="memberName" class="input-form" placeholder="예약시 사용하실 이름"></td>
					</tr>
					<tr class="form-name">
						<th colspan="2">닉네임<span class="nickChkMsg"></span></th>
					</tr>
					<tr class="form-input">
						<td><input type="text" name="memberNick" class="input-form"></td>
						<td><button class="bc2 bs1" id="nickChkBtn" type="button">중복확인</button></td>
					</tr>
					<tr class="form-name">
						<th colspan="2">연락처<span class="phoneChkMsg"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="2"><input type="text" name="memberPhone" class="input-form" placeholder="ex)010-1234-1234"></td>
					</tr>
					<tr class="form-input">
						<td colspan="2"><input type="submit" class="bc1 bs4" id="join-submit" value="가입하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<p class="join-p" style="color:#333; font-size:18px;">
	이미 가입된 회원이라고 나오시나요?<br>
	이메일로 비밀번호를 찾을 수 있습니다.
	</p>
	<br><br>
	<p class="join-p" ><a href="/passReset.do" style="color:#ccc;">비밀번호 찾으러 가기</a></p>
	<br><br><br><br>
		
	<script>
		const checkArr = [false,false,false,false,false,false];
		let authChk = 0;
		
		const id = $("[name=memberId]");
		id.on("change",function(){
			const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){3,20}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){3,20}.[a-zA-Z]{2,3}$/i;
			const idVal = id.val();
			if(idVal.match(emailReg) != null){
				$(".idChkMsg").text("올바른 형식의 이메일입니다.");
				$(".idChkMsg").css("color","green");
				checkArr[0] = true;
			}else{
				$(".idChkMsg").text("이메일 형식을 확인하여주세요.");
				$(".idChkMsg").css("color","red");
				checkArr[0] = false;
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
				$(".pwChkMsg").text("6자~15자 영어, 숫자, 특수기호를 사용하세요.");
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
					checkArr[2] = true;
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
				checkArr[2] = true;
			}
		})
		
		const name = $("[name=memberName]");
		name.on("change",function(){
			const nameReg = /^[가-힣]{2,6}$/;
			const nameVal = name.val();
			if(nameVal.match(nameReg) != null){
				$(".nameChkMsg").text("사용할 수 있는 이름입니다.");
				$(".nameChkMsg").css("color","green");
				checkArr[3] = true;
			}else{
				$(".nameChkMsg").text("이름은 2~6 글자의 한글만 입력가능합니다.");
				$(".nameChkMsg").css("color","red");
				checkArr[3] = false;
			};
		});
		
		const nick = $("[name=memberNick]");
		nick.on("change",function(){
			const nickReg = /^[가-힣]{2,8}$/;
			const nickVal = nick.val();
			if(nickVal.match(nickReg) != null){
				$(".nickChkMsg").text("올바른 형식의 닉네임입니다.");
				$(".nickChkMsg").css("color","green");
				checkArr[4] = true;
			}else{
				$(".nickChkMsg").text("닉네임은 2~8 글자의 한글만 입력가능합니다.");
				$(".nickChkMsg").css("color","red");
				checkArr[4] = false;
			};
		}); 
				
		const phone = $("[name=memberPhone]");
		phone.on("change",function(){
			const phoneReg = /^010-?([0-9]{4})-?([0-9]{4})$/;
			const phoneVal = phone.val();
			if(phoneVal.match(phoneReg) != null){
				$(".phoneChkMsg").text("사용할 수 있는 연락처입니다.");
				$(".phoneChkMsg").css("color","green");
				checkArr[5] = true;
			}else{
				$(".phoneChkMsg").text("연락처 형식을 맞춰주세요 010-XXXX-XXXX");
				$(".phoneChkMsg").css("color","red");
				checkArr[5] = false;
			};
		});
		
		let mailCode;
		function sendMail(){
			if(checkArr[0]){
				const email = $("[name=memberId]").val();
				const title = "입력하신 아이디를 조회중입니다.";
				const icon = "info";
				const msgTime = 6500;
				toastShow(title,icon,msgTime);
				$.ajax({
					url : "/sendMail.do",
					data : {email:email},
					type : "post",
					success : function(data){
						if(data == "null"){
							const title = "이미 가입된 이메일입니다.";
							const icon = "warning";
							const msgTime = 2500;
							toastShow(title,icon,msgTime);
						}else{
							const title = "입력하신 이메일로 인증번호가 발송되었습니다.";
							const icon = "success";
							const msgTime = 2500;
							toastShow(title,icon,msgTime);
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
							if(confirm("인증이 성공하였습니다. 이 아이디를 사용하시겠습니까?")){
								$("[name=memberId]").attr("readonly",true);
								clearInterval(intervalId);
								msg.text("");
								authChk++;
							}
						}else{
							const title = "인증코드를 확인하세요";
							const icon = "warning";
							const msgTime = 2500;
							toastShow(title,icon,msgTime);
						}
					}
				});
			}
		}
		
		const nickChkBtn = $("#nickChkBtn");
		nickChkBtn.on("click",function(){
			if(checkArr[4]){
				const nickChk = $("[name=memberNick]").val();
				$.ajax({
					url : "/memberNickChk.do",
					data : {nickChk:nickChk},
					type : "post",
					success : function(data){
						if(data == 1){
							const title = "해당 닉네임은 사용중 입니다.";
							const icon = "warning";
							const msgTime = 2500;
							toastShow(title,icon,msgTime);
						}else{
							if(confirm("해당 닉네임은 사용가능합니다. 사용하시겠습니까?")){
								$("[name=memberNick]").attr("readonly",true);
								authChk++;
							}
						}
					},
					error : function(){
						console.log("nickChkBtn ajax 에러");
					}
				});	
			}
		})
		
		$("#join-submit").on("click",function(e){
			let count = 0;
			for(let i = 0;i<checkArr.length;i++){
				if(checkArr[i]){
					count++;
				}
			}
			if(count != 6 || authChk < 2){
				e.preventDefault();
			}
		})
		
		//토스트 알림 함수		
		function toastShow(title,icon,msgTime){
			const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: msgTime,
		    timerProgressBar: true,
		    didOpen: (toast) => {
		     // toast.addEventListener('mouseenter', Swal.stopTimer)
		      toast.addEventListener('mouseleave', Swal.resumeTimer)
		    }
		 	})
		
		  Toast.fire({
		    title: title,
		    icon: icon
		  })
		}//토스트 끝
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>