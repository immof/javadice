<%@page import="com.herejava.member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.mypage-content{
	min-height: 800px;
}
</style>
<meta charset="UTF-8">
<title>:: 회원 페이지 ::</title>
</head>
<body>

<!--  마이페이지 기본템플릿  -->
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">콘텐츠 제목입니다. 제목쓰시면 콘텐츠영역 줄 위에 쓰여집니다.</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>


<script>
//ajax 사용템플릿
$.ajax({
	url: '', // Controller의 mapping값
	type: '',  // get, post 방식 中
	data: '',  // Controller로 보낼 데이터
	contentType: '',  // 보내는 data의 타입
	dataType: '', // 받을 데이터 타입
	success: function() {},  // 정상적으로 return 받았을 때 실행할 함수
	error: function(){} // 실패했을 때 작동할 함수
});

</script>
</body>
</html>