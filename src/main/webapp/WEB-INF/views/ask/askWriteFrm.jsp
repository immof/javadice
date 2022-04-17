<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 문의하기 ::</title>
<style>
	#askWrite tr{
		border : 1px solid #ccc;
	}
	.tbl>tr{
		margin-bottom: 15px;
	}
	.body{
		margin: 0;
	}
	.notice-tbl tr>th{
		border-top: 1px solid #ccc;
		background-color: rgb(204,204,204,0.4);
	}
	.page1-content{
		width: 900px;
		margin: 0 auto;
		overflow: hidden;
		margin-bottom: 10px;
		flex-grow: 1;
	}
	.page1-title{
		font-family: ns-bold;
   	    padding: 20px 0px;
    	font-size: 1.3rem;
    	margin-top: 50px;
    	margin-bottom: 30px;
    	border-bottom: 2px solid #ccc;
	}
	.td-3{
		width: 40px;
	}
	.file{
		text-align: left;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page1-content">
		<div class="belt">Q & A</div>
		<br>
		<%@include file="/WEB-INF/views/common/notice_submenu.jsp" %>
		<br>
		<div class="page1-title">문의사항 작성</div>
			<form class="form1" action="/askWrite.do" method="post" enctype="multipart/form-data">				
					<table class="tbl" id="askWrite">
						<tr class="tr-1">
							<th class="td-3">제목</th>
							<td colspan="5">
								<input type="text" name="askTitle" class="input-form" style=" height: 20px; font-weight: bold;">
								<input type="hidden" name="memberNo" value="<%=m.getMemberNo() %>">
						</tr>
						<tr class="tr-1">
							<td colspan="6" style="text-align: left;"><textarea id="askContent" name="askContent" class="input-form"></textarea>
							</td>
						</tr>
						<tr class="tr-1">
							<th class="td-3"><span class="material-icons">file_download</span></th>
							<td class="file"><input type="file" name="file1" ></td>
						</tr>
						<!-- 
						<tr class="tr-1">
							<th class="td-3"><span class="material-icons">file_download</span></th>
							<td class="file"><input type="file" name="file2"></td>
						</tr>
						<tr class="tr-1">
							<th class="td-3"><span class="material-icons">file_download</span></th>
							 <td class="file"><input type="file" name="file3"></td>
						</tr> -->
						<tr class="button">
							<td colspan="6">
							<button type="submit" class="btn bc1 bs1">등록</button>
							<button type="button" onclick="location.href='/askList.do?reqPage=1'" class="btn bc1 bs1">취소</button>
							
							</td>
						</tr>
					</table>
			</form>
	</div>
	<script>
		
		
		/*
		$("#askContent").summernote({
			height: 400,
			lang : "ko-KR",
			callbakcs:{
				onImageUpload : function(files){
					uploadImage(files[0],this);
				}
			}
		});
		
		function uploadImage(file,editor){
			//ajax통해 서버에 이미지를 업로드하고 업로드 경로를 받아옴
			//form태그와 동일한 효과를 내는 FormData 객체 생성
			const form = new FormData();
			form.append("file",file);
			$.ajax({
				url : "/uploadImage.do",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success: function(data){
					//결과로 받은 이미지파일 경로를 에디터에 추가
					$(editor).summernote("insetImage",data);
				}
			});
			*/
			//processData : 기본값 true {key1:value1,key2:value2,key3:value3}
			//					-> 파일 전송 시 String이 아니라 파일 형태로 전송하기 위해서 기본값 제거
			//cotentType : 기본값 "application/x-www-form-urlencoded;charset=UTF-8"
			//				-> form 태그 전송 시 enctype의 기본값임
			//				-> enctype="multipart/form-data"로 설정하기 위해 기본값을 제거}
		
		
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>