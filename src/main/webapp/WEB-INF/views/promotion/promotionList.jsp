<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int totalCount = (Integer)request.getAttribute("totalCount");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
<style>
h3{
	text-align: center;
	font-weight: 400;
	color: rgb(102, 102, 102);
}
.content-wrap{
	width: 950px;
	margin: 0 auto;
	margin-bottom: 100px;
	overflow: hidden;
	display: flex;
	flex-flow: wrap;
	justify-content: space-around;
}
.promotion-wrap{
	padding-top: 100px;
}
.more-view{
	width: 500px;
	margin: 0 auto;
	text-align: center;
	margin-bottom: 100px;
}
.more-view>button{
	border: none;
	padding: 0;
	width: 250px;
	height: 50px;
	background-color: #fff;
	border: 1px solid #ccc
}
.more-view>button:hover{
	cursor: pointer;
	background-color: #eee;
	transition: 0.5s;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt">Promotion</div>
		<h3>JAVADICE CITY 에서 준비한 특별한 프로모션 상품들을 경험해보세요.</h3>
		<div class="content-wrap">
			<div class="promotion-wrap">
				<div class="promotion-main-item promo3">
					<div class="promotion-main-img promo3-1">
						<img style="height: 300px;" src="img/promo_big.jpg">
						<div class="promotion-main-content">
							<p class="promotion-title">Breakfast Promotion</p>
							<hr>
							<p class="promotion-subTitle">
							신선한 식재료로 최고의 퀄티를 제공합니다.<br>
							기간 : start_date ~ end_date
							</p>
							<button class="bc4">자세히 보기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="promotion-wrap">
				<div class="promotion-main-item promo3">
					<div class="promotion-main-img promo3-1">
						<img style="height: 300px;" src="img/promo_big.jpg">
						<div class="promotion-main-content">
							<p class="promotion-title">Breakfast Promotion</p>
							<hr>
							<p class="promotion-subTitle">
							신선한 식재료로 최고의 퀄티를 제공합니다.<br>
							기간 : start_date ~ end_date
							</p>
							<button class="bc4">자세히 보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="more-view"><button class="bc6 bs3">더보기</button></div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>