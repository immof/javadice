<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 객실정보 ::</title>
<script src="js/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
	window.onload = function() {
		function navigo() {
			const header = document.getElementById("test")
			const headerheight = header.clientHeight;
			document.addEventListener('scroll', onScroll, {
				passive : true
			});
			function onScroll() {
				const scrollposition = pageYOffset;
				const nav = document.getElementById('test2');
				if (750 <= scrollposition) {
					nav.classList.add('fix')
				} else {
					nav.classList.remove('fix');
				}
			}
		}
		navigo()
	}
</script>
<style>
.List-wrap {
	width: 1200px;
	margin: 0 auto;
	height: 100%;
}

.List-topwrap {
	width: 1200px;
	margin: 0 auto;
}

.Room-List {
	
	height: 75px;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%
}

.top-ul {
	background-color: #998465;
	overflow: hidden;
	height: 75px;
	position: absolute;
	display: flex;
	justify-content: center;
}

.top-ul>li {
	height: 100%;
	width: calc(1200px/ 5);
	text-align: center;
	list-style-type: none;
}

.top-ul>li {
	line-height: 75px;
	color: #ccc;
	font-size: 20px;
	font-family: ns-regular;
	text-decoration: none
}

.top-ul>li>div>a {
	color: #ccc;
	font-size: 20px;
	font-family: ns-regular;
	text-decoration: none
}

.logo-wrap {
	padding-top: 100px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.text {
	margin: auto;
	font-size: 45px;
	 font-family: 'GFS Didot',serif;
	color: #fff;
		border-bottom: 2px solid #fff;
}

.menu{
}

.Logo {
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

.Logo>.infor-img {
}

.info-List-wrap {
	margin-top: 130px;
}

.info-List {
	margin-top: 125px;
	margin: auto;
	width: 1200px;
}

.info-List>.menu {
	float: left;
	text-align: left;
	font-size: 25px;
	width: calc(1200px/ 4);
	color: #fff;
	font-family: 'GFS Didot',serif;
	padding-left:60px;

}

.menu>p{
	color: #fff;
		font-family: 'GFS Didot',serif;
		margin-bottm: 10px !important;
		
}
.menu>p:hover{
}

.sub-menu {
	display: none;
}

.sub-menu>li {
	font-size: 18px;
	color: #fff;
	font-family: ns-thin;
	text-align: left;
	
}

.sub-menu>li:first-child {
	padding-top:10px;
		border-top: 2px solid #fff;
}




.room-name {
	margin-top: 550px;
	margin-bottom: 150px;
	width: 1200px;
	text-align: center;
	font-size: 40px;
	color: #333333;
	font-family: 'GFS Didot',serif;
}

.room-img {
	width: 1200px;
	height: 400px;
	margin: 0 auto;
}

.option {
	margin-top: 15px;
	margin-left: 38px;
	margin-bottom: 20px;
	color: #998465;
	font-size: 20px;
	font-style: italic;
	font-weight: bold;
}

.sub-option>ul>li {
	margin-left: 45px;
	font-size: 13px;
}

.top-ul>li>div>a:hover {
	font-size: 20px;
	font-weight: bold;
	color: #432f31;
	transition-duration: 0.5s;
}

.fix {
	top: 0px;
	position: fixed;
	animation: down 0.5s ease
}

@
keyframes down { 
	0%{
		transform: translateY(-50px)
	}
	100%{
		transform: translateY(0px)
	}
}
html {
	scroll-behavior: smooth;
}
.fixed {
	width: 100px;
	height: 100px;
	position: fixed;
	bottom: 200px;
	right: 600px;
}
.carousel-inner {
	z-index: -5;
}
.img-btn {
	z-index: -5;
}
a {
	font-size: 16px !important;
	
}
.navi > li:hover > a {
  text-decoration:none !important;
}
a:hover{
	color: #998465 !important;
	 text-decoration:none !important;
}
.sub-navi>li a{
	color: #333 !important;
}
#test2 li div a{
	font-size: 18px !important;
	color: #fff !important;
	display:block;
}
#test2 li div:hover a{
	font-size: 18px !important;
	color: #fff !important;
	font-weight: normal !important;
	background-color: #432f31 !important;
}
.infor{
	  background-image: linear-gradient(
            rgba(0, 0, 0, 0.7),
            rgba(0, 0, 0, 0.7)
          ),
          url("./img/room_table.jpg") !important;
    background-size: cover ;
    height: 715px;
}
.glyphicon{
 color: #fff;
}

