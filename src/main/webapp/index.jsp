<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY에 오신걸 환영합니다</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="test-slider slider-wrap" id="slide-wrap" style="z-index: 13;">
    <div class="slider-items item1">
        <div class="main-img-wrap">
            <p class="main-img-title">
                <span class="main-img-top-title">자바다이스 시티</span>
                <strong class="main-strong-title">JAVADICE CITY</strong>
                <span class="main-strong-content">도심 한가운데에서 맞이하는 달콤한 휴식, 자바다이스와 함께하세요.</span>
                <a class="main-img-btn">예약하기</a>
                </p>
        </div>
    </div>
    <div class="slider-items item2">
        <div class="main-img-wrap">
            <p class="main-img-title">
                <span class="main-img-top-title">다양한 혜택</span>
                <strong class="main-strong-title">JAVADICE REWARDS</strong>
                <span class="main-strong-content">자바다이스만의 리워즈 상품과 혜택으로 라이프 스타일의 다채로움을 더하세요.</span>
                <a class="main-img-btn">자세히 보기</a>
            </p>
        </div>
    </div>
    <div class="slider-items item3">
        <p class="main-img-title">
            <span class="main-img-top-title">JAVADICE CITY</span>
            <strong class="main-strong-title">CLEAN JAVADICE</strong>
            <span class="main-strong-content">세계적으로 인증받은 자바다이스시티! 유럽 최고 권위 GBAC STAR™ 인증 획득!</span>
            <span class="main-img-icon">
                <img src="./img/gbac-star.png" style="width: 150px; height: 150px;">
                <img src="./img/fobes-verified.png" style="width: 150px; height: 150px;">
            </span>
        </p>
    </div>
    <div class="slider-items item4">
        <p class="main-img-title">
            <span class="main-img-top-title">JAVADICE CITY</span>
            <strong class="main-strong-title">REWARD POINT</strong>
            <span class="main-strong-content">더 큰 혜택과 행복을 느껴보세요. 지금 가입하시고 회원만을 위한 다양한 혜택을 받으십시오.</span>
            <a class="main-img-btn">자세히 보기</a>
        </p>
    </div>
  </div>
</div>
	<div class="page-content">
 <!-- promotion wrap start-->
 <div class="belt">Promotion & Reward</div>
		<h3 style="text-align:center">JAVADICE CITY 에서만 누릴 수 있는 혜택을 받아보십시오.</h3>
 <div class="promotion-main-wrap" style="margin-top: 45px;">
    <div class="promotion-main-item promo1">
       <div class="promotion-main-img">
          <img src="./img/promo_big.jpg">
       </div>
       <div class="promotion-main-content">
          <p class="promotion-title">Breakfast Promotion</p>
          <hr>
          <p class="promotion-subTitle">신선한 식재료로 최고의 퀄티를 제공합니다.</p>
          <button>자세히 보기</button>
       </div>
    </div>
    <div class="promotion-main-item promo1">
        <div class="promotion-main-img">
           <img src="./img/promo_big.jpg">
        </div>
        <div class="promotion-main-content">
           <p class="promotion-title">Breakfast Promotion</p>
           <hr>
           <p class="promotion-subTitle">신선한 식재료로 최고의 퀄티를 제공합니다.</p>
           <button>자세히 보기</button>
        </div>
     </div>
     <div class="promotion-main-item promo1">
        <div class="promotion-main-img">
           <img src="./img/promo_big.jpg">
        </div>
        <div class="promotion-main-content">
           <p class="promotion-title">Breakfast Promotion</p>
           <hr>
           <p class="promotion-subTitle">신선한 식재료로 최고의 퀄티를 제공합니다.</p>
           <button>자세히 보기</button>
        </div>
     </div>
 </div>
 <br>
 <hr>
 <br>
 <div class="promo-wrap">
    <div class="promo-item promo4">
       <div class="promo-img">
          <img src="img/promo_big.jpg">
       </div>
       <div class="promo-content">
          <p class="promo-title">Breakfast Promotion</p>
          <hr>
          <p class="promo-subTitle">신선한 식재료로 최고의 퀄티를 제공합니다.</p>
       </div>
    </div>
    <div class="promo-item promo4">
        <div class="promo-img">
           <img src="img/promo_big.jpg">
        </div>
        <div class="promo-content">
           <p class="promo-title">Breakfast Promotion</p>
           <hr>
           <p class="promo-subTitle">신선한 식재료로 최고의 퀄티를 제공합니다.</p>
        </div>
     </div>
     <div class="promo-item promo4">
        <div class="promo-img">
           <img src="img/promo_big.jpg">
        </div>
        <div class="promo-content">
           <p class="promo-title">Breakfast Promotion</p>
           <hr>
           <p class="promo-subTitle">신선한 식재료로 최고의 퀄티를 제공합니다.</p>
        </div>
     </div>
 </div>
 <!-- promotion wrap end-->
	</div>
	<script>
$(document).ready(function(){
    // console.log("tset");
  $('.test-slider').slick({    
    infinite: true ,      // 무한반복
     slidesToShow: 1,     // 보여지는 슬라이드 개수
     slidesToScroll: 1,   // 넘어가는 슬라이드 개수
     dots: true,           // 점 네비게이션 표시
     arrows: true,        //화살표 표시
    autoplay: true ,      //자동스크롤
     autoplaySpeed: 5000   //자동스크롤 속도
  	});
});

</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>