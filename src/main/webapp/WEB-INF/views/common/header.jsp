<%@page import="com.herejava.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=GFS+Didot&family=Rubik+Moonrocks&display=swap"
	rel="stylesheet">
<!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- jquery -->
<script src="js/jquery-3.6.0.js"></script>
<!-- 기본 CSS -->
<link rel="stylesheet" href="css/default.css" />
<link rel="stylesheet" href="css/sweetalert2.min.css" />
<!-- 기본 js -->
<script src="js/default.js"></script>
<script src="js/sweetalert2.all.min.js"></script>
<script src="https://kit.fontawesome.com/2fade9eaba.js" crossorigin="anonymous"></script>
<style>
.flex-wrap {
	display: flex;
	flex-wrap: wrap;
}

.flex-wrap>div {
	margin-right: 20px;
}

.bg {
	color: #fff;
}
</style>
</head>
<body>
	<header>
		<div class="header-top">
			<div class="site-logo">
				<a href="/"> <img src="./img/javadice_logo.png"
					style="width: 280px;">
				</a>
			</div>
			<div class="header-link">
				<li><a href="#" class="f-light fc-1">예약조회</a></li>
				<li><a href="/loginFrm.do" class="f-light fc-1">로그인</a></li>
				<li><a href="/mypage.do?memberId=oventest123@gmail.com" class="f-light fc-2"> 
					<span class="material-icons">perm_identity</span> 
					<span class="material-icons">expand_more</span>
				</a>
					<ul class="login-sub-navi">
						<li><a href="#" class="f-light fc-1">sub-1</a></li>
						<li><a href="#" class="f-light fc-1">sub-2</a></li>
						<li><a href="#" class="f-light fc-1">sub-3</a></li>
					</ul></li>
			</div>
		</div>
		<div class="header-bottom">
			<nav>
				<ul class="navi">
					<li>
						<i class="fa-solid fa-magnifying-glass"></i>
						<a href="#">숙소예약</a>
					</li>
					<li><a href="#">객실정보</a></li>
					<li><a href="#">프로모션</a></li>
					<li><a href="/location.do">오시는길</a></li>
					<li><a href="#">게시판<span class="material-icons">expand_more</span>
					</a>
						<ul class="sub-navi">
							<li><a href="/noticeList.do?reqPage=1">공지사항</a></li>
							<li><a href="#">문의사항</a></li>
							<li><a href="#">자주묻는 질문</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>