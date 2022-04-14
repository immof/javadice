<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String roomName = "로열스위트";
    	int roomCapacity = 7;
    	int bookPeople = 3;
    	int payStayDay = 3;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 입력</title>
<link rel="stylesheet" href="/css/bookInfoInput.css">
<style>
	
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="page-content">
		<div class="belt"></div>
		<div class="index-wrap">
			<ul class= "index">
				<li>───<span>1</span>객실 선택</li>
				<li class="selected">───<span>2</span>예약 정보 입력</li>
				<li>───<span>3</span>결제완료</li>
			</ul>
		</div>
		<div class="img-wrap">
			<div class="roomImg">
                <img src="/img/2_Room.jpg">
            </div>
            <div class="imgInfo">
                <div><%=roomName %></div>
                <div>최대 인원: <%=roomCapacity %>명</div>
            </div>
		</div>
		<div class="info-wrap">
            <div class="info-title">예약자 정보</div>
            <form>
                <div class="info-content">
                    <div class="info-left">
                        <p>예약자 이름</p>
                        <%if(m!=null) {%>
                        <input type="text" id="bookName" value="<%=m.getMemberName() %>" placeholder="예약자 이름" required>
                        <%}else{ %>
                        <input type="text" id="bookName" placeholder="이름 입력" required>
                        <%} %>
                        
                        <p>인원</p>
                        <input type="number" id="bookPeople"  value="<%=bookPeople %>" min="1" max="<%=roomCapacity %>" style="text-align:right;" required>
                        
                        <p>예약자 전화번호 유효성검사추가</p>
                        <%if(m!=null) { %>
                        <input type="text" id="bookPhone" value="<%=m.getMemberPhone() %>" required>
                        <%}else{ %>
                        <input type="text" id="bookPhone" placeholder="ex)010-1234-1234"  required>
                        <%} %>
                        <p>적립금</p>
                        <%if(m!=null) { %>
                        <input type="number" id="usePoint" placeholder="<%=m.getMemberPoint() %>point 사용가능">
                        <%}else{ %>
                        <input type="number" id="usePoint" disabled>
                        <%} %>
                    </div>
                    <div class="info-right" >
                        <p>객실요금</p>
                        <li style="list-style-type: initial;">getRoomName (getPayStayday박)</li>
                        <input type="hidden" id="payStayDay" value="getPayStayday">
                        <p>적립금</p>
                        <span>-</span>
                        <span>point</span>
                        <span>getRoomPrice KRW * getPayStayday</span>
                        <div class="totalPrice">
                            <span>총 요금</span>
                            <span>getRoomPrice KRW * getPayStayday KRW(setPayAmount)</span>
                            <input type="hidden" id="payAmount" value="getRoomPrice*getPayStayday">
                        </div>
                    </div>
                </div>
                <button class="btn bc1" id="payBtn">결제하기</button> 
            </form>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>