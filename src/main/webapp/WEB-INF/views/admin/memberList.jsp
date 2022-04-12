<%@page import="com.herejava.member.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); 
	String pageNavi = (String)request.getAttribute("pageNavi");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>

.page-content{
		float: left;
}
.tbl tr>th{
		border-top: 1px solid #ccc;
		background-color: rgb(204,204,204,0.4);
}
.mypage-content-title>form{
	float: right;
}
.tbl-hover th, .tbl-hover td{
	border-bottom: 1px solid #A7A7A7;
}
.modal-open-btn{
	width:100px; 
	height:35px;
	line-height: 35px
}
#pageNavi {
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/admin/mypage_admin.jsp"%>
			
			<div class="mypage-content">
				<div class="mypage-content-title">
					<span>회원 목록</span>
					<form action="/searchMember.do">
						<input type="text" name="searchMember" placeholder="회원 검색(아이디/이름/닉네임)" >
						<button type="submit" class="material-icons">search</button>
					</form>
				</div>
					<table class="tbl tbl-hover">
					<tr class="tr-3">
						<th>번호</th><th>아이디</th><th>이름</th><th>닉네임</th><th>핸드폰번호</th><th>적립금</th><th>등급</th><th>예약내역</th><th>삭제</th>
					</tr>
					
					<%for(Member mem : list) {%>
						<tr class="tr-1">
							<td><%=mem.getMemberNo() %></td>
							<td><%=mem.getMemberId() %></td>
							<td><%=mem.getMemberName() %></td>
							<td><%=mem.getMemberNick() %></td>
							<td><%=mem.getMemberPhone() %></td>
							<td><%=mem.getMemberPoint() %></td>
							<td><%=mem.getMemberLevel() %></td>
							<td><button class="btn bc2 searchBtn" s>예약조회</button></td>
							<td><input type="checkbox" id="delMemberChk"></td>
						</tr>
					<%} %>
					
					
				</table>
					
					<button class="btn bc3 modal-open-btn" target="#test-modal" style="padding: 0;">삭제</button>
					<div id="pageNavi"><%=pageNavi%></div>
					
			</div>
			
		</div>
		<!-- flex-wrap -->
	</div>
	<!-- page-content -->
	<div id="test-modal" class="modal-bg">
      <div class="modal-wrap ">
        <div class="modal-head">
          <h2>회원을 정말로 삭제하시겠습니까?</h2><br>
        </div>
        <div class="modal-btns-container">
          <button class="btn bc3 delBtn " id="modal-btns-item">삭제</button>
          <button class="btn bc4 modal-close" id="modal-btns-item">돌아가기</button>
        </div>
      </div>
    </div>
    <!-- modal -->
	<%@include file="/WEB-INF/views/common/footer.jsp"  %>
	<script>
		$(".delBtn").on("click",function(){
			const chk = $("#delMemberChk:checked");
			if(chk.length==0){
				alert("선택된 회원이 없습니다.");
				return;
			}
			const memberNoArr = new Array();
			chk.each(function(index,item){
				memberNoArr.push($(item).parent().parent().children().first().text());
			});
			location.href="/delMember.do?memberNoArr="+memberNoArr.join("/");
		});
		
	</script>
</body>
</html>