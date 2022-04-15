<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 비밀번호 변경 ::</title>
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
					<form method="post">
						<table class="info-tbl" id="info-tbl">
							<tr class="tr-3">
								<td>현재 비밀번호</td>
								<td><input class="input-form" type="password"id="currentPw"></td>
							</tr>
							<tr>
								<td><input type="hidden" id="currentId" value=<%=m.getMemberId() %>></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>변경할 비밀번호</td>
								<td><input class="input-form" type="password" id="changePw" placeholder="6~15자의 영문 대소문자,숫자,특수문자만 가능합니다."></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>비밀번호 확인</td>
								<td><input class="input-form" type="password" id="changePw-check" placeholder="정확한 입력을 위해 다시 한번 입력해주세요."></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><button class="bc1 updateInfo-btn" type="button" value="">비밀번호 변경하기</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
//버튼 이벤트
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
				const memberPw = $("#changePw").val();
				const memberId = $("#currentId").val();
				$.ajax({
					url: "/updatePw.do",
					type: "post",
					data: {memberPw: memberPw, memberId: memberId},
					success: function(data){
						if(data == "1"){
							const title = "비밀번호가 변경되었습니다..";
							const icon = "success";
							toastShow(title,icon);
						}else if(data == "0"){
							const title = "비밀번호 변경을 실패하였습니다..";
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
//유효성검사		
		$("#currentPw").change(function(){
			const memberPw = $("#currentPw").val();
			const memberId = $("#currentId").val();
			$.ajax({
				url: "/checkPw.do",
				type: "post",
				data: {memberPw: memberPw, memberId: memberId},
				success: function(data){
					if(data == "1"){
						$(".check-msg").eq(0).text("");
						inputCheck[0] = true;
					}else if(data == "0"){
						$(".check-msg").eq(0).text("비밀번호를 확인해주세요.").css("color","#c87431");
						inputCheck[0] = false;
					}	
				},
			})
		});
		$("#changePw").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			let regExp;
			regExp = /^[0-9a-zA-Z!@#$%^+\-=]{6,15}$/;
			if(!regExp.test(value)){
				$(".check-msg").eq(1).text("6~15자의 영문 대소문자,숫자,특수문자만 가능합니다.");
				inputCheck[1] = false;
			}else{
				inputCheck[1] = true;
			}
		});
		$("#changePw-check").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			const checkValue = $("#changePw").val();			
			if(value == checkValue){
				$(".check-msg").eq(2).text("입력하신 비밀번호가 일치합니다.").css("color","green");
				inputCheck[2] = true;
			}else{
				$(".check-msg").eq(2).text("입력하신 비밀번호가 일치하지 않습니다.").css("color","#c87431");
				inputCheck[2] = false;
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
		
		}
	});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>