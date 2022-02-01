<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList, com.movinial.review.model.vo.Review, com.movinial.common.model.vo.PageInfo" %>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");

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
<title>LIKES LIST&nbsp;[REVIEWS]</title>

<style>

	.list-area>tbody>tr:hover{
		cursor :pointer;
		background : lightgray;
	}
	
	.mybtn2{
 		color:white;
 		background-color:black;
 		line-height:35px;
 		width:70px;
 		list-style:none;
 		display:inline-block;
 		text-align:center;
 		margin-bottom:20px;
 		margin-right:10px;
 		margin-top:10px;
 		
 	}  
 	
 	#m1, #m2, #m3{
 		color:white;
 		background-color:black;
 		line-height:35px;
 		width:70px;
 		list-style:none;
 		display:inline-block;
 		text-align:center;
 		margin-bottom:20px;
 		margin-right:10px;
 		margin-top:10px;
 	}
 	
 	 table{
 		text-align: center;
 	} 
 	
 	.table td, .table th {
 	    vertical-align: middle !important;
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

	<div class="dt-content">
	
	<h2>I LIKE THIS!</h2>
	<br>
  <p>MOVINIAL에서 <code><%= loginUser.getMemberNickname() %></code> 님의 하트를 모아봤어요!</p>            
	
	<hr>
	

  <table class="table list-area">
    <thead>
    	<a class="mybtn2" id="m1" href="<%= contextPath %>/myMovie.Likes">영화&nbsp;</a>
    	<a class="mybtn2" id="m2" href="<%= contextPath %>/myLikes.review">리뷰&nbsp;</a>
    	<a class="mybtn2" id="m3" href="<%= contextPath %>/myCommunity.Likes">게시글</a>
    	<br>
      <tr>
        <th width="300px" colspan="2">리뷰</th>
        <th width="100px">작성자</th>
        <th width="100px">작성일</th>
      </tr>
    </thead>
    <tbody>
      <% if(list.isEmpty()){ %>
	        <tr>
	        	<td colspan="9"> 조회된 게시글이 없습니다</td>
	        </tr>
     <%} else{ %>
     	<% for(Review rv : list) { %>
      <tr reviewNo ="<%= rv.getRefMno() %>">
      		<td width="150px" height="200px"><img src="https://image.tmdb.org/t/p/w185<%= rv.getPosterPath()%>" alt=""></td>
	        <td width="300px"><%= rv.getReviewTitle() %></td>
	        <td width="100px"><%= rv.getReviewWriter() %></td>
	        <td width="100px"><%= rv.getCreateDate() %></td>
      </tr>
      	<% } %>
	<% } %>
    </tbody>
  </table>
  
  <script>
	
	$(function(){
		var loginUser = '<%= loginUser %>'

	    if(loginUser != 'null') {
		
		$(".list-area>tbody>tr").click(function(){
			
			location.href = "<%=contextPath%>/detail.mo?movieNo=" + $(this).attr('reviewNo');
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
        <button class="page-item" onclick="location.href='<%= contextPath%>/myLikes.review?currentPage=<%= currentPage -1 %>&userNo=<%= memberNo %>'">&lt;</button>
        <%} %>
        
       <% for(int i = startPage; i <= endPage; i++){ %>
       	<%if(i != currentPage){ %>
       			<!--locahlhost:8001/jsp/list.bo?currentPage=xx  -->
       		 <button class="page-item" onclick="location.href='<%= contextPath%>/myLikes.review?currentPage=<%=i%>&userNo=<%= memberNo %>'"><%= i %></button>
       	<%} else{%>
       			<button class="page-item" style="color:coral"><%= i %></button>
        <%} %>
      <%} %>
      
      	<!--페이지 바에서 > 를 담당 : 다음페이지 이동  -->
      	<% if(currentPage!= maxPage){ %>
        		<button class="page-item" onclick="location.href='<%= contextPath%>/myLikes.review?currentPage=<%= currentPage +1 %>&userNo=<%= memberNo%>'">&gt;</button>
        <%} %>
   </div>
   
</div>
	
	<%@ include file="../../views/common/footer.jsp" %>
</body>
</html>