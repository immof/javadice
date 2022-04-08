<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.left-menu{
            margin-top: 50px;
            width: 20%;
            color: rgb(51, 51, 51);
        }
        .left-menu>ul{
            border-top: solid 2px rgb(167, 167, 167);
            border-bottom: solid 2px rgb(167, 167, 167);
            width: 110px;
            margin-left: 30px;
            list-style-type: none;
        }
        .left-menu>ul>li{
            margin-top: 14px;
            margin-bottom: 8px;
            height: 30px;
        }
        .left-menu>ul>li>a{
            text-decoration: none;
            color: rgb(51, 51, 51);
        }
        .left-menu>ul>li>a:hover{
            color: rgb(172, 158, 137);
            font-size: 17px;
        }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="left-menu">
            <ul>
                <li><a href="#">예약관리</a></li>
                <li><a href="#">회원관리</a></li>
                <li><a href="#">객실관리</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">문의내역</a></li>
                <li><a href="#">프로모션</a></li>                  
            </ul>
        </div>
</body>
</html>