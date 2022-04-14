<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/review.css" />
<style>
.starR{
  background: url(./img/ico_review.png) no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">리뷰 쓰기</div>
					<form action="/reviewWrite.do" method="post" enctype="multipart/form-data">
						<table class="tbl" id="reviewWrite" border="0">
							<input type="hidden" name="reviewWriter" value="<%=member.getMemberNo() %>">
							<input type="hidden" id="star-score" name="star-score" value="4">
							<tr class="tr-1">
								<th class="td-3"  style="padding-bottom: 0px; text-align:left;">
									<div class="starRev">
									  <span class="starR on">1</span>
									  <span class="starR on">2</span>
									  <span class="starR on">3</span>
									  <span class="starR on">4</span>
									  <span class="starR">5</span>
									</div>
								</th>
								<td style="padding-bottom: 0px; text-align:right;">
									객실명: 스위트
								</td>
								<td style="padding-bottom: 0px; text-align:right;">
									인원: 2명
								</td>
								<td style="padding-bottom: 0px; text-align:right;">
									이용기간: 2022-03-10 ~ 2022-03-11
								</td>
														</tr>
							<tr class="tr-1">
								<td colspan="4" style="text-align: left;">
									<textarea id="reviewContent" name="reviewContent" class="input-form"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="padding:0;">
										<div class="row row-images">
										  <div class="column image_container">
											<div class="post-image-collection" style="height: 143px; padding:0; padding-left:16px;">
											  <div class="post-image post-image-placeholder mrm mts empty">
												<div class="upload-section">
												  <input type="file" name="photofile1" id="Photofile1" class="upload-img" required accept="image/*" />
												  <label class="icon-camera" for="Photofile1">
													<img src="./img/add_img.png" />
												  </label>
												  <p class="uppercase">사진 추가</p>
												</div>
												<div class="preview-section"></div>
											  </div>
											  <div class="post-image post-image-placeholder mrm mts empty">
												<div class="upload-section">
												  <input type="file" name="photofile2" id="Photofile2" class="upload-img" required accept="image/*" />
												  <label class="icon-camera" for="Photofile2">
													<img src="./img/add_img.png" />
												  </label>
												  <p class="uppercase">사진 추가</p>
												</div>
												<div class="preview-section"></div>
											  </div>
											  <div class="post-image post-image-placeholder mrm mts empty">
												<div class="upload-section">
												  <input type="file" name="photofile3"  id="Photofile3" class="upload-img" required accept="image/*" />
												  <label class="icon-camera" for="Photofile3">
													<img src="./img/add_img.png">
												  </label>
												  <p class="uppercase">사진 추가</p>
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
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  let score = $(this).text();
			  $("#star-score").val(score);
			  return false;
			});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>