<%@page import="java.text.DecimalFormat"%>
<%@page import="com.herejava.pay.vo.Pay"%>
<%@page import="com.herejava.book.vo.BookData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	BookData bd = (BookData)request.getAttribute("bd");
    	Pay pay = (Pay)request.getAttribute("pay");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
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
	.img-1{
		padding-top: 20px;
		width: 450px;
		height: 300px;
	}
	.pay-1{
		font-weight: bold;
		color: rgb(221, 78, 34);
		font-size: 18px;
	}
	.my_pay_tbl{
		padding-bottom: 60px;
	}
	#hr-0{
		margin: 22px 0px;
		border-bottom: solid 1px #ac9e89;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class="page-content">
			<div class="flex-wrap">
				<%@ include file="/WEB-INF/views/admin/mypage_admin.jsp"%>
				<div class="mypage-content">
					<div class="mypage-content-title">내 예약</div>
							<tr class="tr-1">
								<td><img class="img-1" src="/img/<%=bd.getFilePath()%>"></td>
							</tr>
						<table class="my_info_tbl">
						
							<tr class="tr-1">
								<th class="th-1">예약번호</th>
								<td class="td-1"><%=bd.getBookNo() %></td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">객실정보</th>
								<td class="td-1"><%=bd.getRoomName() %></td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">체크인</th>
								<td class="td-1"><%=bd.getCheckIn() %>  15:00</td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">체크아웃</th>
								<td class="td-1"><%=bd.getCheckOut() %>  12:00</td>
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
						<hr id="hr-0"  />
						
						<table class="my_pay_tbl">
							<tr>
								<th class="th-1">결제정보</th>
							</tr>
							<tr>
								<th class="th-1">최종 결제금액</th>
								<%if(pay == null){ %>
								<td class="td-1 pay-1">0 원</td>
								<%}else{ 
									DecimalFormat decFormat = new DecimalFormat("###,###");
									String usePoint = decFormat.format(pay.getUsePoint());
									String payAmount = decFormat.format(pay.getPayAmount());
								%>
								<td class="td-1 pay-1"><%=payAmount %> 원</td>
								<%} %>
								<%if(bd.getBookState()==0) {%>
								<td class="td-1"><button class="btn bc3 bs6 modal-open-btn" id="modal-btn-1" target="#test-modal">예약취소</button></td>
								<%} %>
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
								</div>
								<!-- 예약취소 modal 끝 -->
								<!-- 모달 내용 끝-->
					</div>
				</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>