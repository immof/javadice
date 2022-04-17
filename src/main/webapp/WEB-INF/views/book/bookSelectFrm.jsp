<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
<style>
.content-wrap{
	width:460px;
	margin: 0 auto;
	padding: 50px 70px;
	border: 1px solid #ccc;
}
.input-name{
	margin-top: 20px;
	font-size: 18px;
	font-weight: 700;
	margin-left: 5px;
}
.input-box{
	width:100%;
	height: 40px;
	padding-left: 20px;
	margin-top: 10px;
	border: 1px solid #ccc;
}
.submit{
	margin-top: 80px;
	display: flex;
	justify-content: center;
}
.submit>input{
	padding: 0px;
	width: 200px;
	height: 50px;
	border: none;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt">비회원 예약조회</div><br><br>
		<div class="content-wrap">
			<form action="/bookSelect.do" method="get">
				<div class="input-name"><label for="bookName">예약자 성명</label></div>
				<input type=text class="input-box" id="bookName" name="bookName" placeholder="이름을 입력해주세요">
				<div class="input-name"><label for="bookNo">예약번호</label></div>
				<input type=text class="input-box" id="bookNo" name="bookNo" placeholder="예약번호를 입력해주세요">
				<div class="submit"><input type="button" class="bc1 bs3" id="book-req" value="확인"></div>
			</form>
		</div>
		<br><br><br><br><br>
	</div>
	<script>
	$(function(){
		$("#book-req").on("click",function(){
			const bookName = $("#bookName").val();
			const bookNo = $("#bookNo").val();
			$.ajax({
				url: "/guest_checkBook.do",
				type: "post",
				data: {bookNo: bookNo, bookName: bookName},
				success: function(data){
					if(data == "1"){
						location.href='/bookSelect.do?bookNo='+bookNo+'&bookName='+bookName;
					}else if(data == "0"){
						const title = "예약자명 또는 예약번호를 확인해주세요.";
						const icon = "warning";
						toastShow(title,icon);
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
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>