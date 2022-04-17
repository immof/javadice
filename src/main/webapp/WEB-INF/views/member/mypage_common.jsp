<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.herejava.member.vo.Member"%>
<%
	Member member = (Member)session.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
<style>
.mypage-header {
	display: flex;
	height: 30px;
}

.mypage-header-space {
	flex-grow: 2;
}

.mypage-header-profile {
	flex-grow: 7.5;
	vertical-align: middle;
	display: flex;
	margin-top: 20px;
}

.mypage-header-profile>a {
	margin-right: 15px;
}

.mypage-header-nick {
	font-size: 35px;
	padding-left: 25px;
}

.mypage-nav {
	background-color: aquamarine;
	height: 500px;
	width:181px !important;
}

.mypage-content {
	min-height: 680px;
	margin: 27px 0 27px 57px;
	width:960px;
}

.mypage-content-title {
	margin-top: 3px;
	height: 30px;
	font-family: ns-bold;
	border-bottom: solid 2px #ac9e89;
}

.left-menu {
	margin-top: 60px;
	color: rgb(51, 51, 51);
	width:181px !important;
}

.left-menu>ul {
	border-top: solid 2px #ac9e89;
	border-bottom: solid 2px #ac9e89;
	margin-left: 30px;
	list-style-type: none;
}

.left-menu>ul>li {
	margin-top: 14px;
	margin-bottom: 8px;
	padding-left: 25px;
	height: 30px;
}

.left-menu>ul>li>a {
	text-decoration: none;
	color: rgb(51, 51, 51);
}

.left-menu>ul>li>a:hover {
	color: rgb(172, 158, 137);
}
.left-menu hr{
	background-color: #ac9e89;
	height: 1px;
	border: none;
}
</style>

<!-- 
<meta charset="UTF-8">
<title>Insert title here</title>
 -->
</head>
        <header>
          <div class="mypage-header">
        </header>
        <div class="left-menu">
          <ul>
              <li class="f-bold">예약정보</li>
              <li class="f-bold"><a href="/bookList.do?memberNo=<%=member.getMemberNo() %>&reqPage=1">예약내역</a></li>
              <hr>
              <li class="f-bold">활동정보</li>
              <li><a href="/mypage_point.do?memberNo=<%=member.getMemberNo() %>">적립금</a></li>
              <li><a href="/review.do?memberNo=<%=member.getMemberNo() %>">방문후기</a></li>
              <li><a href="/askList.do?reqPage=1">문의하기</a></li>
              <hr>
              <li class="f-bold">회원정보</li>
              <li><a href="/mypage_info.do">정보관리</a></li>
              <li><a href="/mypage_changePw.do">비밀번호 변경</a></li>
              <li><a href="/mypage_deleteMember.do">회원탈퇴</a></li>               
          </ul>
      </div>
</html>