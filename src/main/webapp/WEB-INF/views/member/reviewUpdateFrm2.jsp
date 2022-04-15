<%@page import="com.herejava.review.vo.ReviewList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ReviewList list = (ReviewList)request.getAttribute("list");
    %>
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
					<form action="/reviewUpdate.do" method="post" enctype="multipart/form-data">
						<table class="tbl" id="reviewWrite" border="0">
							<input type="hidden" name="memberNo" value="<%=list.getMemberNo() %>">
							<input type="hidden" name="reviewNo" value="<%=list.getReviewNo() %>">
							<input type="hidden" id="star-score" name="star-score" value="<%=list.getReviewScore() %>">
							<input type="hidden" name="oldFilepath1" value="<%=list.getFilepath1() %>">
							<input type="hidden" name="oldFilepath2" value="<%=list.getFilepath2() %>">
							<input type="hidden" name="oldFilepath3" value="<%=list.getFilepath3() %>">
							<tr class="tr-1">
								<th class="td-3"  style="padding-bottom: 0px; text-align:left;">
									<div class="starRev">
									<%if(list.getReviewScore() == 1){ %>
										  <span class="starR on">1</span>
									  <span class="starR">2</span>
									  <span class="starR">3</span>
									  <span class="starR">4</span>
									  <span class="starR">5</span>
									<%}else if(list.getReviewScore() == 2){ %>
										  <span class="starR">1</span>
									  <span class="starR on">2</span>
									  <span class="starR">3</span>
									  <span class="starR">4</span>
									  <span class="starR">5</span>
									<%}else if(list.getReviewScore() == 3){ %>
										  <span class="starR on">1</span>
									  <span class="starR on">2</span>
									  <span class="starR on">3</span>
									  <span class="starR">4</span>
									  <span class="starR">5</span>
									<%}else if(list.getReviewScore() == 4){ %>
										  <span class="starR on">1</span>
									  <span class="starR on">2</span>
									  <span class="starR on">3</span>
									  <span class="starR on">4</span>
									  <span class="starR">5</span>
									<%}else if(list.getReviewScore() == 5){ %>
										  <span class="starR on">1</span>
									  <span class="starR on">2</span>
									  <span class="starR on">3</span>
									  <span class="starR on">4</span>
									  <span class="starR on">5</span>
									<%}%>
									</div>
								</th>
								<td style="padding-bottom: 0px; text-align:right;">
									<%if(list.getRoomNo() == 6){ %>
									객실타입: 로얄스위티
							 		<%}else if(list.getRoomNo() == 7){ %>
									객실타입: 프리미어 스위트
							 		<%}else if(list.getRoomNo() == 8){ %>
									객실타입: 프리미어
							 		<%}else if(list.getRoomNo() == 9){ %>
									객실타입: 디럭스
							 		<%}else if(list.getRoomNo() == 10){ %>
									객실타입: 스탠다드
									<%} %>
								</td>
								<td style="padding-bottom: 0px; text-align:right;">
									인원: <%=list.getBookPeople() %>명
								</td>
								<td style="padding-bottom: 0px; text-align:right;">
									이용기간: <%=list.getCheckIn() %> ~ <%=list.getCheckOut() %> 
								</td>
							</tr>
							<tr class="tr-1">
								<td colspan="4" style="text-align: left;">
									<textarea id="reviewContent" name="reviewContent" class="input-form"><%=list.getReviewContent() %></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="padding:0;">
										<div class="row row-images">
										  <div class="column image_container">
											<div class="post-image-collection" style="height: 143px; padding:0; padding-left:16px;">
											  <div class="post-image post-image-placeholder mrm mts empty">
												<div class="upload-section">
												  <input type="file" name="photofile1" id="Photofile1" class="upload-img" accept="image/*">
												  <%if(list.getFilepath1() != null){ %>
												  <label class="icon-camera" for="Photofile1" 
												   style="background-image: url('./review_img/<%=list.getFilepath1() %>'); background-size: 100% 100%;">
												</label>												   
												  <%}else{ %>
												  <label class="icon-camera" for="Photofile1">
													<img src="./img/add_img.png">
												  <%} %>
												  </label>
												  <p class="uppercase">사진 추가</p>
												</div>
												<div class="preview-section">
												</div>
											  </div>
											  <div class="post-image post-image-placeholder mrm mts empty">
												<div class="upload-section">
												  <input type="file" name="photofile2" id="Photofile2" class="upload-img" accept="image/*" />
												    <%if(list.getFilepath2() != null){ %>
												  <label class="icon-camera" for="Photofile2" 
												   style="background-image: url('./review_img/<%=list.getFilepath2() %>'); background-size: 100% 100%;">
												</label>
												  <%}else{ %>
												  <label class="icon-camera" for="Photofile2">
													<img src="./img/add_img.png">
												  <%} %>
												  </label>
												  <p class="uppercase">사진 추가</p>
												</div>
												<div class="preview-section">
												</div>
											  </div>
											  <div class="post-image post-image-placeholder mrm mts empty">
												<div class="upload-section">
												   <input type="file" name="photofile3" id="Photofile3" class="upload-img" accept="image/*" />
												    <%if(list.getFilepath3() != null){ %>
												  <label class="icon-camera" for="Photofile3" 
												   style="background-image: url('./review_img/<%=list.getFilepath3() %>'); background-size: 100% 100%;">
												  </label>
												  <%}else{ %>
												  <label class="icon-camera" for="Photofile3">
													<img src="./img/add_img.png">
												  </label>
												  <%} %>
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
								<td colspan="4"><button type="submit" class="btn bc1 bs4">리뷰 수정하기</button>
							</tr>
						</table>
					</form>
			</div>
		</div>
	</div>
	<!-- <script src="./js/review.js"></script> -->
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