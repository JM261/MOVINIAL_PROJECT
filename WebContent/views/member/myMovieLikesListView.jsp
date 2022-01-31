<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, com.movinial.movie.model.vo.Movie,com.movinial.common.model.vo.PageInfo" %>" %>
<%
	ArrayList<Movie> list = (ArrayList<Movie>)request.getAttribute("list");
		
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
<title>Insert title here</title>
<style>

	.thumbnail{
		border : 2px solid black;
		width : 205px;
		height : 255px;
		display : inline-block;
		margin-left: 55px;
		margin-top : 25px;
		float:left;
		
	}	

	#selectMV{
		margin-right : 50px;
		float:right;
		width:150px;
		text-align:center;
	}
	
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
 		margin-right:10px;
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
		float:left;
		margin-top:50px;
		margin-left:650px;
	}
	
	.page-item{
		border:none;
		color : black;
		background-color:white;
		width:30px;
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

</style>
</head>
<body>
	<%@ include file="../../views/common/headerSidebar.jsp" %>

	<div class="dt-content">
	
	<h2>I LIKE THIS!</h2>
	<br>
  <p>MOVINIAL에서 <code><%= loginUser.getMemberNickname() %></code> 님의 하트를 모아봤어요!</p>            
	<hr>
  <div class="outer">
		<a class="mybtn2" id="m1" href="<%= contextPath %>/myMovie.Likes">영화&nbsp;</a>
    	<a class="mybtn2" id="m2" href="<%= contextPath %>/myLikes.review">리뷰&nbsp;</a>
    	<a class="mybtn2" id="m3" href="<%= contextPath %>/myCommunity.Likes">게시글</a>
    	<br>
	<hr>
	<%if(!list.isEmpty()){ %>
		<%for(Movie mv : list){ %>
		<div class="list-area">
		<!-- 더미데이터 -->
			<div class="thumbnail" align="center" style="cursor: pointer;">
				<input type="hidden" value="<%= mv.getMovieNo() %>">
				<img src ="https://image.tmdb.org/t/p/w185<%= mv.getPosterPath() %>" width="200px" height="250px">
				<br>
			</div>
		</div>
		<%} %>
	<%} else{ %>	
		우리 <%=loginUser.getMemberNickname() %> 님이 좋아하는 영화들을 찾아보는건 어때요?
	<%} %>
	</div>
	<script>
		$(function(){
			
			var loginUser = '<%= loginUser %>'
			
		    if(loginUser != 'null') {
				$(".thumbnail").click(function(){
					var bno = $(this).children().eq(0).val();
					location.href = "<%=contextPath%>/detail.mo?movieNo=" + bno;
			})
		    } else{
		         alert("로그인 후 이용해주시기 바랍니다.");
		         location.href = "<%= contextPath %>/login.me"
	        }
		})
	</script>
	
	<div class="pasing-area pagingation" align="center">
        <!-- 페이징버튼 -->
        <%if(currentPage != 1){ %>
        <button class="page-item" onclick="location.href='<%= contextPath%>/myMovie.Likes?currentPage=<%= currentPage -1 %>&userNo=<%= memberNo %>'">&lt;</button>
        <%} %>
        
       <% for(int i = startPage; i <= endPage; i++){ %>
       	<%if(i != currentPage){ %>
       		 <button class="page-item" onclick="location.href='<%= contextPath%>/myMovie.Likes?currentPage=<%=i%>&userNo=<%= memberNo %>'"><%= i %></button>
       	<%} else{%>
       			<button class="page-item" style="color:coral"><%= i %></button>
        <%} %>
      <%} %>
      
      	<!--페이지 바에서 > 를 담당 : 다음페이지 이동  -->
      	<% if(currentPage!= maxPage){ %>
        		<button class="page-item" onclick="location.href='<%= contextPath%>/myMovie.Likes?currentPage=<%= currentPage +1 %>&userNo=<%= memberNo%>'">&gt;</button>
        <%} %>
   </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	</div>
	<%@ include file="../../views/common/footer.jsp" %>
</body>
</html>