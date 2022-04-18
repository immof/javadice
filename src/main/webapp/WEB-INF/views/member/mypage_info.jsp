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
	#memberId{
		color: #757279;
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
					<form method="post">
						<table class="info-tbl" id="info-tbl">
							<tr class="tr-3">
								<td>이메일(ID)</td>
								<td><input class="input-form" type="text" id="memberId" value="<%=m.getMemberId() %>" readonly></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>비밀번호</td>
								<td><input class="input-form" type="text" placeholder="*************" disabled></td>
								<td  style="text-decoration: underline; padding-left: 10px;"><a href="/mypage_changePw.do?masterChk=0">변경하기</a></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>이름</td>
								<td><input class="input-form" type="text" id="changeName" value="<%=m.getMemberName() %>"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>닉네임</td>
								<td><input class="input-form" type="text" id="changeNick" value="<%=m.getMemberNick() %>"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>휴대폰번호</td>
								<td><input class="input-form" type="text" id="changePhone" value="<%=m.getMemberPhone() %>"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><button class="bc1 updateInfo-btn" type="button" value="">정보 수정하기</button></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td style="text-align: center; height: 100px;"><a href="/mypage_deleteMember.do" class=fc-8>회원탈퇴</a></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
//정보 전송 ajax
		let inputCheck = new Array(3).fill(true);
		let checkAll = true;
		$(".updateInfo-btn").on("click",function(){
			checkAll = true;
			for(let i = 0; i < inputCheck.length; i++){
				if(inputCheck[i] == false){
					checkAll = false;
				}
			}
			if(checkAll){
				const memberId = $("#memberId").val();
				const memberName = $("#changeName").val();
				const memberNick = $("#changeNick").val();
				const memberPhone = $("#changePhone").val();
				$.ajax({
					url: "/updateMember.do",
					type: "post",
					data: {memberId: memberId, memberName: memberName, memberNick: memberNick, memberPhone: memberPhone},
					success: function(data){
						if(data == "1"){
							const title = "수정이 완료되었습니다.";
							const icon = "success";
							toastShow(title,icon);
						}else if(data == "0"){
							const title = "수정을 실패했습니다.";
							const icon = "error";
							toastShow(title,icon);
						}	
					},
				})
			}else{
				const title = "입력값을 확인해주세요";
				const icon = "warning";
				toastShow(title,icon);
			}
		});
//유효성검사 코드
		$("#changeName").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			let regExp;
			regExp = /^[가-힣]{2,5}$/;
			if(!regExp.test(value)){
				$(this).parent().parent().next().children().eq(1).text("2-5글자 한글만 입력가능합니다.");
				inputCheck[0] = false;
			}else{
				inputCheck[0] = true;
			}
		});
		$("#changeNick").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const memberNick = $(this).val();
			let regExp1;
			let regExp2;
			regExp1 = /^[가-힣]{2,8}$/;
			regExp2 = /^[a-zA-Z]{4,10}$/;
			if(!regExp1.test(memberNick) && !regExp2.test(memberNick)){
				$(this).parent().parent().next().children().eq(1).css("color","#c87431");	
				$(this).parent().parent().next().children().eq(1).text("2~8글자 한글 또는 4~10글자 영어대소문자만 입력가능합니다.");
				inputCheck[1] = false;
			}else{ //유효성검사 테스트 통과시 닉네임중복체크
				inputCheck[1] = true;
				$.ajax({
					url: "/checkNick.do",
					type: "get",
					data: {memberNick:memberNick},
					success: function(data){
						if(data == "1"){
							$("#changeNick").parent().parent().next().children().eq(1).css("color","#c87431");			
							$("#changeNick").parent().parent().next().children().eq(1).text("선택하신 닉네임은 사용이 불가능합니다. 다른 닉네임을 입력해주세요.");
							inputCheck[1] = false;
						}else if(data == "0"){
							$("#changeNick").parent().parent().next().children().eq(1).css("color","green");			
							$("#changeNick").parent().parent().next().children().eq(1).text("선택하신 닉네임은 사용가능합니다.");		
							inputCheck[1] = true;
						}
					}
				})
			}
		});
		$("#changePhone").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			let regExp;
			regExp = /^\d{3}-\d{3,4}-\d{4}$/;
			if(!regExp.test(value)){
				$(this).parent().parent().next().children().eq(1).text("010-0000-0000 형식으로 입력해주세요.");
				inputCheck[2] = false;
			}else{
				inputCheck[2] = true;
			}
		});
//토스트 알림 함수		
		function toastShow(title, icon){
			const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: 1500,
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
	});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>