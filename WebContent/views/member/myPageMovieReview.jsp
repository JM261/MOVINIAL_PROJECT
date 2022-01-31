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
<title>Insert title here</title>

<style>

	.list-area>tbody>tr:hover{
		cursor :pointer;
		background : lightgray;
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
	
	.btn_mr{
		width:90px;
		height:40px;
		float:right;
		color:white;
		background-color:black;
		text-align:center;
		margin-bottom:10px;
		text-decoration:none;
		margin-top:50px;
		padding-top:5px;
		
	
	/* -----------리뷰작성 모달창-------------- */
	
        
	}

</style>
</head>
<body>

	<%@ include file="../../views/common/headerSidebar.jsp" %>
	
	<div class="dt-content">
	<a class="btn_mr" href="http://localhost:8777/movinial/reviewEnroll.my">리뷰쓰기</a> 

	<h2>Your Reviews</h2>
	<br>
  <p>MOVINIAL에서 <code><%= loginUser.getMemberNickname() %></code> 님이 기록으로 남기고 싶은 영화가 있나요?</p> 
          
	<hr>
	

  <table class="table list-area">
    <thead>
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
      <tr movieNo="<%=rv.getRefMno()%>">
        <td width="150px" height="200px"><img src="https://image.tmdb.org/t/p/w185<%= rv.getPosterPath()%>" alt="포스터"></td>
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
				location.href = "<%=contextPath%>/detail.mo?movieNo=" + $(this).attr('movieNo');
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
        <button class="page-item" onclick="location.href='<%= contextPath%>/myMovieReviews.bo?currentPage=<%= currentPage -1 %>&userNo=<%= memberNo %>'">&lt;</button>
        <%} %>
        
       <% for(int i = startPage; i <= endPage; i++){ %>
       	<%if(i != currentPage){ %>
       			<!--locahlhost:8001/jsp/list.bo?currentPage=xx  -->
       		 <button class="page-item" onclick="location.href='<%= contextPath%>/myMovieReviews.bo?currentPage=<%=i%>&userNo=<%= memberNo %>'"><%= i %></button>
       	<%} else{%>
       			<button class="page-item" style="color:coral"><%= i %></button>
        <%} %>
      <%} %>
      
      	<!--페이지 바에서 > 를 담당 : 다음페이지 이동  -->
      	<% if(currentPage!= maxPage){ %>
        		<button class="page-item" onclick="location.href='<%= contextPath%>/myMovieReviews.bo?currentPage=<%= currentPage +1 %>&userNo=<%= memberNo%>'">&gt;</button>
        <%} %>
   </div>
   
</div>

	<%@ include file="../../views/common/footer.jsp" %>
</body>
</html>