</style>
</head>
<body>
	<div id="top-img"></div>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
			<div class="Room-List" id="test">
				<ul class="top-ul" id="test2">
					<li>
						<div>
							<a href="#standard">스탠다드</a>
						</div>
					</li>
					<li>
						<div>
							<a href="#deluxe">디럭스</a>
						</div>
					</li>
					<li><div>
							<a href="#premier">프리미어</a>
						</div></li>
					<li><div>
							<a href="#Premier-Suite">프리미어 스위트</a>
						</div></li>
					<li><div>
							<a href="#Royal-Suite">로얄 스위트</a>
						</div></li>
				</ul>
			</div>
		<div class="infor">
			<div class="logo-wrap">
				<div class="text">INFORMATION</div>
			</div>
			
			<div class="info-List-wrap">
				<ul class="info-List">
					<li class="menu"><p class="room-list-info">ROOM INFO</p>
						<ul class="sub-menu">
							<li>조식은 추가 예약</li>
							<li>객실당 무료주차 2대</li>
							<li>36개월 이하 추가요금 없음</li>
							<li>기준인원 초과시 1인 50000원</li>
						</ul>
					</li>
					<li class="menu"><p class="room-list-info">CHECK IN/OUT</p>
						<ul class="sub-menu">
							<li>Check in 04:00PM</li>
							<li>Check Out 11:00AM</li>
						</ul>
					</li>
					<li class="menu"><p class="room-list-info">ROOM SERVICE</p>
						<ul class="sub-menu">
							<li>와인셀러 / 건조기</li>
							<li>전동 커튼 / TV,인터넷</li>
							<li>개인용 금고 / 냉장고</li>
							<li>웰컴 드링크 / 월풀 욕조</li>
						</ul>
					</li>
					<li class="menu">
						<p class="room-list-info">AMENITY</p>
						<ul class="sub-menu">
							<li>헤어드라이기 / 샤워캡</li>
							<li>실내 슬리퍼 / 칫솔세트</li>
							<li>레이디 세트 / 면도기 세트</li>
							<li>바스 어메니티 / 조말론,록시땅</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	<div class="List-wrap">
		<div id="standard"></div>
		<div class="room-List-wrap">
			<div class="name-box">
				<div class="belt">STANDARD</div>
			</div>
		
			<div style="width: 1200px; margin: 0px;">
				<div id="carousel-example-generic1" class="carousel slide">
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic1" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic1" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic1" data-slide-to="2"></li>
						<li data-target="#carousel-example-generic1" data-slide-to="3"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="./img/list_room1.jpg"
								style="width: 1200px; height: 675px;">
							<div class="carousel-caption" style="color: black;"></div>
						</div>
						<div class="item">
							<img src="./img/list_room2.jpg"
								style="width: 1200px; height: 675px;">
							<div class="carousel-caption" style="color: black;"></div>
						</div>
						<div class="item">
							<img src="./img/list_room3.jpg"
								style="width: 1200px; height: 675px;">
							<div class="carousel-caption" style="color: black;"></div>
						</div>
						<div class="item">
							<img src="./img/list_room4.jpg"
								style="width: 1200px; height: 675px;">
							<div class="carousel-caption" style="color: black;"></div>
						</div>
					</div>
					<div class=img-btn>
						<a class="left carousel-control" href="#carousel-example-generic1"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic1" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span>
						</a>
					</div>
				</div>
			</div>

			<div class="option">Additional Options</div>
			<div class="sub-option">
				<ul>
					<li>전동 커튼 ,SIMMONS 프리미엄 매트리스, GRANGE 프리미엄 가구, 네스프레소 커피머신</li>
					<li>마사지오 안마의자</li>
					<li>50인치 TV</li>
				</ul>
			</div>
		</div>		
			
		<div id="deluxe"></div>
		<div class="name-box">
			<div class="belt">DELUXE</div>
		</div>
		<div style="width: 1200px; margin: 0px;">
			<div id="carousel-example-generic" class="carousel slide">
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="./img/list_room5.jpg"
							style="width: 1200px; height: 675px;">
						<div class="carousel-caption" style="color: black;"></div>
					</div>
					<div class="item">
						<img src="./img/list_room6.jpg" style="width: 1200px; height: 675px;">
						<div class="carousel-caption" style="color: black;"></div>
					</div>
				</div>
				<div class=img-btn>
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				</a>
				</div>
			</div>
		</div>
		<div class="option">Additional Options</div>
		<div class="sub-option">
			<ul>
				<li>전동 커튼 ,SIMMONS 프리미엄 매트리스, GRANGE 프리미엄 가구, 네스프레소 커피머신</li>
				<li>프리미엄 마사지오 안마의자</li>
				<li>55인치 TV</li>
			</ul>
		</div>
		<div id="premier"></div>
		<div class="name-box">
			<div class="belt">PRIMIER</div>
		</div>
		
		<div style="width: 1200px; margin: 0px;">
				<div id="carousel-example-generic1" class="carousel slide">
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic1" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic1" data-slide-to="1"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
						<img src="./img/list_room7.jpg"
							style="width: 1200px; height: 675px;">
						<div class="carousel-caption" style="color: black;"></div>
					</div>
					<div class="item">
						<img src="./img/list_room9.jpg"
						style="width: 1200px; height: 675px;">
						<div class="carousel-caption" style="color: black;"></div>
					</div>
				</div>
				<div class=img-btn>
						<a class="left carousel-control" href="#carousel-example-generic1"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic1" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span>
						</a>
					</div>
				</div>
			</div>
		
		<div class="option">Additional Options</div>
		<div class="sub-option">
			<ul>
				<li>전동 커튼 ,SIMMONS 프리미엄 매트리스, GRANGE 프리미엄 가구, 네스프레소 커피머신</li>
				<li>프리미엄 그랜드 안마의자</li>
				<li>60인치 TV</li>
			</ul>
		</div>
		
		<div id="Premier-Suite"></div>
		<div class="name-box">
			<div class="belt">PRIMIER SUITE</div>
		</div>
		<div style="width: 1200px; margin: 0px;">
			<div id="carousel-example-generic" class="carousel slide">
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="./img/list_room10.jpg"
							style="width: 1200px; height: 675px;">
						<div class="carousel-caption" style="color: black;"></div>
					</div>
					<div class="item">
						<img src="./img/list_room14.jpg" style="width: 1200px; height: 675px;">
						<div class="carousel-caption" style="color: black;"></div>
					</div>
					<div class="item">
						<img src="./img/room_table.jpg"
						 style="width: 1200px; height: 675px;">
						<div class="carousel-caption" style="color: black;"></div>
					</div>
				</div>
				<div class=img-btn>
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				</a>
				</div>
			</div>
		</div>
		<div class="option">Additional Options</div>
		<div class="sub-option">
			<ul>
				<li>전동 커튼 ,SIMMONS 프리미엄 매트리스, GRANGE 프리미엄 가구, 네스프레소 커피머신</li>
				<li>프리미엄 그랜드 안마의자</li>
				<li>65인치 TV</li>
			</ul>
		</div>
		<div id="Royal-Suite"></div>
		<div class="room-List-wrap">
			<div class="name-box">
				<div class="belt">ROYAL SUITE</div>
			</div>
		
			<div style="width: 1200px; margin: 0px;">
				<div id="carousel-example-generic1" class="carousel slide">
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic1" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic1" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic1" data-slide-to="2"></li>
						<li data-target="#carousel-example-generic1" data-slide-to="3"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="./img/list_room12.jpg"
								style="width: 1200px; height: 675px;">
							<div class="carousel-caption" style="color: black;"></div>
						</div>
						<div class="item">
							<img src="./img/list_room11.jpg"
								style="width: 1200px; height: 675px;">
							<div class="carousel-caption" style="color: black;"></div>
						</div>
						<div class="item">
							<img src="./img/list_room13.jpg"
								style="width: 1200px; height: 675px;">
							<div class="carousel-caption" style="color: black;"></div>
						</div>
						<div class="item">
							<img src="./img/list_room8.jpg"
								style="width: 1200px; height: 675px;">
							<div class="carousel-caption" style="color: black;"></div>
						</div>
					</div>
					<div class=img-btn>
						<a class="left carousel-control" href="#carousel-example-generic1"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic1" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span>
						</a>
					</div>
				</div>
			</div>

			<div class="option">Additional Options</div>
			<div class="sub-option">
				<ul>
					<li>전동 커튼 ,SIMMONS 프리미엄 매트리스, GRANGE 프리미엄 가구, 네스프레소 커피머신</li>
				<li>프리미엄 로얄 안마의자</li>
				<li>80인치 TV</li>
				</ul>
			</div>
		</div>		
		<br><br><br>
		<br><br><br>
		<br><br><br>
		<br><br><br>
	</div>
	<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			 $('#carousel-example-generic').carousel({
				interval : 3000,
				pause : "hover",
				wrap : true,
				keyboard : true
			});
			
			$(".room-list-info").on("mouseover",function(){
				$(this).next().slideDown();
				
			});	
			$(".room-list-info").on("mouseout",function(){
				$(this).next().slideUp();
			});	
				
		});
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>





