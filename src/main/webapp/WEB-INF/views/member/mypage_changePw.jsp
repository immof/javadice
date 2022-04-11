<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::비밀번호 변경::</title>
<style>
	.info-tbl{
		margin: 15px;
	}
	.info-tbl input{
		border: 1px solid #a7a7a7;
		width: 360px;
		display:inline;
	}
	.info-tbl tr>td:first-child{
		width: 25%;
	}
	.info-tbl tr:nth-child(2)>td:last-child{
		text-align: left;
		text-decoration: underline;
	}
	.info-tbl tr:last-child a{
		text-decoration: underline;
	}
	.updateInfo-btn{
		width: 100%;
		height: 50px;
		font-size: 18px;
		border: none;
	}
	.check-msg{
		text-align: left;
		color: #c87431;
		font-size: 12px;
		height: 30px;
		padding-left: 10px;
		vertical-align: top;
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
						<table class="info-tbl" id="info-tbl">
							<tr class="tr-3">
								<td>현재 비밀번호</td>
								<td><input class="input-form" type="text" name="currentPw" id="currentPw"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>변경할 비밀번호</td>
								<td><input class="input-form" type="text" name="changePw" id="changePw" placeholder="6~15자의 영문 대소문자,숫자,특수문자만 가능합니다."></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>비밀번호 확인</td>
								<td><input class="input-form" type="text" name="changePw-check" id="changePw-check" placeholder="정확한 입력을 위해 다시 한번 입력해주세요."></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><button class="bc1 updateInfo-btn" type="submit" value="">비밀번호 변경하기</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		$("#checkName").change(function(){
			//현재비밀번호 확인 ajax 만들기
		});
		$("#changePw").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			let regExp;
			regExp = /^[0-9a-zA-Z!@#$%^+\-=]{6,15}$/;
			if(!regExp.test(value)){
				$(this).parent().parent().next().children().eq(1).text("6~15자의 영문 대소문자, 숫자, 특수문자(!,@,#,$,%,^,+,-,=)만 가능합니다.");
			}
		});
		$("#changePw-check").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			const checkValue = $("#changePw").val();			
			if(value == checkValue){
				$(this).parent().parent().next().children().eq(1).text("입력하신 비밀번호가 일치합니다.").css("color","green");
			}else{
				$(this).parent().parent().next().children().eq(1).text("입력하신 비밀번호가 일치하지 않습니다.").css("color","#c87431")
			}
		});
	});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>