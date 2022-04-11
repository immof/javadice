<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 회원정보 ::</title>
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
		width: 20%;
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
<!-- 회원정보 관리 페이지입니다. -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">내정보관리</div>
				<div class="member-info">
					<form action="/memberUpdate.do" method="post">
						<table class="info-tbl" id="info-tbl">
							<tr class="tr-3">
								<td>이메일(ID)</td>
								<td><input class="input-form" type="text" placeholder="<%=m.getMemberId() %>" disabled></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>비밀번호</td>
								<td><input class="input-form" type="text" placeholder="*************" disabled></td>
								<td  style="text-decoration: underline; padding-left: 10px;"><a href="/mypage_changePw.do">변경하기</a></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>이름</td>
								<td><input class="input-form" type="text" name="checkName" id="checkName" placeholder="<%=m.getMemberName() %>" value="<%=m.getMemberName() %>"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>닉네임</td>
								<td><input class="input-form" type="text" name="checkNick" id="checkNick" placeholder="<%=m.getMemberNick() %>" value="<%=m.getMemberNick() %>"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>휴대폰번호</td>
								<td><input class="input-form" type="text" name="checkPhone" id="checkPhone" placeholder="<%=m.getMemberPhone() %>" value="<%=m.getMemberPhone() %>"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><button class="bc1 updateInfo-btn" type="submit" value="">정보 수정하기</button></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td style="text-align: center; height: 100px;"><a href="#" class=fc-8>회원탈퇴</a></td>
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
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			let regExp;
			regExp = /^[가-힣]{2,5}$/;
			if(!regExp.test(value)){
				$(this).parent().parent().next().children().eq(1).text("2-5글자 한글만 입력가능합니다.");
			}
		});
		$("#checkNick").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			let regExp1;
			let regExp2;
			regExp1 = /^[가-힣]{2,5}$/;
			regExp2 = /^[a-zA-Z]{4,10}$/;
			if(!regExp1.test(value) && !regExp2.test(value)){
				$(this).parent().parent().next().children().eq(1).text("2-5글자 한글 또는 4-10글자 영어대소문자만 입력가능합니다.");
			}
		});
		$("#checkPhone").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			let regExp;
			regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/
			if(!regExp.test(value)){
				$(this).parent().parent().next().children().eq(1).text("010-0000-0000 형식으로 입력해주세요.");
			}
		});
	});
			
	
	
	
	
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>