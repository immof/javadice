<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.herejava.review.vo.ReviewList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<ReviewList> reviewList = (ArrayList<ReviewList>)request.getAttribute("reviewList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.review-wrap{
	display: flex;
	width: 800px;
	/* width: 970px; */
	/* min-height: 200px; */
	/* background-color: cadetblue; */
	margin: 15px 0 15px 15px;
}
.review-profile{
	/* background-color: blanchedalmond; */
	text-align: center;
	padding: 10px;
	padding-top: 20px;
}
.review-content{
	/* background-color: thistle; */
	padding: 10px;
	width: 708px;
}
.review-info{
	display: flex;
	justify-content: space-between;
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
	height: 40px;
    display: -webkit-box;
	overflow: hidden;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical; 
}
.room-type{
	width: 45%;
}
.empty-msg{
	padding: 50px;
	border-bottom: 1px solid #ac9e89;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">나의 리뷰</div>
			<%if(reviewList == null){ %>
				<div class="empty-msg">아직 작성된 리뷰가 없습니다.</div>
			<%}else{ %>
				
			<%} %>
			<%for(ReviewList rev : reviewList){ %>
			<%
				Date today = new Date();
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date regDay = formatter.parse(rev.getReviewEnrollDate());
				     long diffSec = (today.getTime() - regDay.getTime()) / 1000; //초 차이
				     long diffDays = diffSec / (24*60*60); //일자수 차이
				     String msg = null;
				     if(diffDays < 30){
				    	 msg = diffDays + "일 전";
				     }else if(diffDays >= 30){
				    	 msg = (int)(Math.floor(diffDays/30)) + "개월 전";
				     }else if(diffDays >=360){
				    	 msg = (int)(Math.floor((diffDays/30)/12)) + "년 전";
				     }
			%>
				<div class="review-wrap">
					<div class="review-profile">
						<img src="../profile_img/<%=m.getFilepath() %>" style="width: 72px; height: 72px;">
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
							<span class="review-button">
								<button class="btn bc4 bs6" id="update-btn">수정</button>
								<button class="btn bc3 bs6" id="delete-btn">삭제</button>
							</span>
						</div>
						<div class="review-text">
							<p><%=rev.getReviewContent() %></p>
						</div>
					</div>
				</div>
			<%} %>		
				<div>
				
				</div>	
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>