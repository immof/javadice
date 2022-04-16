<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.book.vo.BookData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<BookData> list = (ArrayList<BookData>) request.getAttribute("list");
	String pageNavi = (String) request.getAttribute("pageNavi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 예약내역 ::</title>
<style>
		.notice-tbl a:hover {
			text-decoration: underline;
		}
		
		.notice-tbl tr {
			border-bottom: 1px solid #ccc;
		}
		
		.notice-tbl tr>th:first-child {
			width: 10%;
		}
		
		.notice-tbl tr>th:nth-child(2) {
			width: 45%;
		}
		
		.notice-tbl tr>td:nth-child(2) {
			text-align: left;
		}
		
		.notice-tbl tr>th:nth-child(3) {
			width: 15%;
		}
		
		.notice-tbl tr>th:nth-child(4) {
			width: 20%;
		}
		
		.notice-tbl tr>th:nth-child(5) {
			width: 10%;
		}
		
		#pageNavi {
			margin: 30px;
		}
		.hr-0{
			color: #ac9e89;
		}
		.p-0{
			text-align: center;
			font-size: 18px;
			font-weight: bold;
			padding: 45px 0px;
		}
		.test-modal{
			top: 0px;
			left: 0px;
		}
		.my_book_list_tbl tr>th:nth-child(1){
			width: 25%;
		} 
		.my_book_list_tbl tr>th:nth-child(2){
			width: 18%;
		}
		.my_book_list_tbl tr>th:nth-child(3){
			width: 24%;
		}
		.my_book_list_tbl tr>th:nth-child(4){
			width: 16%;
		}
		.my_book_list_tbl tr>th:nth-child(5){
			width: 17%;
		}
		#my_book_list_tbl tr>td:nth-child(1){
			width: 25%;
		} 
		#my_book_list_tbl tr>td:nth-child(2){
			width: 18%;
		}
		#my_book_list_tbl tr>td:nth-child(3){
			width: 24%;
		}
		#my_book_list_tbl tr>td:nth-child(4){
			width: 16%;
		}
		#my_book_list_tbl tr>td:nth-child(5){
			width: 17%;
		}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="flex-wrap">
			<%@ include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<!-- 내 예약내역 제목+헤더 -->
				<div class="mypage-content-title">내 예약내역</div>
				<table class="tbl my_book_list_tbl">
					<tr class="tr-1 tr-head">
						<th>객실정보</th>
						<th>객실타입</th>
						<th>이용날짜</th>
						<th>예약상태</th>
						<th>리뷰작성</th>
					</tr>
				</table>
				<hr class="hr-0">
				<!-- 내 예약내역 제목+헤더 -->
				
					<%
					//예약이 1개이상 존재하는 경우
					if(list.size()>0){
						for (BookData bd : list) {
						%>
						<!-- 예약리스트 시작 -->
						<table class="tbl tbl-hover my_book_tbl" id="my_book_list_tbl">
							<tr>
								<td>
									<a href="/bookView.do?bookNo=<%=bd.getBookNo() %>"><img class="img-0" src="/img/<%=bd.getFilePath()%>"></a>
								</td>
								<td>
									<a href="/bookView.do?bookNo=<%=bd.getBookNo() %>"><p class="p-0"><%=bd.getRoomName() %></p></a>
								</td>
								<%	String bookState = null;
									switch(bd.getBookState()) {
										case 0: bookState = "이용예정";%>
											<td>
												<p class="p-2">
													<%=bd.getCheckIn() %> -
													<%=bd.getCheckOut() %>
												</p>
											</td>
											<td><%=bookState %></td>
												<td><input type="button" class="btn bs6 bc3" id="modal-btns-item" value="예약취소" onclick=" location='/bookCancleFirst.do?bookNo=<%=bd.getBookNo()%>'"/></td>	
											<%	break;
											case 1: bookState = "이용완료";
												//리뷰o
												if(bd.getReviewNo() != 0){
											%>
													<td>
														<p class="p-2">
															<%=bd.getCheckIn() %> -
															<%=bd.getCheckOut() %>
														</p>
													</td>
													<td><%=bookState %></td>
													<td>
														<a class="btn bc2 bs6" href="/review.do?memberNo=<%=m.getMemberNo()%>">리뷰보기</a>
													</td>	

											<% 	//리뷰x
												}else{
											%>
													<td>
													<p class="p-2">
														<%=bd.getCheckIn() %> -
														<%=bd.getCheckOut() %>
													</p>
													</td>
													<td><%=bookState %></td>
													<td><a class="btn bc4 bs6" href="/review_writeFrm.do?bookNo=<%=bd.getBookNo()%>">리뷰쓰기</a></td>	
												<%										
											 };//예약취소
											 break;
											case 2: bookState = "취소완료";
											%>
													<td>
													<p class="p-2">
														<%=bd.getCheckIn() %> -
														<%=bd.getCheckOut() %>
													</p>
													</td>
													<td><%=bookState %></td>
													<td><button class="btn bc7 bs6">취소완료</button></td>	
											<%break;
										};//switch문 끝  %>
								</tr>
						</table>
			<!-- 모달내용 시작 -->
								<!--예약취소 modal 시작-->
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
									<br>
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
									<td class="modal-tbl-td">성인<%=bd.getBookPeople() %></td>
									</tr>
									</table>
									</div>
									<div class="modal-foot">
									<p>
									취소 후 다시 예약시 다른 예약이 있는 경우 예약이 불가할 수 있습니다.<br> 카드결제 취소의 경우 취소 후
									영업일 2-3일 내로 처리될 예정입니다.
									</p>
									<div class="modal-btns-container">
									<input type="button" class="btn bc3" id="modal-btns-item" value="예약취소" onclick=" location='/bookCancle.do?bookNo=<%=bd.getBookNo()%>&memberId=<%=m.getMemberId() %>'"/>
									<button class="btn bc4 modal-close" id="modal-btns-item">돌아가기</button>
									</div>
									</div>
									</div>
									</div>
								<!-- 예약취소 modal 끝 -->
								<!-- 모달 내용 끝-->
							<%
							}//for문 끝
							//예약이 없는 경우
							}else {
						%>
						<p class="p-0">예약내역이 없습니다.</p>
						<%}; %>
				
				<div id="pageNavi"><%=pageNavi%></div>
			</div><!-- mypage-content 끝  -->
		</div><!-- flex-wrap 끝  -->
	</div><!-- page-content 끝  -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>