<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 회원탈퇴 ::</title>
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
									<input type="password" class="input-form" id="currentPw">
								</td>
							</tr>
							<tr>
								<td><input type="hidden" id="currentId" value=<%=m.getMemberId() %>></td>
								<td><p class="fc-9"></p></td>	
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><button class="bc3 updateInfo-btn" type="button" value="">탈퇴하기</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		let inputCheck = false;
		$(".updateInfo-btn").on("click",function(){
			console.log(inputCheck);
			if(inputCheck){
				const memberId = $("#currentId").val();
				$.ajax({
					url: "/deleteMember.do",
					type: "get",
					data: {memberId: memberId},
				success: function(data){
					location.href = "/";
					}	
				})
			}else{
				const title = "비밀번호를 확인해주세요";
				const icon = "warning";
				toastShow(title,icon);
			}
		});
		$("#currentPw").change(function(){
			const memberPw = $("#currentPw").val();
			const memberId = $("#currentId").val();
			$.ajax({
				url: "/checkPw.do",
				type: "post",
				data: {memberPw: memberPw, memberId: memberId},
				success: function(data){
					if(data == "1"){
						$(".fc-9").text("");
						inputCheck = true;
					}else if(data == "0"){
						$(".fc-9").text("비밀번호를 확인해주세요.").css("color","#c87431");
						inputCheck = false;
					}	
				},
			})
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
	});//로드시
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>