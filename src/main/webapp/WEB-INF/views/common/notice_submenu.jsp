<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
        .noticemenu{
            width: 800px;
            margin: 0 auto;
            padding: 0;
        }
        .noticemenu>ul{
            list-style-type: none;
            border-right: none;
        }
        .noticemenu>ul>li{
            height: 40px;
            text-align: center;
            float: left;
            width: 180px;
            border-right: solid 1.5px #333333;
        }
        .noticemenu>ul>li>a{
            margin: 0 auto;
            vertical-align: middle;
            padding-left: 10px;
            padding-right: 20px;
            text-decoration: none;
            font-size: 18px;
            color: #333333;
        }
        .noticemenu>ul>li:last-child{
            border: none;
        }
        .noticemenu>ul>li>a:hover{
            color: #685f51;
            font-weight: bold;
        }
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="noticemenu">
        <ul>
            <li><a href="/noticeList.do?reqPage=1">공지사항</a></li>
            <li><a href="/askList.do?reqPage=1">문의사항</a></li>
            <li><a href="#">자주하는 질문</a></li>
            <li><a href="#">고객 후기</a></li>
        </ul>
    </div>
</body>
</html>