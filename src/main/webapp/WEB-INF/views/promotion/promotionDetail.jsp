<%@page import="com.herejava.promotion.vo.Promotion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%Promotion p = (Promotion)request.getAttribute("p"); %>
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
.detail-wrap{
	width: 900px;
	margin: 0 auto;
	margin-top: 100px;
}
.detail-head{
	width: 100%;
	display: flex;
	justify-content: space-between;
}
.head-left{
	width: 400px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}
.left-title>h3{
	text-align: left;
	font-size: 16px;
	color: #666;
	padding-top: 15px;
}
.head-right{
	width: 450px;
	height: 300px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.head-left>div>h1{
	margin-top: 50px;
	padding-bottom: 10px;
}
.head-left>div>h2{
	padding-top: 10px;
	font-weight: 400;
}
.head-left>p{
	margin-bottom: 30px;
}
.head-right>img{
	width: 420px;
	height: 250px;
}
.detail-bottom{
	width: 100%;
	padding-top: 50px;
}
.detail-bottom>.bottom-content{
	width: 850px;
	min-height: 500px;
	margin: 0 auto;
	margin-top: 35px;
	padding: 20px;
	border: 1px solid #ccc; 
	border-radius: 10px;
}
.detail-bottom>.bottom-content>p{
	word-break:break-all;
}
.detail-button{
	width: 300px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}
.detail-button>button{
	width: 140px;
	height: 50px;
	padding: 0;
	border: none;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt">Promotion</div>
		<h3>JAVADICE CITY 에서 준비한 특별한 프로모션 상품들을 경험해보세요.</h3>
		<div class="detail-wrap">
			<div class="detail-head">
				<div class="head-left">
					<div class="left-title">
						<h1><%=p.getPromotionTitle() %></h1><hr>
						<h3><%=p.getPromotionSubTitle() %></h3>
					</div>
					<p>기간 : <%=p.getStartDate() %> ~ <%=p.getEndDate() %></p>	
				</div>
				<div class="head-right">
					<img src="/img/<%=p.getFilepath() %>">
				</div>
			</div>
			<br><hr>
			<div class="detail-bottom">
				<h1>패키지설명</h1>
				<div class="bottom-content">
					<p><%=p.getPromotionContentBr() %></p>
				</div>
			</div>
		</div>
		<br><br><br><br>
		<%if(m != null){
			if(m.getMemberLevel() == 0){ %>
		<div class="detail-button">
			<button class="bc1 bs2 detail-update" onclick="location.href='/promotionModifyFrm.do?promotionNo=<%=p.getPromotionNo()%>'">수정하기</button>
			<button class="bc2 bs2 detail-delete">삭제</button>
		</div>
		<%	}
		} %>
		<br><br><br>
	</div>
	<script>
		$(".detail-delete").on("click",function(){
			if(confirm("해당 프로모션을 정말 삭제하시겠습니까?")){
				$(location).attr("href","/deletePromotion.do?promotionNo=<%=p.getPromotionNo()%>");
			}
		})
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>