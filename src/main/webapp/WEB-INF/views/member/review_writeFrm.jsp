<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/review.css" />

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">리뷰 쓰기</div>
					<form action="/noticeWrite.do" method="post" enctype="multipart/form-data">
						<table class="tbl" id="noticeWrite" border="1">
							<input type="hidden" name="noticeWriter" value="<%=member.getMemberNo() %>">
							<tr class="tr-1">
								<th class="td-3">
									<select class="all_star">
  <option selected="selected" value="1">모든 별점 보기</option>
  <option class="star_5 fa">&#xf005 &#xf005 &#xf005 &#xf005 &#xf005</option>
  <option class="star_4">&#xf005 &#xf005 &#xf005 &#xf005</option>
  <option class="star_3">&#xf005 &#xf005 &#xf005</option>
  <option class="star_2">&#xf005 &#xf005</option>
  <option class="star_1">&#xf005</option>
</select>
								</th>
							</tr>
							<tr class="tr-1">
								<td colspan="4" style="text-align: left;"><textarea id="noticeContent" name="noticeContent" class="input-form"></textarea></td>
							</tr>
							<tr>
								<td colspan="4" style="padding:0;">
										<div class="row row-images">
										  <div class="column image_container">
											<div class="post-image-collection" style="height: 143px; padding:0; padding-left:16px;">
											  <div class="post-image post-image-placeholder mrm mts empty">
												<div class="upload-section">
												  <input type="file" id="Photofile1" class="upload-img" required accept="image/*" />
												  <label class="icon-camera" for="Photofile1">
													<img src="https://cdn.onlinewebfonts.com/svg/img_104650.png" />
												  </label>
												  <p class="uppercase">Photo 1</p>
												</div>
												<div class="preview-section"></div>
											  </div>
											  <div class="post-image post-image-placeholder mrm mts empty">
												<div class="upload-section">
												  <input type="file" id="Photofile2" class="upload-img" required accept="image/*" />
												  <label class="icon-camera" for="Photofile2">
													<img src="https://cdn.onlinewebfonts.com/svg/img_104650.png" />
												  </label>
												  <p class="uppercase">Photo 2</p>
												</div>
												<div class="preview-section"></div>
											  </div>
											  <div class="post-image post-image-placeholder mrm mts empty">
												<div class="upload-section">
												  <input type="file" id="Photofile3" class="upload-img" required accept="image/*" />
												  <label class="icon-camera" for="Photofile3">
													<img src="https://cdn.onlinewebfonts.com/svg/img_104650.png" style="color:#ac9e89">
												  </label>
												  <p class="uppercase">Photo 3</p>
												</div>
												<div class="preview-section"></div>
											  </div>
											</div>
										  </div>
										</div>
								</td>
							</tr>
							<tr>
								<td colspan="4"><button type="submit" class="btn bc1 bs4">리뷰 등록</button>
							</tr>
						</table>
					</form>
			</div>
		</div>
	</div>
	<script src="./js/review.js"></script>
		<script>
				$("#noticeContent").summernote({
					height : 400,
					lang : "ko-KR",
					callbacks:{
						onImageUpload : function(files){
							uploadImage(files[0],this);
						}
					}
				});
				function uploadImage(file,editor){
					//ajax를 통해 서버에 이미지를 업로드하고 업로드 경로를 받아옴
					//form태그와 동일항 효과를 내는 FormData객체 생성
					const form = new FormData();
					form.append("file",file);
					$.ajax({
						url : "/uploadImage.do",
						type : "post",
						data : form,
						processData : false,
						contentType : false,
						success : function(data){
							//결과로 받은 이미지파일 경로를 에디터에 추가
							$(editor).summernote("insertImage",data);
						}
					
					});
					//processData : 기본값 true {key1:value1,key2:value2,key3:value3}
					//				>> 파일전송시 String 이 아니라 파일형태로 전송하기위해서 false로 기본값 제거
					//contentType : 기본값 "application/x-www-form-urlencoded;charset=UTF-8"
					//				>> form태그 전송시 enctype의 기본값임
					//				>> enctype="multipart/form-data"로 설정하기 위해 기본값 제거
				}	
			</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>