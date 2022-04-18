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
	width: 1000px;
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
	color: #333;
	background-color: #fff;
	border: 1px solid #ccc
}
.more-view>button:hover{
	cursor: pointer;
	background-color: #eee;
	transition: 0.5s;
	color: #ac9e89;
}
.page-content{
	position: relative;
}
.list-button{
	width: 300px;
	text-align: right;
	position: absolute;
	top: 50px;
	right: 170px;
}
.list-button>button{
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
		<%if(m != null){
			if(m.getMemberLevel() == 0){ %>
				<div class="list-button">
					<button class="bc1 bs2 promotion-write" onclick="location.href='/promotionInsertFrm.do'">글쓰기</button>
				</div>
			<%	}
		} %>
		<div class="content-wrap">
		
		</div>
		<div class="more-view"><button class="bc6 bs3" id="more-btn" totalCount="<%=totalCount%>" currentCount="0" value="1">더보기</button></div>
	</div>
	<script>
		$("#more-btn").on("click",function(){
			const amount = 2;//더보기 한번 클릭 시 가져올 게시물 수
			const start = $(this).val();//가져올 게시물 시작번호
			$.ajax({
				url : "/promotionMore.do",
				type : "post",
				data : {start:start,amount,amount},
				success : function(data){
					for(let i=0;i<data.length;i++){
						const p = data[i];
						//프로모션에 링크 걸기
						const a = $("<a>");
						a.attr("href","/promotionDetail.do?promotionNo="+p.promotionNo);
						//프로모션 전체를 감싸는 div
						const wrap = $("<div>");
						wrap.addClass("promotion-wrap");
						//프로모션 한번 더 감싸는 div
						const item = $("<div>");
						item.addClass("promotion-main-item");
						item.addClass("promo3");
						//프로모션 내용을 감싸는 div
						const contentWrap = $("<div>");
						contentWrap.addClass("promotion-main-img");
						contentWrap.addClass("promo3-1");
						//프로모션  이미지
						const img = $("<img>");
						img.attr("src","/img/"+p.filepath);
						img.attr("style","height: 300px;");
						contentWrap.append(img);
						//프로모션 컨텐츠를 감싸는 div
						const contentDiv = $("<div>");
						contentDiv.addClass("promotion-main-content");
						//프로모션 타이틀
						const title = $("<p>");
						title.addClass("promotion-title");
						title.append(p.promotionTitle);
						contentDiv.append(title);
						const hr = $("<hr>");
						contentDiv.append(hr);
						//프로모션 내용
						const content = $("<p>");
						content.addClass("promotion-subTitle");
						content.append(p.promotionSubTitle+"<br>");
						content.append("기간 : "+p.startDate+" ~ "+p.endDate);
						contentDiv.append(content);
						//자세히 보기 버튼
						const detail = $("<button>");
						detail.addClass("bc4");
						detail.append("자세히 보기");
						contentDiv.append(detail);
						contentWrap.append(contentDiv);
						//이제 전체틀에 게시글 첨부하기
						item.append(contentWrap);
						wrap.append(item);
						a.append(wrap);
						$(".content-wrap").append(a);
					}
					$("#more-btn").val(Number(start)+amount);
					const currVal = Number($("#more-btn").attr("currentCount"));
					$("#more-btn").attr("currentCount",currVal+data.length);
					const totalCount = Number($("#more-btn").attr("totalCount"));
					if(totalCount == (currVal+data.length)){
						$("#more-btn").attr("disabled",true);
						$("#more-btn").css("cursor","not-allowed");
					}
				},
				error : function(){
					console.log("서버호출실패");
				}
			});
		});
		$(function(){
			$("#more-btn").click();
			setTimeout(function() {
				$("#more-btn").click();
			},500);
		})
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>