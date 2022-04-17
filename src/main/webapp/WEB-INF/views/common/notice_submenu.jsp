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
            border-right: solid 0px #333333;
        }
        .noticemenu>ul>li>a{
            margin: 0 auto;
            vertical-align: middle;
            text-decoration: none;
            font-size: 18px;
            color: #333333;
            line-height:40px;
        }
        .noticemenu>ul>li:last-child{
            border: none;
        }
        .noticemenu>ul>li>a:hover{
            color: #998465;
        }
        
        .noticemenu>ul{
        	display: flex;
        	justify-content: space-between;	
        }
        .title-div-line{
        	 line-height:40px;
        	 font-size:12px;
        }
        
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="noticemenu">
        <ul>
            <li><a href="/noticeList.do?reqPage=1">공지사항</a></li>
            <li class="title-div-line">|</li>
            <li><a href="/askList.do?reqPage=1">문의사항</a></li>
             <li class="title-div-line">|</li>
            <li><a href="/fAQList.do">자주하는 질문</a></li>
             <li class="title-div-line">|</li>
            <li><a href="/reviewList_admin.do?reqPage=1">고객 후기</a></li>
        </ul>
    </div>
</body>
</html>