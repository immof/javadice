<%@page import="com.herejava.book.service.BookService"%>
<%@page import="com.herejava.member.vo.Member"%>
<%@page import="com.herejava.book.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%
    	Member m = (Member)session.getAttribute("m");
    %>
    <%
    	//예약상태 최신화 시켜주는 코드 (check_in 당일(오전12시)이 되면 예약상태가 1로 바뀜)
    	BookService service = new BookService();
    	int result1 = service.updateBookStateInBook();
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
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.5.7/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.8/slick-theme.min.css">
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
	margin-right:20px;
}
</style>
</head>
  <div class="con">
	<header>
		<div class="header-top">
			<div class="site-logo">
				<a href="/"> <img src="./img/javadice_logo.png"
					style="width: 280px;">
				</a>
			</div>
			<div class="header-link">
				<%if(m!=null) { %>
					<%if(m.getMemberLevel()==1){ %>
					<li><a href="/mypage_main.do?memberId=<%=m.getMemberId() %>&memberNo=<%=m.getMemberNo()%>&memberLevel=<%=m.getMemberLevel() %>" class="f-light fc-2">마이페이지</a></li>
					<%}else {%>
					<li><a href="/mypage_main.do?memberId=<%=m.getMemberId() %>&memberNo=<%=m.getMemberNo()%>&memberLevel=<%=m.getMemberLevel() %>" class="f-light fc-2">관리자페이지</a></li>
					<%} %>
					<li><a href="/logout.do" class="f-light fc-1">로그아웃</a></li>
				<%}else {%>
					<li><a href="/bookSelectFrm.do" class="f-light fc-1">예약조회</a></li>
					<li><a href="/loginFrm.do" class="f-light fc-1">로그인</a></li>
				<%} %>
			</div>
		</div>
		 <div class="header-bottom" style="z-index:20;">
         <nav>
            <ul class="navi">
               <li>
                  <a href="/bookSearch.do?checkIn=2020-01-01&checkOut=2020-01-02&bookPeople=1"><i class="fa-solid fa-magnifying-glass searchIcon"></i>객실예약</a>
               </li>
               <li><a href="/hotelListFrm.do">객실정보</a></li>
               <li><a href="/promotionList.do">프로모션</a></li>
               <li><a href="/location.do">오시는길</a></li>
               <li><a href="/noticeList.do?reqPage=1">게시판<span class="material-icons">expand_more</span>
               </a>
                  <ul class="sub-navi">
                     <li><a href="/noticeList.do?reqPage=1">공지사항</a></li>
                     <li><a href="/askList.do?reqPage=1">문의사항</a></li>
                     <li><a href="/fAQList.do">자주묻는 질문</a></li>
                     <li><a href="/reviewList_admin.do?reqPage=1">고객후기</a></li>
                  </ul></li>
            </ul>
         </nav>
      </div>
   </header>