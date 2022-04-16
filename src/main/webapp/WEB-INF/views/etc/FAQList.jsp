<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
</head>
<style>
	.body{
		margin: 0;
	}
	.notice-tbl tr>th{
		border-top: 1px solid #ccc;
		background-color: rgb(204,204,204,0.4);
	}
	.page1-content{
		width: 900px;
		margin: 0 auto;
		overflow: hidden;
		margin-bottom: 10px;
		flex-grow: 1;
	}
	.page1-title{
		font-family: ns-bold;
   	    padding: 20px 0px;
    	font-size: 1.3rem;
    	margin-top: 50px;
    	border-bottom: 2px solid #ccc;
	}
	.faq-title{
		height: 20px;
		padding: 20px;
		border-bottom: 1px solid #ccc;
		display: flex;
		justify-content: space-between;
	}
	.faq-title:hover{
		cursor: pointer;
	}
	.title-name{
		font-weight: 700;
	}
	.title-plus{
		font-size: 30px;
		margin-top: -15px;
	}
	.faq-content{
		padding: 30px 40px;
		padding-bottom: 15px;
		background-color: #f9f9f9;
		display: none;
	}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page1-content">
		<div class="belt">FAQ</div>
		<br>
		<%@include file="/WEB-INF/views/common/notice_submenu.jsp" %>
		<br>
		<div class="page1-title">자주하는 질문</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 체크인, 체크아웃 시간은 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				JAVADICE CITY의 체크인 시간은 오후 15시이며 체크아웃 시간은 오전 11시입니다.<br><br>
				단, 투숙하는 상품의 별도 시간 규정이 있는 경우 상품의 내역이 우선됩니다.<br><br>
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 객실 내 최대 투숙 인원 규정이 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				객실당 투숙 가능한 최대 인원 수와 객실 패키지에 포함된 기준 인원 수는 다를 수 있습니다.<br><br>
				또한 객실 패키지 별로 기준 인원이 상이하며, 기준 인원을 초과할 경우 추가 인원에 대한 요금이 부과됩니다.<br><br>
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 클럽 라운지 이용은 어떻게 하나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				클럽 라운지는 14세 이상 입장 가능한 시설로 어린이의 출입이 제한되며 클럽 라운지 혜택이 포함된 패키지로 예약하신 투숙객에 한하여 이용 가능합니다.<br><br>
				매주 토요일만 운영되며 이용 시간은 아래와 같습니다.<br><br>
				
				- Breakfast 07:00~10:30<br><br>
				클럽 라운지 고객만을 위해 특별하게 준비되는 고급스러운 조식 서비스<br><br>
				
				- Tea&Coffee 14:00~17:00<br><br>
				따듯한 햇살이 함께하는 오후의 티타임<br><br>
				
				- Happy Hour 18:00~21:00<br><br>
				엄선된 메뉴와 품격 있는 주류로 제공되는 풍성한 해피아워<br><br>
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 체크인 전 또는 체크아웃 후 부대시설 이용 가능한가요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				호텔 수영장, 피트니스, 플레이랩, 키즈존의 부대시설은 체크인 후부터 체크아웃 전까지 이용 가능합니다.<br><br>
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 호텔 객실에서 외부 포장 음식을 먹어도 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				JAVADICE CITY는 외부 음식 반입으로 발생할 수 있는 위생 상의 문제점을 사전에 예방하고 보다 쾌적한 환경을 제공하기 위해 호텔 내 외부 음식 반입을 제한하고 있습니다.<br><br>

				다만, 리조트 내 운영 중인 레스토랑 및 식음 매장 내에 공식적으로 판매되고 있는 To-go상품의 경우에는 객실 내 이용은 가능합니다.<br><br>
				더불어, 저희 호텔 룸서비스에서는 24시간 다양한 메뉴를 제공하고 있습니다. 객실 내에서 편안하게 이용이 가능하니 룸서비스 이용을 추천 드립니다.<br><br>
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[객실] 패키지 상품 문의 및 객실 예약은 어떻게 하나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				객실 예약실 TEL 032-729-2000 혹은 대표 이메일 j-city@javadice.com 을 통해 연락 주십시오.
				JAVADICE CITY 공식 홈페이지에서 보다 편리하게 예약하실 수 있습니다.
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[객실] 호텔 내 침대 사이즈가 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				King 객실에는 너비 1800mm, 길이 2100mm의 킹사이즈 침대 1개, Twin 객실에는 너비 1400mm, 길이 2100mm의 더블 사이즈 침대 2개가 있습니다.<br><br>
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[객실] 침대 이동(헐리웃베드) 가능한가요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				객실 내 안전사고 예방 및 호텔 자산 손상의 우려로 가구의 재배치 혹은 이동은 불가합니다.<br><br>
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[객실] 투숙 시 객실 내의 미니바 무료 제공 맞나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				객실 내 미니바는 1박당 1회 무료이며, 추가 요청 시 요금이 부과됩니다.<br><br>
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[객실] 유아용품 및 대여품은 어떻게 신청하나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				유아용품 및 대여품은 한정된 수량으로 선착순으로 대여해 드리고 있으며, 조기 마감될 수 있으니 사전에 신청해 주시기 바랍니다.<br><br>
				객실 예약 확정 후 실시간 재고 상황에 따라 제공됩니다.<br><br>
				
				[대여 유아용품 안내 사항]<br><br>
				- 침대 안전가드 : 안전 상의 이유로 36개월 이하 유아 이용 권장<br><br>
				- 아기침대 : 낙상 등의 안전 상의 이유로 12개월 이하 유아 이용 권장<br><br>
				상기의 품목은 한정된 수량으로 중복 대여가 어렵습니다.<br><br>
				
				유아용 슬리퍼와 가운은 별도 준비되어 있지 않습니다.<br><br>
				</p>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
	<script>
		$(".faq-title").on("click",function(){
			const plus = $(this).children().eq(1);
			if(plus.text()=="+"){
				plus.text("-");
			}else{
				plus.text("+");
			}
			const content = $(this).next();
			content.slideToggle();
		})
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>