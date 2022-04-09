<%@page import="com.herejava.book.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	Book b = (Book)request.getAttribute("b");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/src/main/webapp/js/jquery-3.6.0.js"></script>
<!-- 기본 CSS -->
<link rel="stylesheet" href="/src/main/webapp/css/default.css" />
<link rel="stylesheet" href="/src/main/webapp/css/sweetalert2.min.css" />
<!-- 기본 js -->
<script src="/src/main/webapp/js/default.js"></script>
<script src="/src/main/webapp/js/sweetalert2.all.min.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
	
		<!-- 예약취소 button시작 -->
		<div>
			<button class="btn bc3 modal-open-btn" target="#test-modal">
			예약취소</button>
		</div>
		<!-- 예약취소 button끝 -->
		
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
							<td class="modal-tbl-td">로얄스위트</td>
						</tr>
						<tr>
							<th class="modal-tbl-th">체크인</th>
							<td class="modal-tbl-td"><%=b.getCheckIn() %> 15:00</td>
						</tr>
						<tr>
							<th class="modal-tbl-th">체크아웃</th>
							<td class="modal-tbl-td"><%=b.getCheckOut() %> 11:00</td>
						</tr>
						<tr>
							<th class="modal-tbl-th">예약정보</th>
							<td class="modal-tbl-td">성인 <%=b.getBookPeople() %></td>
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
						<button class="btn bc4 modal-close" id="modal-btns-item" target="#">돌아가기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 예약취소 modal 끝 -->
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>