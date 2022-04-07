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
				<a href="#"> <img src="./img/javadice_logo.png"
					style="width: 280px;">
				</a>
			</div>
			<div class="header-link">
				<li><a href="#" class="f-light fc-1">예약조회</a></li>
				<li><a href="#" class="f-light fc-1">로그인</a></li>
				<li><a href="#" class="f-light fc-2"> <span
						class="material-icons">perm_identity</span> <span
						class="material-icons">expand_more</span>
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
					<li><a href="#">메뉴-1</a></li>
					<li><a href="#">메뉴-2</a></li>
					<li><a href="#">메뉴-3</a></li>
					<li><a href="#">메뉴-4</a></li>
					<li><a href="#">메뉴-5 <span class="material-icons">expand_more</span>
					</a>
						<ul class="sub-navi">
							<li><a href="#">sub-1</a></li>
							<li><a href="#">sub-2</a></li>
							<li><a href="#">sub-3</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</header>