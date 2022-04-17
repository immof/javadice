<%@page import="com.herejava.promotion.vo.Promotion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% Promotion p = (Promotion)request.getAttribute("p"); %>
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
	margin: 10px;
	width: 1196px;
	height: 600px;
}
.page-content>.note-editor{
	margin-left: 15px;
}
</style>
<link rel="stylesheet" href="./summernote/summernote-lite.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<script src="./summernote/summernote-lite.js"></script>
	<script src="./summernote/lang/summernote-ko-KR.js"></script>
	
	
	<form class="form" id="allform" action="/promotionModify.do" method="post" enctype="multipart/form-data">
	<input type="text" value=<%=p.getPromotionNo()%> name=no style="display: none;">
		<div class="page-content">
			<div class="belt">Promotion</div>
			<h3>JAVADICE CITY 에서 준비한 특별한 프로모션 상품들을 경험해보세요.</h3>
			<div class="promotion-page">프로모션</div>
			<input type="text" class="input-form" name="title"
				placeholder="Title" value="<%=p.getPromotionTitle()%>"> <input type="text" class="input-form"
				name="sub" placeholder="Sub" value="<%=p.getPromotionSubTitle()%>">
			<div class="Date-input">
				<input type="date" class="input-form" id="start-date"
				value=<%=p.getStartDate()%>
					placeholder="YYYY-MM-DD" name="start_date"/> <input type="date"
					class="input-form" id="end-date" name="end_date"
					value=<%=p.getEndDate()%>
					placeholder="Date(YYYY-MM-DD)" />
			</div>
			<br><br><br>
			<textarea name="Content" id="content" class="input-form" placeholder="textarea"><%=p.getPromotionContent() %></textarea>
			<div class="input-form">
				<div class="filebox">
					<input type="hidden" name="status" value="stay">
						<%if(p.getFilepath() != null) { %>
							<img src="/img/file.png" width="16px" class="delFile">
							<span class="delFile"><%=p.getFilepath() %></span>
							<button type="button" class="btn bc1 delFile" id="fileDelBtn">삭제</button>
							<input type="file" name="file" style="display:none;">
							<input type="hidden" name="oldFilepath" value="<%=p.getFilepath() %>">
						<%} else { %>
							<label for="file"></label><input value=<%=p.getFilepath()%> type="file" id="file" name="file" >
						<%} %>
				</div>
			</div>
		</div>
		<div class="button">
			<button class="btn bc1" type="submit">수정</button>
			<button class="btn bc2" type="button" onclick="location.href='/promotionList.do'">취소</button>
		</div>
	</form>
	<script>
		$("#content").summernote({
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
		$("#fileDelBtn").on("click",function(){
			$(".delFile").hide();
			$(this).next().show();
			$("[name=status]").val("delete");
		});
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>


</body>
</html>