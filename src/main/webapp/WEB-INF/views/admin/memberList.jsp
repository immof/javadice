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

}
.tbl tr>th{
		border-top: 1px solid #ccc;
		background-color: rgb(204,204,204,0.4);
}
.mypage-content-title>form{
	float: right;
	display: flex;
}
.tbl-hover th, .tbl-hover td{
	border-bottom: 1px solid #A7A7A7;
}
.tbl-hover{
	margin-top: 20px;
}
.delBtn{
	width:100px; 
	height:45px;
	margin-top: 20px;
	line-height: 45px;
	float:right;
}
.searchBtn{
	height: 40px;
	line-height: 40px;
	
}
#pageNavi {
	margin-top: 30px;
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
					<span style="font-family: ns-bold;">회원 목록</span>
					<form action="/searchMember.do">
						<input type="text" name="searchMember" placeholder="회원 검색(아이디/이름/닉네임)" style="height:29px; width:230px; padding-left:5px;" >
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
							<%if(mem.getMemberLevel()==0){%>
							<td>관리자</td>
							<%} else{%>
							<td>회원</td>
							<%} %>
							<td><button class="btn bc2 searchBtn" style="padding: 0 10px;" >예약조회</button></td>
							<td><input type="checkbox" id="delMemberChk"></td>
						</tr>
					<%} %>
					
					
				</table>
					
					<button class="btn bc3 delBtn" style="padding: 0;">삭제</button>
					<div id="pageNavi"><%=pageNavi%></div>
					
			</div>
			
		</div>
		<!-- flex-wrap -->
	</div>
	<!-- page-content -->

	<%@include file="/WEB-INF/views/common/footer.jsp"  %>
	<script>
		$(".delBtn").on("click",function(){
			const chk = $("#delMemberChk:checked");
			if(chk.length==0){
				alert("선택된 회원이 없습니다.");
				return;
			}
			if(confirm("정말 삭제하시겠습니까?")){
				const memberNoArr = new Array();
				chk.each(function(index,item){
					memberNoArr.push($(item).parent().parent().children().first().text());
				});
				location.href="/delMember.do?memberNoArr="+memberNoArr.join("/");
			}
		});
		
		$(".searchBtn").on("click",function(){
			const memberNo = $(this).parent().parent().children().first().text();
			const memberNick = $(this).parent().parent().children().eq(3).text();
			location.href="/adminBookList.do?memberNo="+memberNo+"&memberNick="+memberNick+"&reqPage=1&chk=3";
		});
	</script>
</body>
</html>