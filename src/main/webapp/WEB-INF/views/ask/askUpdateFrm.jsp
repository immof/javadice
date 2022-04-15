<%@page import="com.herejava.ask.vo.Ask"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Ask a = (Ask)request.getAttribute("a");
    %>
     <!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#askWrite tr{
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
	#file{
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
		<div class="page1-title">문의사항 수정</div>
			<form class="form1" action="/askUpdate.do" method="post" enctype="multipart/form-data">				
					<input type="hidden" name="askNo" value="<%=a.getMemberNo() %>">
					<table class="tbl" id="askWrite">
						<tr class="tr-1">
							<th class="td-3">제목</th>
							<td colspan="5">
								<input type="text" name="askTitle" class="input-form" style=" height: 20px; font-weight: bold;" value="<%=a.getAskTitle() %>">
								<input type="hidden" name="memberNo" value="<%=m.getMemberNo() %>">
						</tr>
						<tr class="tr-1">
							<td colspan="6" style="text-align: left;"><textarea id="askContent" name="askContent" class="input-form"><%=a.getAskContent() %></textarea>
							</td>
						</tr>
						<tr class="tr-1">
							<th class="td-3"><span class="material-icons">file_download</span></th>
							<td id="file"><input type="file" name="file1" ></td>
						</tr>
						<tr class="tr-1">
							<th class="td-3"><span class="material-icons">file_download</span></th>
							<td id="file"><input type="file" name="file2"></td>
						</tr>
						<tr class="tr-1">
							<th class="td-3"><span class="material-icons">file_download</span></th>
							 <td id="file"><input type="file" name="file3"></td>
						</tr>
						<tr class="button">
							<td colspan="6">
							<button type="submit" class="btn bc1 bs1">수정완료</button>
							<button type="button" href="/askList.do?reqPage=1" class="btn bc1 bs1">취소</button>
							
							</td>
						</tr>
					</table>
			</form>
	</div>
	<script>
		$("#askContent").summernote({
			height: 400,
			lang : "ko-KR",
			callbakcs:{
				onImageUpload : function(files){
					uploadImage(files[0],this);
				}
			}
		});
	
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>