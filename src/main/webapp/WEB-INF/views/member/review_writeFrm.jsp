<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Book b = (Book)request.getAttribute("b");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.starR.on{
	background-position:0 0;
}
.image_container{
	width:160px;
	height:95px;
}
.image_container img{
	width:160px;
	height:90px;
}
.tbl input{
	width:190px;
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
							<input type="hidden" name="memberNo" value="<%=member.getMemberNo() %>">
							<input type="hidden" name="bookNo" value="<%=b.getBookNo() %>">
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
									<%if(b.getRoomNo() == 6){ %>
									객실타입: 로얄스위티
							 		<%}else if(b.getRoomNo() == 7){ %>
									객실타입: 프리미어 스위트
							 		<%}else if(b.getRoomNo() == 8){ %>
									객실타입: 프리미어
							 		<%}else if(b.getRoomNo() == 9){ %>
									객실타입: 디럭스
							 		<%}else if(b.getRoomNo() == 10){ %>
									객실타입: 스탠다드
									<%} %>
								</td>
								<td style="padding-bottom: 0px; text-align:right;">
									인원: <%=b.getBookPeople() %>명
								</td>
								<td style="padding-bottom: 0px; text-align:right;">
									이용기간: <%=b.getCheckIn() %> ~ <%=b.getCheckOut() %> 
								</td>
														</tr>
							<tr class="tr-1">
								<td colspan="4" style="text-align: left;">
									<textarea id="reviewContent" name="reviewContent" class="input-form"></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<input type="file" name="image1" accept="image/*" onchange="setThumbnail1(event);"/> 
									<div class="image_container" id="ic1"><img src="" id="img1" onerror="this.src='./review_img/no-image.jpg'" /></div> 
								</td>
								<td>
									<input type="file" name="image2" accept="image/*" onchange="setThumbnail2(event);"/> 
									<div class="image_container" id="ic2"><img src="" id="img2" onerror="this.src='./review_img/no-image.jpg'" /></div> 
								</td>
								<td>
									<input type="file" name="image3" accept="image/*" onchange="setThumbnail3(event);"/> 
									<div class="image_container" id="ic3"><img src="" id="img3" onerror="this.src='./review_img/no-image.jpg'" /></div> 
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
		<script>
		$(function(){
			$('.starRev span').click(function(){
				  $(this).parent().children('span').removeClass('on');
				  $(this).addClass('on').prevAll('span').addClass('on');
				  let score = $(this).text();
				  $("#star-score").val(score);
				  return false;
				});
		});
		
		function setThumbnail1(event) {
			var reader = new FileReader(); 
			
			reader.onload = function(event) { 
				var img = document.getElementById("img1"); 
				img.setAttribute("src", event.target.result); 
				}; 
				
				reader.readAsDataURL(event.target.files[0]); 
			}
		function setThumbnail2(event) {
			var reader = new FileReader(); 
			
			reader.onload = function(event) { 
				var img = document.getElementById("img2"); 
				img.setAttribute("src", event.target.result); 
				}; 
				
				reader.readAsDataURL(event.target.files[0]); 
			}
		function setThumbnail3(event) {
			var reader = new FileReader(); 
			
			reader.onload = function(event) { 
				var img = document.getElementById("img3"); 
				img.setAttribute("src", event.target.result); 
				}; 
				
				reader.readAsDataURL(event.target.files[0]); 
			}

	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>