<%@page import="java.util.ArrayList"%>
<%@page import="com.herejava.member.vo.Member"%>
<%@page import="com.herejava.book.vo.BookData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<BookData> list = (ArrayList<BookData>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 회원 페이지 ::</title>
<style>
	.mypage-content{
		min-height: 800px;
	}
	.th-1{
		text-align: left;
		padding: 10px 20px;
	}
	.td-1{
		text-align: left;
		padding: 5px 10px;
	}
	.tr-1>*{
		text-align: left;
	}
	.p-1{
		text-align: right;
		text-decoration : underline;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@ include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
			
				<!-- 최근예약내역 시작 -->	
				<div class="mypage-content-title">최근 예약내역</div>
					 <% if(list.size() == 2) {
							for(int i=0;i<2;i++) {
								BookData bd = list.get(i);%>
								<span><%=bd.getFilePath() %></span>
								<span><h4><%=bd.getRoomName() %></h4></span>
								<span><%=bd.getCheckIn() %></span>
								<span><%=bd.getCheckOut() %></span>
								<span><%=bd.getBookState() %></span>
								<span><%=list.add(bd) %>
								<span><a href="/bookView.do?bookNo=30">상세보기></a></span>
								<button class="btn bc3 modal-open-btn" target="#test-modal">
									예약취소</button>
								<hr>
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
									<td class="modal-tbl-td"><%=bd.getBookPeople() %></td>
									</tr>
									</table>
									</div>
									<div class="modal-foot">
									<p>
									취소 후 다시 예약시 다른 예약이 있는 경우 예약이 불가할 수 있습니다.<br> 카드결제 취소의 경우 취소 후
									영업일 2-3일 내로 처리될 예정입니다.
									</p>
									<div class="modal-btns-container">
									<button class="btn bc3" id="modal-btns-item">예약취소</button>
									<button class="btn bc4 modal-close" id="modal-btns-item">돌아가기</button>
									</div>
									</div>
									</div>
									</div>
								</div>
								<!-- 예약취소 modal 끝 -->
								<!-- 모달 내용 끝-->
								<%} %>
							<%}else if(list.size() == 1) {
								BookData bd = list.get(0);%>
								<span><%=bd.getFilePath() %></span>
								<span><h4><%=bd.getRoomName() %></h4></span>
								<span><%=bd.getCheckIn() %></span>
								<span><%=bd.getCheckOut() %></span>
								<span><%=bd.getBookState() %></span>
								<span><%=list.add(bd) %>
								<span><a href="/bookView.do?bookNo=3">상세보기></a></span>
								<button class="btn bc3 modal-open-btn" target="#test-modal">
									예약취소</button>
								<hr>
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
									<button class="btn bc3" id="modal-btns-item">예약취소</button>
									<button class="btn bc4 modal-close" id="modal-btns-item">돌아가기</button>
									</div>
									</div>
									</div>
									</div>
								</div>
								<!-- 예약취소 modal 끝 -->
								<!-- 모달 내용 끝-->
							<%}else { %>
								<p>최근 예약내역이 없습니다.</p>
						<%} %>
				<!-- 최근예약내역 끝 -->
				
				<!-- 내정보 시작 -->
				<div class="mypage-content-title">
					내 정보 <p class="p-1">수정하기></p>
				</div>
				
				<table class="my_info_tbl">
					<tr class="tr-1">
						<th class="th-1">이메일</th>
						<td class="td-1"><%=m.getMemberId() %></td>
					</tr>
					<tr class="tr-1">
						<th class="th-1">닉네임</th>
						<td class="td-1"><%=m.getMemberNick() %></td>
					</tr>	
						<th class="th-1">비밀번호</th>
						<td class="td-1"><%=m.getMemberPw() %></td>
					<tr class="tr-1">	
						<th class="th-1">휴대폰번호</th>
						<td class="td-1"><%=m.getMemberPhone() %></td>
					</tr>
				</table>
				<!-- 내정보 끝 -->
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>