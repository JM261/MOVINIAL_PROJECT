<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList, com.movinial.community.model.vo.Community, com.movinial.community.model.vo.Reply,com.movinial.common.model.vo.PageInfo" %>
<%
	ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	//페이징바 만들 때 필요한 변수 미리 셋팅
 	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY MOVINIAL</title>

 <style>
 
 	.mylist{
 		color:white;
 		background-color:black;
 		line-height:35px;
 		width:70px;
 		list-style:none;
 		display:inline-block;
 		text-align:center;
 		margin-bottom:10px;
 		margin-left:10px;
 		margin-right:5px;
 		margin-top:10px;
 		text-decolation:none;
 
 	}
 	
 	.mylist>a:hover{
 		text-decolation:none;

 		
 	}
 	
 	table{
 		text-align: center;
 		
 	}
 	
 	.list-area>tbody>tr:hover{
		cursor :pointer;
		background : lightgray;
	}
	
	.pagingation{
		border:none;
	}
	
	.page-item{
		border:none;
		color : black;
		background-color:white;
		width:30px;
	}
	
 	
 </style>
  
</head>
<body>
	<%@ include file="../../views/common/headerSidebar.jsp" %>
	<% String nickname = loginUser.getMemberNickname();%>
   
	<div class="dt-content">
	
	<h2>WITH MOVINIAL</h2>
	<br>
  <p>MOVINIAL에서 함께한 <code><%= nickname %></code> 님의  활동 기록을 알아볼까요?</p>            
	<hr>

  <table class="table list-area">
    <thead>
    	<a class="mylist" href="<%= contextPath %>/mylist.bo?currentPage=1">내 글</a>&nbsp;
    	<a class="mylist" href="<%= contextPath %>/myReplyList.bo?currentPage=1">내 댓글</a>

      <tr>
        <th width="200px">게시글 제목</th>
        <th width="300px">댓글 내용</th>
        <th width="160px">게시글 작성자</th>
        <th width="100px">작성일</th>
      </tr>
    </thead>
    <tbody>
    
    
	 <% if(list.isEmpty()){ %>
	        <tr>
	        	<td colspan="9"> 조회된 게시글이 없습니다</td>
	        </tr>
     <%} else{ %>
     	<% for(Reply r : list) { %>
     		
      <tr myListReply = <%= r.getReplyNo() %>>
        <td width="200px"><%= r.getReplyTitle() %></td>
        <td width="300px"><%= r.getReplyContent() %></td>
        <td width="160px"><%= r.getReplyWriter() %></td>
        <td width="100px"><%= r.getCreateDate() %></td>
      </tr>
      		<%} %>
      	<% } %>
	
	
	
    </tbody>
  </table>
 
  
  <script>
	
	$(function(){
		
		var loginUser = '<%= loginUser %>'

	    if(loginUser != null) {
			$(".list-area>tbody>tr").click(function(){
				location.href = "<%=contextPath%>/detail.cm?cno=" + $(this).attr('myListReply');
			})
		} else{
	        alert("로그인 후 이용해주시기 바랍니다.");
	        location.href = "<%= contextPath %>/login.me"
    	}
	})

  </script>
  	<br>
	<div class="pasing-area pagingation" align="center">
        <!-- 페이징버튼 -->
        <%if(currentPage != 1){ %>
        <button class="page-item" onclick="location.href='<%= contextPath%>/myReplyList.bo?currentPage=<%= currentPage -1 %>&userNo=<%= memberNo %>'">&lt;</button>
        <%} %>
        
       <% for(int i = startPage; i <= endPage; i++){ %>
       	<%if(i != currentPage){ %>
       			<!--locahlhost:8001/jsp/list.bo?currentPage=xx  -->
       		 <button class="page-item" onclick="location.href='<%= contextPath%>/myReplyList.bo?currentPage=<%=i%>&userNo=<%= memberNo %>'"><%= i %></button>
       	<%} else{%>
       			<button class="page-item" style="color:coral"><%= i %></button>
        <%} %>
      <%} %>
      
      	<!--페이지 바에서 > 를 담당 : 다음페이지 이동  -->
      	<% if(currentPage!= maxPage){ %>
        		<button class="page-item" onclick="location.href='<%= contextPath%>/myReplyList.bo?currentPage=<%= currentPage +1 %>&userNo=<%= memberNo%>'">&gt;</button>
        <%} %>
   </div>
   
</div>

	<%@ include file="../../views/common/footer.jsp" %>
</body>
</html>