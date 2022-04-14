<%@page import="com.herejava.member.vo.Member"%>
<%@page import="com.herejava.book.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%
    	Member m = (Member)session.getAttribute("m");
    %>
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
<link rel="stylesheet" href="css/default_city.css" />
<link rel="stylesheet" href="css/sweetalert2.min.css" />
<!-- 기본 js -->
<script src="js/default.js"></script>
<script src="js/sweetalert2.all.min.js"></script>
<script src="https://kit.fontawesome.com/2fade9eaba.js" crossorigin="anonymous"></script>
<script src="./summernote/summernote-lite.js"></script>
<script src="./summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="./summernote/summernote-lite.css">
<style>
.flex-wrap {
	display: flex;
	flex-wrap: wrap;
}
.bg {
	color: #fff;
}
.searchIcon{
	margin-right: 10px; 
}
.header-link{
	margin-right:40px;
}
.header-link>li{
	text-align: center;
	margin-right:40px;
}
</style>
</head>
	<header>
		<div class="header-top">
			<div class="site-logo">
				<a href="/"> <img src="./img/javadice_logo.png"
					style="width: 280px;">
				</a>
			</div>
			<div class="header-link">
				<%if(m!=null) { %>
					<li><a href="/mypage_main.do?memberId=<%=m.getMemberId() %>&memberNo=<%=m.getMemberNo()%>&memberLevel=<%=m.getMemberLevel() %>" class="f-light fc-2">마이페이지</a></li>
					<li><a href="/logout.do" class="f-light fc-1">로그아웃</a></li>
				<%}else {%>
					<li><a href="#" class="f-light fc-1">예약조회</a></li>
					<li><a href="/loginFrm.do" class="f-light fc-1">로그인</a></li>
				<%} %>
			</div>
		</div>
		<div class="header-bottom">
         <nav>
            <ul class="navi">
               <li>
                  <a href="#"><i class="fa-solid fa-magnifying-glass searchIcon"></i>숙소예약</a>
               </li>
               <li><a href="#">객실정보</a></li>
               <li><a href="/promotionList.do">프로모션</a></li>
               <li><a href="/location.do">오시는길</a></li>
               <li><a href="#">게시판<span class="material-icons">expand_more</span>
               </a>
                  <ul class="sub-navi">
                     <li><a href="/noticeList.do?reqPage=1">공지사항</a></li>
                     <li><a href="/askList.do?reqPage=1">문의사항</a></li>
                     <li><a href="#">자주묻는 질문</a></li>
                  </ul></li>
            </ul>
         </nav>
      </div>
   </header>