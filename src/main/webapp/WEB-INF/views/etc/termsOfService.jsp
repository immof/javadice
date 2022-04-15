<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVADICE CITY</title>
</head>
<style>
.content-wrap{
	width: 1000px;
	margin: 0 auto;
	border-top: 2px solid #333;
}
.terms-title{
	height: 20px;
	padding: 20px;
	border-bottom: 1px solid #ccc;
	display: flex;
	justify-content: space-between;
}
.terms-title:hover{
	cursor: pointer;
}
.title-name{
	font-weight: 700;
}
.title-plus{
	font-size: 30px;
	margin-top: -15px;
}
.terms-content{
	padding: 30px 40px;
	padding-bottom: 15px;
	background-color: #f9f9f9;
	display: none;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="belt">이용약관</div><br><br>
		<div class="content-wrap">
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제1조(본 약관의 목적 및 적용)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 본 약관은 주식회사 호텔롯데(이하 ‘당 호텔')와 고객(당 호텔에 숙박을 희망하는 자 및 실제 숙박하는 자를 의미하며, 이하 동일합니다)간의 권리와 의무에 대하여 규정함을 그 목적으로 합니다.<br><br>
					2. 당 호텔과 고객 간에 체결되는 숙박계약 및 기타 관련계약은 본 약관이 정하는 바에 의하며, 본 약관에 규정되지 않은 사항에 대해서는 법령, 상관례 또는 관습에 따릅니다.<br><br>
					3. 신용카드를 이용한 예약의 경우 예약의 절차에 관련된 것은 본 약관에 따르고, 그 외 고객이 사용하는 신용카드와 관련된 세부사항은 신용카드사와 당 호텔 가맹점간의 약관에 따릅니다.<br><br>
					4. 당 호텔은 본 약관의 취지, 법령 또는 관습에 위배되지 않은 범위 내에서 고객과 별도의 특약을 체결할 수 있고, 이 경우 본 해당 특약이 본 약관에 우선하여 적용됩니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제2조(숙박예약 신청과 숙박계약의 성립)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 당 호텔에 숙박을 희망하는 고객은 당 호텔에 숙박 예약을 신청할 수 있으며, 이 때 당 호텔은 예약고객에게 다음의 사항을 요청할 수 있습니다. 고객이 해당 요청을 거절할 경우, 숙박 예약이 제한될 수 있습니다.<br><br>
					① 숙박자의 성명, 생년월일, 성별, 국적, 주소, 여권번호, 연락처, 예약 보증을 위한 신용카드 번호 등<br><br>
					② 개인정보 수집 및 이용, 제3자 제공에 대한 동의<br><br>
					③ 기타 당 호텔에서 필요하다고 정하는 사항<br><br>
					2. 고객의 숙박예약 신청을 당 호텔이 승낙하였을 때에 숙박계약이 성립된 것으로 합니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제3조(숙박예약 신청의 거절)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					다음과 같은 경우에 당 호텔은 고객의 숙박예약 신청을 거절할 수 있습니다.<br><br>
					1. 본 약관을 적용할 수 없는 숙박 요청을 할 때<br><br>
					2. 객실의 여유가 없을 때<br><br>
					3. 고객이 법령 또는 공공질서나 미풍양속에 위배되는 행위를 할 염려가 있다고 객관적으로 판단될 때<br><br>
					4. 고객이 전염병자로 명백히 판단될 때<br><br>
					5. 고객이 타 고객 또는 당 호텔 직원에게 위해를 가하는 행동을 하거나, 금지물품(동물, 마약, 총기류 등)을 휴대, 소지한 이력이 있는 경우<br><br>
					6. 숙박계약 이행을 위하여 당 호텔이 거래 통념상 예상되는 정도 이상의 부담을 가지는 경우<br><br>
					7. 대한민국 법령 등이 규정하는 바에 따라 숙박할 수 없다고 판단될 때<br><br>
					8. 기타 정당한 사유가 있는 경우<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제4조(예약금)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 당 호텔은 숙박 예약 시 예약금의 지불을 요청할 수 있습니다.<br><br>
					2. 전항의 예약금은 고객의 숙박요금 결제 시 숙박요금에 우선적으로 충당됩니다. 다만 제5조 및 제6조에서 정한 내용에 해당할 때에는 당 호텔이 고객에게 청구하는 위약금 또는 손해배상금에 우선 충당하고, 잔액이 있을 경우 그 잔액을 고객에게 반환해 드립니다.<br><br>
					3. 예약금을 현금으로 납부하지 않고 신용카드를 이용하여 숙박계약을 체결한 경우에는, 당 호텔이 신용카드회사에 제5조 및 제6조에서 정하는 위약금 또는 손해배상금을 청구합니다. 이 경우, 당 호텔은 고객의 요청이 있을 시 접수 번호, 접수 일시, 위약금 내용을 알려드립니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제5조(고객에 의한 숙박계약 해제ㆍ해지)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 당 호텔은 고객이 고객 측의 사정으로 숙박계약의 전부 또는 일부를 취소했을 경우 다음과 같이 위약금을 청구합니다. 이 경우 ‘숙박예정일’이라 함은 숙박계약상 각 숙박일을 의미하되, 당 약관 제7조에 따른 숙박등록 이후에는 아직 도래하지 않은 숙박일을 의미합니다.<br><br>
					① 일반 숙박 고객<br><br>
					가. 숙박예정일 1일 전 18:00(호텔현지시간) 까지 해제ᆞ해지하였을 경우: 위약금 없음<br><br>
					나. 숙박예정일 1일 전 18:00(호텔현지시간) 이후부터 자정 사이에 해제ᆞ해지하였을 경우: 최초 1일 약정요금 (객실 요금, 기타 시설 및 서비스 이용료 등을 포함하여 숙박계약 성립 시 약정한 금액을 의미하며, 이하 동일합니다)의 100%<br><br>
					다. 숙박예정일 당일 해제ㆍ해지 또는 No-show(숙박예정일에 숙박 등록이 없는 상태)가 발생 하였을 경우 : 최초 1일 약정요금의 100%<br><br>
					② 단체 숙박 고객: 별도 단체 숙박 계약에서 정한 내용에 따름<br><br>
					2. 제1항의 위약금은 호텔 홈페이지 또는 예약부서를 통한 직접 숙박 예약에 한하며, 현지 또는 온라인 여행사 등을 경유한 기타 예약은 해당 여행사와의 별도 위약금 약관 또는 기타 계약에 따릅니다.<br><br>
					3. 제1항의 위약금은 총 숙박예정기간 동안의 약정요금의 합계를 한도로 하며, 성수기와 비수기에 따라 다른 요금이 적용됩니다.<br><br>
					4. 호텔 사정에 따라 위약금 청구 시점은 변경될 수 있고, 고객은 위약금 지불의 혼란을 미연에 방지하기 위하여 호텔측에 관련 금액 사전 확인을 요청할 수 있습니다.<br><br>
					5. 전항의 경우 기차, 항공기 등 공공운수 기관의 불착 또는 지연, 기타 숙박자 개인의 책임이 아니라고 객관적으로 인정될 때에는 위약금을 청구하지 않습니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제6조(당 호텔에 의한 숙박계약의 해제ㆍ해지)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 당 호텔은 다음의 경우 숙박계약이 성립한 후에도 이를 해제ㆍ해지할 수 있습니다.<br><br>
					① 고객이 제7조에 따른 숙박등록을 하기 전<br><br>
					가. 제2조 제1항의 정보가 허위인 때<br><br>
					나. 제3조 제1항, 제3항 내지 제7항에 해당될 때<br><br>
					다. 제4조에 규정된 예약금 지불요청에 응하지 않았을 때<br><br>
					② 고객이 제7조에 따른 숙박등록을 한 이후<br><br>
					가. 제3조 제3항 내지 제7항에 해당될 때<br><br>
					나. 당 호텔이 정한 이용규칙을 불이행하였을 때<br><br>
					다. 장기투숙 고객이 제8조 제2항에 따른 이용요금 지불 요청에 응하지 않았을 때<br><br>
					라. 기타 고객이 대한민국 법령, 본 약관 규정 또는 호텔과의 별도 특약에서 정한 사항을 위반하고, 호텔의 시정요청을 거절하여 호텔의 정상적인 운영을 방해한 경우<br><br>
					2. 본 조에 따라 당 호텔이 숙박계약을 해제ㆍ해지하는 경우 당 호텔은 당 호텔이 입은 손해의 배상을 고객에게 청구할 수 있습니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제7조(등록절차)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 숙박등록은 숙박일 15:00부터 가능하나 현장 사정에 따라 달라질 수 있으며, 이 경우 별도 안내됩니다.<br><br>
					2. 고객은 당 호텔에 도착하는 즉시 프런트에서 다음 사항을 등록하여야 합니다.<br><br>
					가. 제2조 제1항의 사항<br><br>
					나. 보증금 (숙박 예정 기간 전체 객실이용료의 10%에 해당하며, 객실 요금 외에 호텔 이용 과정에서 발생한 비용이 퇴숙시 미납될 경우 이로써 충당합니다) 결제를 위한 유효한 신용카드 정보<br><br>
					3. 당 호텔은 제2호의 신용카드 유효성을 확인한 뒤 보증금을 결제하며, 퇴숙시 이를 취소합니다.<br><br>
					4. 고객이 본 조의 숙박등록을 마침으로써 숙박계약상 숙박기간 전체에 대한 숙박 등록이 완료됩니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제8조(이용요금의 지불)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 고객은 퇴숙 시 이용요금(객실요금, 기타 시설 및 서비스 이용료 등을 합하여 고객이 실제로 지불해야 하는 금액을 의미하며, 이하 동일합니다)을 지불하여야 합니다.<br><br>
					2. 호텔은 장기투숙 고객에 대해서 별도의 특약상 조건에 따라 또는 합리적으로 필요한 경우 퇴숙 전이라도 이용요금의 지불을 요청할 수 있으며, 고객은 당 호텔의 청구에 따라 이용요금을 지불하여야 합니다.<br><br>
					3. 지불수단은 현금, 여행자수표, 신용카드, 롯데호텔 상품권, 롯데백화점 상품권, 관광상품권, 리워드포인트, 및/또는 기타 롯데호텔에서 발행한 숙박권 등으로 하며 개인수표는 수납하지 않습니다.<br><br>
					4. 고객은 이용요금 지불의 혼란을 미연에 방지하기 위하여 퇴숙 예정 1일전에 이용요금 정산을 확인할 수 있습니다.<br><br>
					5. 고객은 제7조에 따른 숙박등록을 필한 이후에는 고객 측의 사정으로 숙박하지 않은 경우에도 이용요금을 지불하여야 합니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제9조(객실 키 수령 및 반납)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 고객은 숙박등록 시 프런트에서 객실 키를 수령하시고, 퇴숙 시 이용요금 지불과 함께 프런트에 이를 반납해야 합니다.<br><br>
					2. 고객이 투숙 중 객실 키를 분실했을 때는 즉시 프런트에 통보하여 주시고, 재 제작비용을 지불하셔야 합니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제10조(숙박의 책임)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 숙박에 대한 당 호텔의 책임은 프런트에서 숙박등록을 완료하는 시점부터 시작되어 고객이 퇴숙을 위해 프런트에서 이용요금 지불 및 객실 키를 반납했을 때, 끝나게 됩니다.<br><br>
					2. 고객이 당 호텔이 정한 이용규칙 및 본 약관을 이행하지 않음으로써 발생되는 사고, 기타 고객의 귀책사유로 발생한 사고에 대하여 당 호텔은 책임을 지지 않습니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제11조(이용규칙의 준수)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					고객은 당 호텔이 정한 이용규칙을 준수하여 주시기 바랍니다.
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제12조(영업시간)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 당 호텔의 부대시설 영업시간은 별도로 게시되어 있으며 현장 사정에 따라 변경될 수 있습니다.<br><br>
					2. 건강상 문제 및 기타 사유로 인하여 당 호텔의 부대시설을 정상적으로 이용하기 어렵거나 타 고객의 이용에 지장을 초래하는 고객은 부대 시설의 전부 또는 일부의 이용이 제한될 수 있으며, 이를 위반하여 발생하는 사고에 대하여 당 호텔은 책임을 지지 않습니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제13조(퇴숙시간)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 당 호텔의 퇴숙시간은 정오가 원칙이나 현장 사정 등에 의해 달라질 수 있습니다.<br><br>
					2. 퇴숙시간이 경과되었을 경우 다음과 같이 추가요금이 부가됩니다.<br><br>
					① ~15:00 까지 : 1일 객실요금 (1일 약정요금이 아닌 당 호텔의 실 판매가를 의미하며, 이하 동일합니다)의 30%<br><br>
					② ~17:00 까지 : 1일 객실요금의 50%<br><br>
					③ ~17:00 이후 : 1일 객실요금의 100%<br><br>
					3. 호텔 사정에 따라 퇴숙 시간은 변경될 수 있고, 고객은 추가 요금 지불의 혼란을 미연에 방지하기 위하여 사전에 호텔측에 퇴숙 시간 및 관련 금액을 확인할 수 있습니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제14조(약관의 변경)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					1. 본 약관의 내용은 호텔의 필요에 의해 언제든지 변경될 수 있습니다. 또한 이 약관의 일부 조항이 대한민국의 강행법규와 상충되는 경우에는 그 강행법규에 따릅니다. 다만 이 경우에도 약관의 나머지 조항의 효력에는 영향을 미치지 않습니다.<br><br>
					2. 고객은 숙박계약의 체결 시점에 시행 중인 약관의 적용을 받으며 변경된 약관은 소급하여 적용되지 않습니다.<br><br>
					</p>
				</div>
			</div>
			<div class="terms-wrap">
				<div class="terms-title">
					<span class="title-name">제15조(분쟁의 해결 및 관할법원)</span>
					<span class="title-plus">+</span>
				</div>
				<div class="terms-content">
					<p>
					본 약관의 내용과 관련하여 분쟁이 발생한 경우 고객과 당 호텔이 상호 합의하여 해결하는 것을 원칙으로 하며, 합의가 이루어지지 않는 경우 관할법원은 민사소송법이 정하는 바에 따릅니다.
					</p>
				</div>
			</div>
		</div>
		<br><br><br><br><br>
	</div>
	<script>
		$(".terms-title").on("click",function(){
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
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>