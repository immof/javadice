<<<<<<< HEAD

=======
>>>>>>> branch 'master' of https://github.com/Pyseon/javadice.git
<%@page import="com.herejava.book.vo.BookData"%>
<%@page import="com.herejava.room.vo.Room"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	BookData bd = (BookData)request.getAttribute("bd");
    	Room r = (Room)request.getAttribute("r");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class="page-content">
			<div class="flex-wrap">
				<%@ include file="/WEB-INF/views/member/mypage_common.jsp"%>
				<div class="mypage-content">
					<div class="mypage-content-title">내 예약</div>
						<table class="my_info_tbl">
							<tr class="tr-1">
								<td><img src="/img/<%=bd.getFilePath()%>"/></td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">객실정보</th>
								<td class="td-1"><%=bd.getRoomName() %></td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">체크인</th>
								<td class="td-1"><%=bd.getCheckIn() %> 15:00</td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">체크아웃</th>
								<td class="td-1"><%=bd.getCheckOut() %> 15:00 11:00</td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">예약정보</th>
								<td class="td-1">성인 <%=bd.getBookPeople() %>명</td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">예약자명</th>
								<td class="td-1"><%=bd.getBookName() %></td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">전화번호</th>
								<td class="td-1"><%=bd.getBookPhone() %></td>
							</tr>
						</table>
						<hr  />
						
						<table>
							<tr>
								<th class="th-1">결제정보</th>
							</tr>
							<tr>
								<th class="th-1">총 결제금액</th>
								<td class="td-1">xxxxx 원</td>
							</tr>
						</table>
						<button class="btn bc3 modal-open-btn" target="#test-modal">예약취소</button>
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
					</div>
				</div>
			</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>