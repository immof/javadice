<%@page import="com.herejava.book.vo.BookPayData"%>
<%@page import="com.herejava.book.vo.BookPay"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	BookPay bpay = (BookPay)request.getAttribute("bpay");
 	BookPayData bpd = (BookPayData)request.getAttribute("bpd");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<style>
	/* index */
	.index-wrap{
			width: 565px;
			padding-top: 20px;
			padding-bottom: 80px;
			margin: 0 auto;
	}
	.index{
		display: flex;
	}
	.index>li{
		margin-right: 30px;
	}
	.index>li>span{
		display: inline-block;
		background-color: rgb(224, 224, 224);
		width: 30px;
		height: 30px;
		line-height: 30px;
		text-align: center;
		border-radius: 15px;
		margin-right: 5px;
	}
	.index>.selected>span{
		background-color: rgb(172, 158, 137);
	}
	/*info*/
	.info-title{
		margin: 20px 0;
	}
	.info-title>p{
		font-size: 22px;
		font-weight: bold;
		text-align: center;
	}
	
	.info-content-wrap{
	
	}
	.info-content{
		box-sizing: border-box;
		width: 650px;
		height: 500px;
		margin: 100px auto;
		padding: 50px ;
		padding-left: 140px;
		font-size: 20px;
		text-align: left;
		border: 1px solid #555555;
		margin-bottom: 50px;
	}
	
	.mainBtn{
		text-align:center;
		margin-bottom: 150px;
	}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="page-content">
		<div class="belt"></div>
		<div class="index-wrap">
			<ul class= "index">
				<li>───<span>1</span>객실 선택</li>
				<li >───<span>2</span>예약 정보 입력</li>
				<li class="selected">───<span>3</span>결제완료</li>
			</ul>
		</div>
		<div class="info-title">
			<p>결제가 완료되었습니다.</p>
			<p>믿음에 보답하는 여기서 JAVA호텔이 되겠습니다.</p>
		</div>
		<div class= "info-content-Wrap">
			<table class="info-content">
			<tr class="tr-1">
				<th>객실 정보</th>
					<td><%=bpay.getRoomName() %> </td>
				</tr>
				<tr class="tr-1">
					<th>체크인</th>
					<td><%=bpay.getCheckIn() %> 15:00 </td>
				</tr>
				<tr class="tr-1">
					<th>체크아웃</th>
					<td><%=bpay.getCheckOut() %> 11:00 </td>
				</tr>
				<tr class="tr-1">
					<th>예약인원</th>
					<td>인원 <%=bpay.getBookPeople() %>명 </td>
				</tr>
				<tr class="tr-1">
					<th>예약자명</th>
					<td><%=bpay.getBookName()%> </td>
				</tr>
				<tr class="tr-1">
					<th>전화번호</th>
					<td><%=bpay.getBookPhone() %></td>
				</tr>
				<tr class="tr-1">
					<th>예약번호</th>
					<td><%=bpd.getBookNo() %></td>
				</tr>
			</table>
		</div>
		<div class="mainBtn">
			<a href="/" class="btn bc2" style="width:250px;"> 메인으로 돌아가기 </a>
		</div>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>