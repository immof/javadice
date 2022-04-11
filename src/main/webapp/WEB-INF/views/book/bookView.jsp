<%@page import="oracle.net.aso.r"%>
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
								<td>사진</td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">객실정보</th>
								<td class="td-1"><%=bd.getRoomName() %></td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">체크인</th>
								<td class="td-1"><%=bd.getRoomName() %> 15:00</td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">체크아웃</th>
								<td class="td-1"><%=bd.getRoomName() %> 15:00 11:00</td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">예약정보</th>
								<td class="td-1">성인 <%=bd.getRoomName() %>명</td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">예약자명</th>
								<td class="td-1"><%=bd.getRoomName() %></td>
							</tr>
							<tr class="tr-1">
								<th class="th-1">전화번호</th>
								<td class="td-1"><%=bd.getRoomName() %></td>
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
						<button>예약취소</button>
					</div>
				</div>
			</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>