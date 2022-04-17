<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>

<style>
body {
	margin: 0 auto;
	padding: 0 auto;
}

h3 {
	text-align: center;
	font-weight: 400;
	color: rgb(102, 102, 102);
}

.promotion-page {
	font-family: ns-bold;
	padding: 20px 0px;
	font-size: 1.3rem;
	margin-top: 50px;
	margin-bottom: 30px;
	border-bottom: 2px solid #ccc;
	width: 1220px;
}

.input-form {
	margin: 10px;
}

.Date-input {
	width: 1250px;
}

.Date-input>.input-form {
	float: left;
	width: 590px;
}

.form {
	width: 1200px;
	margin: 0 auto;
}
.form>.button{
	width: 305px;
	margin: 0 auto;
}

.form>.button>.btn {
	width: 150px;
	height: 50px;
	padding: 0;
	margin-top: 100px;
	margin-bottom: 500px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	
}

#text {
	margin: 10px auto;
	width: 1196px;
	height: 600px;
}
.page-content>.note-editor{
	margin-left: 15px;
}
</style>
<link rel="stylesheet" href="/summernote/summernote-lite.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	<form class="form" id="allform" action="promotionInsert.do" method="post" enctype="multipart/form-data">
		<div class="page-content">
			<div class="belt">Promotion</div>
			<h3>JAVADICE CITY 에서 준비한 특별한 프로모션 상품들을 경험해보세요.</h3>
			<div class="promotion-page">프로모션</div>
			<input type="text" class="input-form" name="title"
				placeholder="Title" value="" /> <input type="text" class="input-form"
				name="sub" placeholder="Sub" />
			<div class="Date-input">
				<input type="date" class="input-form" id="start-date"
					placeholder="YYYY-MM-DD" name="start_date" /> <input type="date"
					class="input-form" id="end-date" name="end_date"
					placeholder="Date(YYYY-MM-DD)" />
			</div>
			<br><br><br>
			<textarea name="Content" id="text" placeholder="textarea"></textarea>
			<div class="input-form">
				<div class="filebox">
					<label for="file"></label> <input type="file" id="file" name="file">
				</div>
			</div>
		</div>
		<div class="button">
			<button class="btn bc1" type="submit">작성하기</button>
			<button class="btn bc2" type="button" onclick="location.href='/promotionList.do'">취소</button>
		</div>
	</form>
	<script>
		$("#text").summernote({
			height:600,
			lang : "ko-KR",
			callbacks:{
				onImageUpload : function(files){
					uploadImage(files[0],this);
				}
			}
		});
		function uploadImage(file,editor){
			//ajax통해 서버에 이미지를 업로드하고 업로드 경로를 받아옴
			//form태그와 동일한 효과를 내는 FormData객체 생성
			const form = new FormData();
			form.append("file",file);
			$.ajax({
				url : "/uploadImage2.do",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					//결과로 받은 이미지파일 경로를 에디터에 추가
					$(editor).summernote("insertImage",data);
				}
			});
			//processData : 기본값 true {key1:value, key2:value2, key3:value3}
			//					-> 파일전송 시 String이 아니라 파일형태로 전송하기 위해서 기본값 제거
			//contentType : 기본값 "application/x-www-form-urlencoded;charset=UTF-8"
			//				-> form 태그 전송 시 enctype의 기본값임
			//				-> enctype="multipart/form-data"로 설정하기 위해 기본값을 제거 (기본값을 제거하면 자동으로 multipart/form-data가 됨)
		}
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>


</body>
</html>