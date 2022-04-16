<%@page import="com.herejava.promotion.vo.Promotion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

.btn {
	width: 150px;
	height: 50px;
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

</style>
<link rel="stylesheet" href="./summernote/summernote-lite.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<script src="./summernote/summernote-lite.js"></script>
	<script src="./summernote/lang/summernote-ko-KR.js"></script>
	<% Promotion pro = new Promotion(); 
	Promotion pros = (Promotion)request.getAttribute("pro"); %>
	
	<form class="form" id="allform" action="/promotionModify.do" method="post">
	<input type="text" value=<%=pros.getPromotionNo()%> name=no style="display: none;">
		<div class="page-content">
			<div class="belt">Promotion</div>
			<h3>JAVADICE CITY 에서 준비한 특별한 프로모션 상품들을 경험해보세요.</h3>
			<div class="promotion-page">프로모션</div>
			<input type="text" class="input-form" name="title"
				placeholder="Title" value=<%=pros.getPromotionTitle()%>/> <input type="text" class="input-form"
				name="sub" placeholder="Sub" value=<%=pros.getPromotionSubTitle()%> />
			<div class="Date-input">
				<input type="date" class="input-form" id="start-date"
				value=<%=pros.getStartDate()%>
					placeholder="YYYY-MM-DD" name="start_date"/> <input type="date"
					class="input-form" id="end-date" name="end_date"
					value=<%=pros.getEndDate()%>
					placeholder="Date(YYYY-MM-DD)" />
			</div>
			<br>
			<textarea name="Content" id="Content" class="input-form" placeholder="textarea"></textarea>
			<div class="input-form">
				<div class="filebox">
					<label for="file"></label> <input value=<%=pros.getFilepath()%> type="file" id="file" name="file" >
				</div>
			</div>
		</div>
		<div class="button">
			<button class="btn bc1" type="submit">수정</button>
			<button class="btn bc2">취소</button>
		</div>
	</form>
	<script>
		$("#Content").summernote({
			height:400,
			lang : "ko-KR"
		
		})
					
		}
	</script>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>


</body>
</html>