<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
		 .mypage-header{
          display: flex;
          height: 150px;
          background-color: #ac9e89;
        }
        .mypage-header-space{
          flex-grow: 2;
        }
        .mypage-header-profile{
          flex-grow: 7.5;
          vertical-align: middle;
          display: flex;
        }
        .mypage-header-profile>a{
          margin-right: 15px;
        }
        .mypage-header-nick{
          font-size: 35px;
          padding-left: 25px;
        }
        .mypage-nav{
          background-color: aquamarine;
          flex-grow: 1;
          height: 500px;
        }
        .mypage-content{
          flex-grow: 15;
          height: 500px;
          padding: 27px;
        }
        
		.mypage-content-title {
		  margin-top: 3px;
	      height: 30px;
	      font-family: ns-bold;
	      border-bottom: solid 2px rgb(167, 167, 167);
		}
        .left-menu{
            margin-top: 50px;
            flex-grow: 1;
            color: rgb(51, 51, 51);
      
        }
        .left-menu>ul{
            border-top: solid 2px rgb(167, 167, 167);
            border-bottom: solid 2px rgb(167, 167, 167);
            margin-left: 30px;
            list-style-type: none;
        }
        .left-menu>ul>li{
            margin-top: 14px;
            margin-bottom: 8px;
            padding-left: 25px;
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

<!-- 
<meta charset="UTF-8">
<title>Insert title here</title>
 -->
</head>
        <header>
          <div class="mypage-header">
            <div class="mypage-header-space"></div>
            <div class="mypage-header-profile">
              <img src="./img/sun.png" alt="" style="width: 50px; height: 50px;">
              <span class="mypage-header-nick">김코딩</span>
          </div>
        </header>
        <div class="left-menu">
          <ul>
              <li><a href="/bookCheck.do">예약관리(테스트중)</a></li>
              <li><a href="#">회원관리</a></li>
              <li><a href="#">객실관리</a></li>
              <li><a href="#">공지사항</a></li>
              <li><a href="#">문의내역</a></li>
              <li><a href="#">프로모션</a></li>                  
          </ul>
      </div>

</html>