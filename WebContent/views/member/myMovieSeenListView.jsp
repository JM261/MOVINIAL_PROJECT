<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, com.movinial.movie.model.vo.Movie,com.movinial.common.model.vo.PageInfo" %>
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
<title>MOVIE SEEN</title>
<style>
	
	
	.list-area {
	    display: inline-block;
	}
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
		width:200px;
		height:50px;
		border-left:none;
		border-right:none;
		border-top:none;
		display:inline-block;
		text-align: center;
	}

 	table{
 		text-align: center;
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

</style>
</head>
<body>
	<%@ include file="../../views/common/headerSidebar.jsp" %>

	<div class="dt-content">
	
	<h2>MOVIE SEEN</h2>
	<!-- <select name="preferGenreMV" id="selectMV">
		<option value="전체" selected>전체</option>
		<option value="28">액션</option>
		<option value="12">모험</option>
		<option value="16">애니메이션</option>
		<option value="35">코미디</option>
		<option value="80">범죄</option>
		<option value="99">다큐멘터리</option>
		<option value="18">드라마</option>
		<option value="10751">가족</option>
		<option value="14">판타지</option>
		<option value="36">역사</option>
		<option value="27">공포</option>
		<option value="10402">음악</option>
		<option value="9648">미스터리</option>
		<option value="10749">로맨스</option>
		<option value="878">SF</option>
		<option value="10770">TV영화</option>
		<option value="53">스릴러</option>
		<option value="10770">전쟁</option>
		<option value="37">서부</option>
	</select> -->
	<br>
	<p><code><%= loginUser.getMemberNickname() %></code> 님과 함께한 영화들, 기억하시나요?</p>
	<hr>

  <div class="outer">
	
	<h2 align="center"><i>HAVE SEEN THIS MOVIE..!</i></h2>
	<br>
	
	<%if(!list.isEmpty()){ %>
		<%for(Movie mv : list){ %>
			<div class="list-area">
			<!-- 더미데이터 -->
				<div class="thumbnail" align="center" style="cursor: pointer;">
					<input type="hidden" value="<%= mv.getMovieNo() %>">
					<img src ="https://image.tmdb.org/t/p/w185<%= mv.getPosterPath() %>" width="200px" height="250px">	
				</div>
			</div> 
		<%} %>
	<%} %>
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
        <button class="page-item" onclick="location.href='<%= contextPath%>/myMovie.Seen?currentPage=<%= currentPage -1 %>&userNo=<%= memberNo %>'">&lt;</button>
        <%} %>
        
       <% for(int i = startPage; i <= endPage; i++){ %>
       	<%if(i != currentPage){ %>
       			<!--locahlhost:8001/jsp/list.bo?currentPage=xx  -->
       		 <button class="page-item" onclick="location.href='<%= contextPath%>/myMovie.Seen?currentPage=<%=i%>&userNo=<%= memberNo %>'"><%= i %></button>
       	<%} else{%>
       			<button class="page-item" style="color:coral"><%= i %></button>
        <%} %>
      <%} %>
      
      	<!--페이지 바에서 > 를 담당 : 다음페이지 이동  -->
      	<% if(currentPage!= maxPage){ %>
        		<button class="page-item" onclick="location.href='<%= contextPath%>/myMovie.Seen?currentPage=<%= currentPage +1 %>&userNo=<%= memberNo%>'">&gt;</button>
        <%} %>
	</div>
	</div>
   </div>
	<%@ include file="../../views/common/footer.jsp" %>
</body>
</html>