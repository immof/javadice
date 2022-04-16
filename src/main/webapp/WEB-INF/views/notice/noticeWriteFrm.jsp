<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 공지사항 ::</title>
<style>
	#noticeWrite tr{
		border : 1px solid #ccc;
	}
	.tbl>tr{
		margin-bottom: 15px;
	}
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
    	margin-bottom: 30px;
    	border-bottom: 2px solid #ccc;
	}
	.td-3{
		width: 40px;
	}
	.file{
		text-align: left;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page1-content">
		<div class="belt">NOTICE</div>
		<br>
		<%@include file="/WEB-INF/views/common/notice_submenu.jsp" %>
		<br>
		<div class="page1-title">공지사항 작성</div>
			<form class="form1" action="/noticeWrite.do" method="post" enctype="multipart/form-data">				
					<table class="tbl" id="noticeWrite">
						<tr class="tr-1">
							<th class="td-3">제목</th>
							<td colspan="5">
								<input type="text" name="noticeTitle" class="input-form" style=" height: 20px; font-weight: bold;">
								<input type="hidden" name="memberNick" value="<%=m.getMemberNick() %>">
						</tr>
						<tr class="tr-1">
							<td colspan="6" style="text-align: left;"><textarea id="noticeContent" name="noticeContent" class="input-form"></textarea>
							</td>
						</tr>
						<tr class="tr-1">
							<th class="td-3"><span class="material-icons">file_download</span></th>
							<td class="file"><input type="file" name="file" ></td>
						</tr>
						<tr class="button">
							<td colspan="6">
							<button type="submit" class="btn bc1 bs1">등록</button>
							<button type="button" onclick="location.href='/noticeList.do?reqPage=1'" class="btn bc1 bs1">취소</button>
							
							</td>
						</tr>
					</table>
			</form>
	</div>
</body>
</html>