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
		<div class="belt">NOTICE</div>
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
				<span class="title-name">[이용안내]객실 내 최대 투숙 인원 규정이 어떻게 되나요?</span>
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
				<span class="title-name">[이용안내] 체크인, 체크아웃 시간은 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				JAVADICE CITY의 체크인 시간은 오후 15시이며 체크아웃 시간은 오전 11시입니다.
				단, 투숙하는 상품의 별도 시간 규정이 있는 경우 상품의 내역이 우선됩니다.
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 체크인, 체크아웃 시간은 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				JAVADICE CITY의 체크인 시간은 오후 15시이며 체크아웃 시간은 오전 11시입니다.
				단, 투숙하는 상품의 별도 시간 규정이 있는 경우 상품의 내역이 우선됩니다.
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 체크인, 체크아웃 시간은 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				JAVADICE CITY의 체크인 시간은 오후 15시이며 체크아웃 시간은 오전 11시입니다.
				단, 투숙하는 상품의 별도 시간 규정이 있는 경우 상품의 내역이 우선됩니다.
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 체크인, 체크아웃 시간은 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				JAVADICE CITY의 체크인 시간은 오후 15시이며 체크아웃 시간은 오전 11시입니다.
				단, 투숙하는 상품의 별도 시간 규정이 있는 경우 상품의 내역이 우선됩니다.
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 체크인, 체크아웃 시간은 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				JAVADICE CITY의 체크인 시간은 오후 15시이며 체크아웃 시간은 오전 11시입니다.
				단, 투숙하는 상품의 별도 시간 규정이 있는 경우 상품의 내역이 우선됩니다.
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 체크인, 체크아웃 시간은 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				JAVADICE CITY의 체크인 시간은 오후 15시이며 체크아웃 시간은 오전 11시입니다.
				단, 투숙하는 상품의 별도 시간 규정이 있는 경우 상품의 내역이 우선됩니다.
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 체크인, 체크아웃 시간은 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				JAVADICE CITY의 체크인 시간은 오후 15시이며 체크아웃 시간은 오전 11시입니다.
				단, 투숙하는 상품의 별도 시간 규정이 있는 경우 상품의 내역이 우선됩니다.
				</p>
			</div>
		</div>
		<div class="faq-wrap">
			<div class="faq-title">
				<span class="title-name">[이용안내] 체크인, 체크아웃 시간은 어떻게 되나요?</span>
				<span class="title-plus">+</span>
			</div>
			<div class="faq-content">
				<p>
				JAVADICE CITY의 체크인 시간은 오후 15시이며 체크아웃 시간은 오전 11시입니다.
				단, 투숙하는 상품의 별도 시간 규정이 있는 경우 상품의 내역이 우선됩니다.
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