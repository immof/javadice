<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.member.vo.Member"%>
<%@page import="com.herejava.book.vo.BookData"%>
<%@page import="com.herejava.review.vo.ReviewList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<BookData> list = (ArrayList<BookData>)request.getAttribute("list");
    	ArrayList<ReviewList> reviewList =(ArrayList<ReviewList>)request.getAttribute("reviewList"); 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 회원 페이지 ::</title>
<script src="/js/sweetalert2.min.js"></script>
<style>
	.mypage-content{
		min-height: 800px;
	}
	.mypage-content-title{
		margin-top : 15px;
	}
	.th-1{
		text-align: left;
		padding-top: 25px;
		padding-right: 25px;
	}
	.td-1{
		text-align: left;
		padding-top: 25px;
		padding-right: 25px;
		padding-left: 10px;
	}
	.tr-1>*{
		text-align: left;
	}
	.p-0{
		font-weight: bold;
		font-size: 18px;
		display: inline-block;
		margin-right: 40px;
		width: 125px;
	}
	.p-1{
		text-align: right;
		text-decoration : underline;
	}
	.p-2{
		font-size: 16px;
		margin-top: 5px;
	}
	.h3-0{
		text-align : center;
		padding: 100px;
	}
	.view-0{
		text-decoration : underline;
	}
	.my_book_tbl{
		width: 100%;
	}
	.my_info_tbl>tr>td:nth-child(3){
		width: 60%;
		text-align: right;
	}
	h4 {
		display:inline-block;
	}
	.hr-0{
		color: #ac9e89;
	}
	.mypage-content-title>.title1{
		margin-top: 10px;
	}
	.my_book_wrap{
		margin-bottom: 36px;
	}
	.img-box-td{
		width: 30%;
	}
	.info-box-td{
		width:42%;
	}
	.view-box-td{
		width:10%;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<!-- 최근예약내역 시작 -->	
				<div class="mypage-content-title">최근 예약내역</div>
					<div class="my_book_wrap">
				<!-- 예약리스트 시작 -->	
					 <%
					 	if(list.size() >= 2) {
							for(int i=0;i<2;i++) {
								BookData bd = list.get(i);
					 %>
								<table class="my_book_tbl">
								<tr>
									<!-- 객실 사진 -->
									<td class="img-box-td">
										<img class="img-0" src="/img/<%=bd.getFilePath()%>">
									</td>
									<!-- 객실 이름/예약상태/숙박일자 -->
									<td class="info-box-td">
										<p class="p-0"><%=bd.getRoomName() %></p>
									<%	String bookState = null;
										switch(bd.getBookState()) {
											case 0: bookState = "이용예정";%>
												<button class="btn bc3 bs5"><%=bookState %></button><br>
													<p class="p-2">
														<%=bd.getCheckIn() %> -
														<%=bd.getCheckOut() %>
													</p>
									</td>
									<!-- 상세보기 -->
									<td class="view-box-td">
										<a class="view-0" href="/bookView.do?bookNo=<%=bd.getBookNo()%>">상세보기></a>
									</td>
									<td class="btn-box-td">
										<input type="button" class="btn bs6 bc3" id="modal-btns-item" value="예약취소" onclick=" location='/bookCancleFirst.do?bookNo=<%=bd.getBookNo()%>'"/>
									</td>	
											<%	break;
											case 1: bookState = "이용완료";
												//리뷰o
												if(bd.getReviewNo() != 0){
											%>
													<button class="btn bc7 bs5"><%=bookState %></button><br>
													<p class="p-2">
														<%=bd.getCheckIn() %> -
														<%=bd.getCheckOut() %>
													</p>
									</td>
									<td class="view-box-td">
										<a class="view-0" href="/bookView.do?bookNo=<%=bd.getBookNo()%>">상세보기></a>
									</td>
									<td class="btn-box-td">
										<a type="button" class="btn bc2 bs6" href="/review.do?memberNo=<%=m.getMemberNo()%>">리뷰보기</a>
									</td>	
											<% 	//리뷰x
												}else{
											%>
													<button class="btn bc10 bs5"><%=bookState %></button><br>
													<p class="p-2">
														<%=bd.getCheckIn() %> -
														<%=bd.getCheckOut() %>
													</p>
									</td>
									<td class="view-box-td">
										<a class="view-0" href="/bookView.do?bookNo=<%=bd.getBookNo()%>">상세보기></a>
									</td>
									<td class="btn-box-td">
										<a type="button" class="btn bc4 bs6" href="/review_writeFrm.do?bookNo=<%=bd.getBookNo()%>">리뷰쓰기</a>
									</td>	
																							
											<% }//예약취소
											break;
											case 2: bookState = "취소완료";
											%>
													<button class="btn bc7 bs5"><%=bookState %></button><br>
													<p class="p-2">
														<%=bd.getCheckIn() %> -
														<%=bd.getCheckOut() %>
													</p>
									</td>
									<td class="view-box-td">
										<a class="view-0" href="/bookView.do?bookNo=<%=bd.getBookNo()%>">상세보기></a>
									</td>
									<td class="btn-box-td">
										<button class="btn bc7 bs6">취소완료</button>
									</td>	
											<%break;
										};//switch문 끝
										list.add(bd); %>
								</tr>
								</table>
								<%if(i == 0) {%>
									<hr class="hr-0">
								<%}%>
								<!--예약취소 modal 시작-->
								<!-- 
								<div id="test-modal" class="modal-bg">
									<div class="modal-wrap">
										<div class="modal-head">
											<h2>예약을 정말로 취소하시겠습니까?</h2>
											<br>
										</div>
										<div class="modal-content">
											<table class="modal-content-tbl">
											<tr>
											<th class="modal-tbl-th">객실정보</th>
											<td class="modal-tbl-td"><%=bd.getBookName() %></td>
											</tr>
											<tr>
											<th class="modal-tbl-th">체크인</th>
											<td class="modal-tbl-td"><%=bd.getCheckIn() %> 15:00</td>
											</tr>
											<tr>
											<th class="modal-tbl-th">체크아웃</th>
											<td class="modal-tbl-td"><%=bd.getCheckOut() %> 11:00</td>
											</tr>
											<tr>
											<th class="modal-tbl-th">예약정보</th>
											<td class="modal-tbl-td">성인 <%=bd.getBookPeople() %>인</td>
											</tr>
											</table>
										</div>
										<div class="modal-foot">
											<p>
											취소 후 다시 예약시 다른 예약이 있는 경우 예약이 불가할 수 있습니다.<br> 카드결제 취소의 경우 취소 후
											영업일 2-3일 내로 처리될 예정입니다.
											</p>
											<div class="modal-btns-container">
												<input type="button" class="btn bc3" id="modal-btns-item" value="예약취소" onclick=" location='/bookCancle.do?bookNo=<%=bd.getBookNo()%>'"/>
												<%System.out.println(bd.getBookNo()); %>
												<button class="btn bc4 modal-close" id="modal-btns-item">돌아가기</button>
											</div>
										</div>
									</div>
								</div>
								 -->
								<!-- 예약취소 modal 끝 -->
								<!-- 모달 내용 끝-->
								<%} %>
							<%}else if(list.size() == 1) {
								BookData bd = list.get(0);%>
								<table class="my_book_tbl">
								<tr>
									<td>
										<img class="img-0" src="/img/<%=bd.getFilePath()%>">
									</td>
									<td>
										<p class="p-0"><%=bd.getRoomName() %></p>
									<%	String bookState = null;
										switch(bd.getBookState()) {
											case 0: bookState = "이용예정";%>
												<button class="btn bc3 bs5"><%=bookState %></button><br>
													<p class="p-2">
														<%=bd.getCheckIn() %> -
														<%=bd.getCheckOut() %>
													</p>
									</td>
									<td class="view-box-td">
										<a class="view-0" href="/bookView.do?bookNo=<%=bd.getBookNo()%>">상세보기></a>
									</td>
									<td class="btn-box-td">
										<input type="button" class="btn bc3 cancleBtn" id="modal-btns-item" value="예약취소" onclick=" location='/bookCancleFirst.do?bookNo=<%=bd.getBookNo()%>&memberId=<%=m.getMemberId() %>'"/>
									</td>	
											<%	break;
											case 1: bookState = "이용완료";
												//리뷰o
												if(bd.getReviewNo() != 0){
											%>
													<button class="btn bc7 bs5"><%=bookState %></button><br>
													<p class="p-2">
														<%=bd.getCheckIn() %> -
														<%=bd.getCheckOut() %>
													</p>
									</td>
									<td class="view-box-td">
										<a class="view-0" href="/bookView.do?bookNo=<%=bd.getBookNo()%>">상세보기></a>
									</td>
									<td class="btn-box-td">
										<a type="button" class="btn bc2 bs6" href="/review.do?memberNo=<%=m.getMemberNo()%>">리뷰보기</a>
									</td>	
											<% 	//리뷰x
												}else{
											%>
													<button class="btn bc10 bs5"><%=bookState %></button><br>
													<p class="p-2">
														<%=bd.getCheckIn() %> -
														<%=bd.getCheckOut() %>
													</p>
									</td>
									<td class="view-box-td">
										<a class="view-0" href="/bookView.do?bookNo=<%=bd.getBookNo()%>">상세보기></a>
									</td>
									<td class="btn-box-td">
										<a type="button" class="btn bc4 bs6" href="/review_writeFrm.do?bookNo=<%=bd.getBookNo()%>">리뷰쓰기</a>
									</td>	
												<%break;											
											 }//예약취소
											case 2: bookState = "취소완료";
											%>
													<button class="btn bc7 bs5"><%=bookState %></button><br>
													<p class="p-2">
														<%=bd.getCheckIn() %> -
														<%=bd.getCheckOut() %>
													</p>
									</td>
									<td  class="view-box-td">
										<a class="view-0" href="/bookView.do?bookNo=<%=bd.getBookNo()%>">상세보기></a>
									</td>
									<td>
										<button class="btn bc7 bs6">취소완료</button>
									</td>	
											<%break;
										}; %>
								</tr>
								</table>
								<!-- 모달내용 시작 -->
								<!--예약취소 modal 시작-->
								<!-- 
								<div id="test-modal" class="modal-bg">
									<div class="modal-wrap">
										<div class="modal-head">
											<h2>예약을 정말로 취소하시겠습니까?</h2><br>
										</div>
										<div class="modal-content">
											<table class="modal-content-tbl">
											<tr>
												<th class="modal-tbl-th">객실정보</th>
												<td class="modal-tbl-td"><%=bd.getRoomName() %></td>
											</tr>
											<tr>
												<th class="modal-tbl-th">체크인</th>
												<td class="modal-tbl-td"><%=bd.getCheckIn() %> 15:00</td>
											</tr>
											<tr>
												<th class="modal-tbl-th">체크아웃</th>
												<td class="modal-tbl-td"><%=bd.getCheckOut() %> 11:00</td>
											</tr>
											<tr>
												<th class="modal-tbl-th">예약정보</th>
												<td class="modal-tbl-td">성인 <%=bd.getBookPeople() %>인</td>
											</tr>
											</table>
										</div>
										<div class="modal-foot">
											<p>
											취소 후 다시 예약시 다른 예약이 있는 경우 예약이 불가할 수 있습니다.<br> 카드결제 취소의 경우 취소 후
											영업일 2-3일 내로 처리될 예정입니다.
											</p>
											<div class="modal-btns-container">
												<input type="button" class="btn bc3 cancleBtn" id="modal-btns-item" value="예약취소" onclick=" location='/bookCancle.do?bookNo=<%=bd.getBookNo()%>&memberId=<%=m.getMemberId() %>'"/>
												<button class="btn bc4 modal-close" id="modal-btns-item">돌아가기</button>
											</div>
										</div>
									</div>
								</div>
								 -->
								<!-- 예약취소 modal 끝 -->
								<!-- 모달 내용 끝-->
							<%}else { %>
								<h3 class="h3-0">최근 예약내역이 없습니다.</h3>
						<%} %>
				<!-- 최근예약내역 끝 -->
					</div><!-- my_book_wrap 끝 -->
					<!-- my_info_tbl 시작 -->
					<div class="mypage-content-title" style="display:flex; justify-content: space-between;"><h4>내 정보</h4><a style="color: #c87431; text-align: right; margin-left: 50px;"  href="/mypage_info.do">수정하기</a></div>
					<table class="my_info_tbl">
						<tr class="tr-1">
							<th class="th-1" style="padding-left:10px;">이메일</th>
							<td class="td-1"><%=m.getMemberId() %></td>
						</tr>
						<tr class="tr-1">
							<th class="th-1" style="padding-left:10px;">닉네임</th>
							<td class="td-1"><%=m.getMemberNick() %></td>
						</tr>	
						<tr class="tr-1">
							<th class="th-1" style="padding-left:10px;">비밀번호</th>
							<td class="td-1">
							<!-- 비밀번호 마스킹처리 -->
							<% int pwCount = (m.getMemberPw()).length();%>
							<% for(int i=0;i<pwCount;i++){%>
								*
							<% }%>
							<!-- 비밀번호 마스킹처리 끝 -->
							</td>
						</tr>
						<tr class="tr-1">
							<th class="th-1" style="padding-left:10px;">휴대폰번호</th>
							<td class="td-1"><%=m.getMemberPhone() %></td>
						</tr>
					</table><!-- my_info_tbl 끝 -->
			</div><!-- mypage-content 끝  -->
		</div><!-- flex-wrap 끝  -->
	</div><!-- page-content 끝  -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>