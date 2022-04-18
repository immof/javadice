<%@page import="com.herejava.review.vo.ReviewListAdmin"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<ReviewListAdmin> list = (ArrayList<ReviewListAdmin>)request.getAttribute("list");
    	String pageNavi = (String)request.getAttribute("pageNavi");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리뷰</title>
<style>
.review-wrap{
	display: flex;
	width: 900px;
	margin: 15px 0 15px 35px;
}
.review-profile{
	text-align: center;
	padding: 10px;
	padding-top: 20px;
}
.review-content{
	padding: 10px;
	width: 708px;
}
.review-info{
	align-content: center;
	align-items: baseline;
	height: 45px;
}
.review-info i,
.review-info span{
	vertical-align: middle;
}
.review-info i{
	letter-spacing: -6px;
}
.score-text{
	padding-left: 7px;
}
.review-text{
	border: 1px solid #a7a7a7;
	padding: 10px;

}
.view-change{
	height: 40px;
    display: -webkit-box;
	overflow: hidden;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical; 
}
.room-type{
	margin-left: 20px;
	width: 180px;
}
.empty-msg{
	padding: 50px;
	border-bottom: 1px solid #ac9e89;
}
.rv-wrap{
	min-height: 500px;
}
#view-change-btn{
	width: 120px;
	font-size: 18px;
	text-align: right;
	background-color: transparent;
	border: none;
}
#view-change-btn>i{
	color: #ac9e89;
}
#view-change-btn:hover>span{
	color: #998465;
	cursor: pointer;
}
.review-img-wrap{
	display: flex;
	margin-top: 30px;
}
.review-img{
	/* flex-grow: 1; */
	justify-items: center;
}
.review-img img{
	width: 150px;
	height: 84px;
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
		#pageNavi{
			margin:10px;
			margin-bottom: 80px;
		}
</style>
</head>
<body>
		<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page1-content">
		<div class="belt">REVIEWS</div>
		<br>
		<%@include file="/WEB-INF/views/common/notice_submenu.jsp" %>
		<br>
				<div class="page1-title" id="review-page-title2">
					고객후기
				</div>
				<div class="review-all-wrap rv-wrap">
<%for(ReviewListAdmin rev : list){ %>
				
			   	<%
				Date today = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date regDay = formatter.parse(rev.getReviewEnrollDate());
				     long diffSec = (today.getTime() - regDay.getTime()) / 1000; //초 차이
				     long diffDays = diffSec / (24*60*60); //일자수 차이
				     String msg = null;
				     if(diffDays < 1){
				    	 msg = "오늘";
					 }else if(diffDays < 30){
				    	 msg = diffDays + "일 전";
				     }else if(diffDays >= 30 && diffDays < 360){
				    	 msg = (int)(Math.floor(diffDays/30)) + "개월 전";
				     }else if(diffDays >=360){
				    	 msg = (int)(Math.floor((diffDays/30)/12)) + "년 전";
				     }
			/** 사용자 이름 마스킹 처리 */
				String firstName = rev.getBookName().substring(0,1);
				String midName = rev.getBookName().substring(1, rev.getBookName().length()-1);
				String cnvMidName = "";
				for(int i=0; i< midName.length(); i++){ 
					cnvMidName += "*"; 
				} // 중간 글자 수 만큼 * 표시
				String lastName = rev.getBookName().substring(rev.getBookName().length()-1,rev.getBookName().length());
				String maskingName = firstName + cnvMidName + lastName;
				%>
				<div class="review-wrap">
					<div class="review-profile">
						<img src="../profile_img/<%=rev.getMemberProfile() %>" style="width: 72px; height: 72px;">
						<p><%=msg %></p>
					</div>
					<div class="review-content">
						<div class="review-info">
							<span class="star-score">
							<%if(rev.getReviewScore() == 1){ %>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #a7a7a7;">star_border</i>
								<i class="material-icons" style="color: #a7a7a7;">star_border</i>
								<i class="material-icons" style="color: #a7a7a7;">star_border</i>
								<i class="material-icons" style="color: #a7a7a7;">star_border</i>
								<span class="score-text" style="font-size: 18px; line-height: 30px; color: #c87431;">1</span>
							<%}else if(rev.getReviewScore() == 2){ %>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #a7a7a7;">star_border</i>
								<i class="material-icons" style="color: #a7a7a7;">star_border</i>
								<i class="material-icons" style="color: #a7a7a7;">star_border</i>
								<span class="score-text" style="font-size: 18px; line-height: 30px; color: #c87431;">2</span>
							<%}else if(rev.getReviewScore() == 3){ %>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #a7a7a7;">star_border</i>
								<i class="material-icons" style="color: #a7a7a7;">star_border</i>
								<span class="score-text" style="font-size: 18px; line-height: 30px; color: #c87431;">3</span>
							<%}else if(rev.getReviewScore() == 4){ %>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #a7a7a7;">star_border</i>
								<span class="score-text" style="font-size: 18px; line-height: 30px; color: #c87431;">4</span>
							<%}else if(rev.getReviewScore() == 5){ %>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<i class="material-icons" style="color: #f7c728;">star</i>
								<span class="score-text" style="font-size: 18px; line-height: 30px; color: #c87431;">5</span>
							<%} %>
					 		</span>
					 		<%if(rev.getRoomNo() == 6){ %>
							<span class="room-type">객실타입: 로얄스위티</span>
					 		<%}else if(rev.getRoomNo() == 7){ %>
							<span class="room-type">객실타입: 프리미어 스위트</span>
					 		<%}else if(rev.getRoomNo() == 8){ %>
							<span class="room-type">객실타입: 프리미어</span>
					 		<%}else if(rev.getRoomNo() == 9){ %>
							<span class="room-type">객실타입: 디럭스</span>
					 		<%}else if(rev.getRoomNo() == 10){ %>
							<span class="room-type">객실타입: 스탠다드</span>
							<%} %>
							<span style="margin: 0 15px; font-size: 12px;">|</span>
							<span class="review-button">
								인원: <%=rev.getBookPeople() %>명
							</span>
							<span style="margin: 0 15px; font-size: 12px;"">|</span>
							<span class="review-button">
								<%=maskingName %>님
							</span>
						</div>
						<div class="review-text view-change">
							<p><%=rev.getReviewContent() %></p>
							<div class="review-img-wrap">
								<div class="review-img">
								<%if(rev.getFilepath1() != null){ %>
									<img src="./review_img/<%=rev.getFilepath1() %>" onerror="this.src='./review_img/no-image.jpg'">
								<%} %>
								</div>
								<div class="review-img">
								<%if(rev.getFilepath2() != null){ %>
									<img src="./review_img/<%=rev.getFilepath2() %>" onerror="this.src='./review_img/no-image.jpg'">
								<%} %>	
								</div>
								<div class="review-img">
								<%if(rev.getFilepath3() != null){ %>
									<img src="./review_img/<%=rev.getFilepath3() %>" onerror="this.src='./review_img/no-image.jpg'">
								<%} %>		
								</div>
							</div>
						</div>
					</div>
				</div>
<%} %>
			</div>
			</div> <!-- my page-content -->
			<br>
		<div id="pageNavi"><%=pageNavi %></div>
	<script>
		$(function(){
			$(".review-text").on("click",function(){
				$(this).toggleClass("view-change");
			});
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>