<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	DecimalFormat formatter = new DecimalFormat("###,###");
    
    	int roomNo = (int)request.getAttribute("roomNo");
		int roomPrice = (int)(request.getAttribute("roomPrice"));
		int roomCapacity = (int)(request.getAttribute("roomCapacity"));
		int bookPeople = (int)(request.getAttribute("bookPeople"));
		String checkIn = (String)request.getAttribute("checkIn");
		String checkOut = (String)request.getAttribute("checkOut");
		int payStayDay = (int)(request.getAttribute("payStayDay"));
		String roomName = (String)request.getAttribute("roomName");
		
		
    	
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
		padding-left: 10px;
		font-size: 17px;
		margin-bottom:3px;
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
                        <pre class="chk" id="nameChk" style="font-size: 15px;">   </pre>
                        <%}else{ %>
                        	<input type="text" id="bookName" placeholder="이름 입력" required>
                        	<pre class="chk" id="nameChk" style="font-size: 15px;">    </pre>
                        <%} %>
                        
                        <p>인원</p>
                        <div class="box">
	                        <input type="number" id="bookPeople"  value="<%=bookPeople %>" min="1" max="<%=roomCapacity %>" style="text-align:right;" readonly><span>명</span>
                        </div>
                        
                        <p>예약자 전화번호</p>
                        <%if(m!=null) { %>
                        <input type="text" id="bookPhone" placeholder="ex) 010-0000-0000" value="<%=m.getMemberPhone() %>" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
                        <pre class="chk" id="phoneChk"  style="font-size: 15px;">   </pre>
                        <%}else{ %>
                        	<input type="text" id="bookPhone" placeholder="ex) 010-0000-0000" pattern="010-[0-9]{4}-[0-9]{4}" required>
                        	<pre class="chk" id="phoneChk"  style="font-size: 15px;"> </pre>
                        <%} %>
                        <p>적립금</p>
                        <div class="box">
                        <%if(m!=null) { %>
	                        <input type="number" id="usePoint" placeholder="<%=m.getMemberPoint() %>p 사용가능" style="text-align:right;"><span>point</span>
	                        <pre class="chk" id="pointChk"  style="font-size: 15px;">   </pre>
	                        <%}else{ %>
	                        	<input type="number" id="usePoint" value="0" style="text-align:right;" disabled><span>point</span>
	                        <%} %>
                         </div>
                    </div>
                        <%
                        String stringPrice = formatter.format(roomPrice);
                       	String stringtotalPrice = formatter.format(roomPrice*payStayDay);
                        %>
                    <div class="info-right" >
                        <p class="title">객실요금</p>
                        <pre class="content" id="sub-title" style="list-style-type: initial;"> -  <%=roomName %> (<%=payStayDay %>박) = <%=stringPrice %> 원 * <%=payStayDay %> 박</pre>
                        <input type="hidden" id="totalPrice" value="<%= roomPrice*payStayDay%>">
                        <p  class="content" id="totalPrice" ><%=stringtotalPrice %> 원</p>
                        <p class="title">적립금 사용</p>
                        <%if(m!=null) {%>
                        	<p class="content point"  id="point"></p>
                        <%}else {%>
	                        <p class="content point" >0 원</p>
                        <%} %>
                        <hr>
                        <div class="payAmount">
                            <span class="title">총 요금</span>
                            <span class="content" id="payAmount"></span>
                        </div>
                    </div>
                </div>
                
                
                <%if(m !=null) {%>
                <input type="hidden" id="memberNo" value="<%=m.getMemberNo()%>">
				<%}else {%>
				<input type="hidden" id="memberNo" value="0">
				<%} %>   
				<%if(m !=null) {%>
                <input type="hidden" id="memberPoint" value="<%=m.getMemberPoint()%>">
				<%}else {%>
				<input type="hidden" id="memberPoint" value="0">
				<%} %>   
				<input type="hidden" id="roomNo" value="<%=roomNo%>">
				<input type="hidden" id="roomCapacity" value="<%=roomCapacity%>">        
				 
				     
                <input type="hidden" id="payAmount" value="<%=roomPrice*payStayDay%>">
                <input type="hidden" id="payRoomPrice" value="<%=roomPrice%>">
                <input type="hidden" id="payStayDay" value="<%=payStayDay %>">
                <div class="btn bc1" id="paymentBtn">결제하기</div> 
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
		
		const checkArr = [false,false,false];
		
		//point입력시 오른쪽 box에 사용 포인트 자동으로 입력(천단위로 콤마)해주게 하는 코드 
		$(document).ready(function(){
			$("#point").text('0 원');
		});
		$(document).ready(function(){
			let totalPrice = $("#totalPrice").val();
			totalPrice = totalPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#payAmount").text(totalPrice+' 원');
		});
		
		$("#usePoint").keyup(function(){
			const memberPoint = $("#memberPoint").val();
			const usePoint = $(this).val();
			const totalPrice = $("#totalPrice").val();
			
			let payAmount = totalPrice-usePoint;
			
			usePointString = usePoint.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$("#point").text('-   '+usePointString+' 원');
			$("#payAmount").text(payAmount+' 원');
			
			if(usePoint>memberPoint || usePoint>totalPrice){
            	$("#pointChk").text("사용 가능한 포인트를 초과하였습니다.");
            	$("#pointChk").css("color","red");
            }else{
            	checkArr[2]=true;
            }
			
		});
		//총 금액
		
		//유효성검사
		//이름
		$("#bookName").keyup(function(){
			//1. 정규표현식 변수생성
			const nameReg = /^[가-힣]{2,6}$/;
			const name = $("#bookName").val();
			console.log(name);
			if(!nameReg.test(name) || name == ""){
				//정규표현식에 만족하지 않는 경우
				$("#nameChk").text("이름은 2~6 글자의 한글만 입력가능합니다. ");
				$("#nameChk").css("color","red");
			}else{
				$("#nameChk").text("사용할 수 있는 이름입니다.");
				$("#nameChk").css("color","green");
				checkArr[0] = true;
			}
		});
		//휴대폰
		$("#bookPhone").keyup(function(){
			//1. 정규표현식 변수생성
			const phoneReg  = /^010-?([0-9]{4})-?([0-9]{4})$/;
			const phone = $("#bookPhone").val();
			if(!phoneReg.test(phone) || phone == ""){
				//정규표현식에 만족하지 않는 경우
				$("#phoneChk").text("연락처 형식을 맞춰주세요 010-XXXX-XXXX ");
				$("#phoneChk").css("color","red");
			}else{
				$("#phoneChk").text("사용할 수 있는 연락처입니다.");
				$("#phoneChk").css("color","green");
				checkArr[1] = true;
			}
		});
		
		
		$("#paymentBtn").on("click",function(e){
            let count = 0;
            for(let i = 0;i<checkArr.length;i++){
                if(checkArr[i]){
                    count++;
                }
            }
          	if(count != 3){
          		alert("정보를 확인하세요");
          	}else{
          		console.log("결제API실행");
          	}
        })
		
		
		
	</script>
</body>
</html>