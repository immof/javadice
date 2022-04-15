<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	DecimalFormat formatter = new DecimalFormat("###,###");
    
    	String roomName = "로열스위트";
    	int roomCapacity = 7;
    	int bookPeople = 3;
    	int payStayDay = 3;
    	int roomPrice = 100000000;
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 입력</title>
<!-- 결제 API 사용을 위한 라이브러리 경로 추가 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	
	/* content - img*/
	.img-wrap{
		margin:0 auto;
		margin-bottom: 80px;
	}
	.img-wrap>.roomImg{
		text-align: center;
	}
	.img-wrap>.roomImg>img{
		width: 950px;
		height: 550px;
	
	}
	.img-wrap>.imgInfo{
		margin-top: 20px;
		text-align: center;
	}
	.img-wrap>.imgInfo>div:first-child{
		font-size: 30px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	.img-wrap>.imgInfo>div:last-child{
		font-size: 17px;
	}	

	
	/* content - 예약자 정보*/
	
	.info-wrap{
		margin: 0 auto;
		width: 950px;
		
	}
	.info-title{
		font-size: 22px;
		font-weight: bold;
		margin-bottom: 20px;
	}
	.info-content{
		margin: 0;
		height: 400px;
		border: 0.3px solid #555;
		padding: 40px 35px;
	}
	.info-content>div{
		float: left;
	}
	.info-left>label,.info-left>input{
		display: block;
	}
	
	.info-left{
		padding: 40px;
		padding-top: 10px;
	}
	.info-left>p{
		font-size: 19px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	.info-left>input{
		width: 270px;
		height: 30px;
		margin-bottom: 20px;
		padding-left: 10px;
		font-size: 17px;
	}
	.box{
		overflow:hidden;
	}
	#bookPeople,#usePoint{
		width: 100px;
		height: 30px;
		margin-right:0;
		margin-bottom: 20px;
		float:left;
	}
	#usePoint{
		width: 270px;
	}
	.box>span{
		margin:0 5px;
		font-size: 17px;
		
	}
	
	#payBtn{
		font-size: 22px;
		margin-top: 40px;
		margin-left: 275px;
		width: 400px;
	}
	
	/* 예약자정보 - info-right*/
	
	.info-right{
		background-color: #F9F9F9;
		box-sizing: border-box;
		width: 470px;	
		padding: 37px;
	}
	.info-right>.title{
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	.info-right>.content{
		font-size: 20px;
		margin-bottom: 20px;
	}
	#sub-title{
		font-size: 14px;
		margin-bottom: 20px;
		padding-left: 10px;
	}
	#totalPrice{
		text-align: right;
		font-size: 20px;
	}
	.point{
		text-align: right;
		font-size: 20px;
	}
	
	.payAmount{
		overflow: hidden;
		margin-top: 30px;
	}
	.payAmount>.title{
		font-size: 25px;
		font-weight: bold;
		float:left;
		margin-top: 6px;
	}
	.payAmount>.content{
		font-size: 30px;
		font-weight: bold;
		float:right;
	}
	
	/*rule*/
	.rule-wrap{
		width: 950px;
		margin:0 auto;
		margin-top: 130px;
		margin-bottom: 150px;
	}
	.rule-wrap .title{
		font-size: 22px;
		font-weight: bold;
		margin: 15px 0;
	}
	.rule-wrap>.price{
		padding-bottom: 30px;
		border-bottom: 1px solid #dcdcdc;
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
                        <div class="box">
	                        <input type="number" id="bookPeople"  value="<%=bookPeople %>" min="1" max="<%=roomCapacity %>" style="text-align:right;" required><span>명</span>
                        </div>
                        
                        <p>예약자 전화번호</p>
                        <%if(m!=null) { %>
                        <input type="text" id="bookPhone" placeholder="ex) 010-0000-0000" value="<%=m.getMemberPhone() %>" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
                        <%}else{ %>
                        	<input type="text" id="bookPhone" placeholder="ex) 010-0000-0000" pattern="010-[0-9]{4}-[0-9]{4}" required>
                        <%} %>
                        <p>적립금</p>
                        <div class="box">
                        <%if(m!=null) { %>
	                        <input type="number" id="usePoint" placeholder="<%=m.getMemberPoint() %>p 사용가능" style="text-align:right;"><span>point</span>
	                        <%}else{ %>
	                        	<input type="number" id="usePoint" value="0" style="text-align:right;" disabled><span>point</span>
	                        <%} %>
                         </div>
                    </div>
                        <%
                        String stringPrice = formatter.format(roomPrice);
                       	String stringPayAmount = formatter.format(roomPrice*payStayDay);
                       	String stringtotalPrice = formatter.format(roomPrice*payStayDay);
                        %>
                    <div class="info-right" >
                        <p class="title">객실요금</p>
                        <pre class="content" id="sub-title" style="list-style-type: initial;"> -  <%=roomName %> (<%=payStayDay %>박) = <%=stringPrice %> 원 * <%=payStayDay %> 박</pre>
                        <input type="hidden" id="payStayDay" value="<%=payStayDay %>">
                        <p  class="content" id="totalPrice" ><%=stringtotalPrice %> 원</p>
                        <input type="hidden" value="<%=roomPrice%>">
                        <p class="title">적립금 사용</p>
                        <%
                        %>
                        <%if(m!=null) {%>
                        	<p class="content point"  id="point"></p>
                        <%}else {%>
	                        <p class="content point" >0 원</p>
                        <%} %>
                        <hr>
                        <div class="payAmount">
                            <span class="title">총 요금</span>
                            <span class="content" ><%=stringPayAmount%> 원</span>
                            <input type="hidden" id="payAmount" value="<%=roomPrice*payStayDay%>">
                        </div>
                    </div>
                </div>
                <button class="btn bc1" id="payBtn">결제하기</button> 
            </form>
		</div>
		<div class="rule-wrap">
			<div class="price">
				<p class="title">요금 정책</p>
				<p class="content">모든 회원은 결제 금액의 10% 포인트가 적립됩니다.</p>
				<p class="content">상기 요금에 조식은 포함되어 있지 않습니다.</p>
				<p class="content">한강 조망 (리버뷰) 및 전망 욕실은 추가요금이 발생 되며, 예약 희망 시 유선 문의 또는 추가요청 기재 부탁드립니다.</p>
			</div>
			<div class="cancle">
				<p class="title">취소 규정</p>
				<p class="content">예약 취소 및 변경은 체크인 하루 전 24:00(한국시간)까지 가능합니다.</p>
				<p class="content">예약하신 일자에 체크인 되지 않거나 또는 위의 지정 시간 이후에 예약을 취소했을 경우에는 예약 사항에 대해 노-쇼 (No Show) 처리 되며,</p>
				<p class="content">이에 따른 위약금으로 예약 첫날에 해당하는 1박 객실요금이 청구되오니 유의하시기 바랍니다.</p>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
		$(document).ready(function(){
			$("#point").text('0 원');
		});
		$("#usePoint").keyup(function(){
			let usePoint = $(this).val();
			usePoint = usePoint.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#point").text('-   '+usePoint+' 원');
		});
		
		$("#payment").on("click",function(){
			const price = $("#totalPrice").text();
			
			//거래 고유ID생성을 위해 현재 결제 날짜를 이용해서 처리
			const d = new Date();
			//""(공백)을 넣어주는 이유 : date값 생성시 ""를 더하지 않으면 숫자+연산이 되므로 문자덧셈을 위해 추가
			const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			IMP.init("imp32461786");	//결제 API사용을 위한 가맹점식별코드 입력
			//IMP.request_pay({결제정보},function(rsp){처리할 함수})
			IMP.request_pay({
				merchant_uid : "상품코드_"+date,		//거래 ID
				name : "결제 테스트",					//결제이름
				amount : price,						//결제금액
				buyer_email : "gddbwls@naver.com",	//구매자 email주소
				buyer_name : "구매자",				//구매자 이름
				buyer_tel : "010-1234-1234",		//구매자 전화번호
				buyer_addr : "서울시 영등포구 당산동",		//rnaowk wnth
				buyer_postcode : "12345"			//구매자 우편번호
				
			},function(rsp){
				if(rsp.success){
					console.log("결제가 완료됐습니다.");
					console.log("고유ID : " + rsp.imp_uid);
					console.log("상점거래ID : "+rsp.merchant_uid);
					console.log("결제금액 : "+rsp.paid_amount);
					console.log("카드승인번호 : " +rsp.apply_num);
					//추가 DB작업이 필요한경우 이 부분에 결제내역을 DB에 저장하는 코드 작성
					//여기서 서블릿으로 보낸다..?그럼 데이터들은 하나하나 제이쿼리로 받아와야되나요?
				}else{
					alert("에러내용 : "+rsp.err_msg);
				}
			});		
	</script>
</body>
</html>