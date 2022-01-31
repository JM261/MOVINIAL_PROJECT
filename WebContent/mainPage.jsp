<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.movinial.community.model.vo.Community, com.movinial.curation.model.vo.CurationList, static com.movinial.common.MovieTemplate.*" %>
<%
	ArrayList<Community> list = (ArrayList<Community>)request.getAttribute("list");
	

%>    
    
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    
    <title>MOVINIAL</title>
    
    <style>
    
      #content0 {
      	width: 1805px;
        height: 600px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
        
        background-repeat: no-repeat;
        background-size: cover;
        cursor: pointer;
      }

      #content1 {
        width: 1805px;
        height: 500px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
        text-align: center;
      }

      #content2 {
        width: 1805px;
        height: 500px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
        text-align: center;
      }

      .div1 {
        width: 890px;
        height: 300px;
        padding: 20px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
      }
      
      .div2 {
        width: 890px;
        height: 300px;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
        border: 1px solid #bcbcbc;
      }
      
      #div34{
      
        clear:both;
        float: left;
      }
      #div3 {
        width: 890px;
        height: 640px;
        padding: 20px;
        margin-bottom: 20px; 
         
        border: 1px solid #bcbcbc;
      }

      #div4 {
        width: 890px;
        height: 640px;
        padding: 20px;
        margin-bottom: 20px;   
          
        border: 1px solid #bcbcbc;
      }

      #div5 {
        width: 890px;
        height: 1330px;
        padding: 20px;
        margin-bottom: 20px;
        float : right;
        border: 1px solid #bcbcbc;
      }

      #div6{
        clear: both;
      }

      #content3 {
        width: 1800px;
        height: 500px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
        float:left;
      }

      .title{
        color: black;
        font-size: x-large; 
        font-weight: bold;
        pointer-events: none;
        cursor: default;
      }

      .movie0{
        display: inline-block;
        border: 1px solid #bcbcbc;
        width: 320px;
        height: 450px;
        margin-right: 15px;
      }

      .movie1{
        display: inline-block;
        border: 1px solid #bcbcbc;
        width: 320px;
        height: 450px;
        margin-right: 15px;
      }
      .movie2{
        margin-top: 15px;
        display: inline-block;
        border: 1px solid #bcbcbc;
        width:150px;
        height: 210px;
        margin-left: 7px;
      }
      .movie2>img{
      	width:150px;
        height: 210px;	
      
      }

      .movie3{
        margin-top: 15px;
        display: inline-block;
        border: 1px solid #bcbcbc;
        width:150px;
        height: 210px;
        margin-left: 7px;
      }

      .mCenter{
        text-align: center;
      }
      
      .reviewr{
        border-bottom: 1px solid #bcbcbc;
      }
      
      table>thead>tr{
        font-size: 21px;
        text-align: center;
      }
      table>tbody td{
        font-size: 21px;
        text-align: center;
      }

      </style>
  </head>
  <body>
  
 <%@ include file="/views/common/header.jsp" %>

	<%-- 메인페이지 영화 배경이미지 출력 --%>
	 <script>
	  $(function(){
	  
	    $.ajax({
	      url: "mainBackground.mo",
	      success: function(m) {
	    	
	    	// 영화 배경이미지 및 그라데이션 값 변수로 설정
	    	var backgroundCss = "linear-gradient(rgba(24, 24, 24, 0), rgba(24, 24, 24, 0.534)), url(" + m.backdropPath + ")";

	        $("#content0").css("background-image", backgroundCss);
	        
	        // 배경이미지 클릭하면 영화 상세 페이지 넘어가기
	        $("#content0").click(function() {
	          location.href = "<%= contextPath %>/detail.mo?movieNo=" + m.movieNo;
	        })
	        
	      }
	    })
	    
	  })
	</script>
 
      <!-- 배경화면 부분 -->
      <div id="content0">
      </div>

      <%-- 관리자가 아닌 로그인한 회원만 보이는 부분 --%>
      <%-- 회원 추천 영화 --%>
      <% if(loginUser != null && loginUser.getMemberType().equals("U")) { %>
    <script>
			$(function(){
			
				$.ajax({
					url: "<%= contextPath %>/recommendMovie.mo",
					success: function(recommendList) {
						
						var result = "";
						
						// 영화 포스터 뿌려주기
						for(var i in recommendList) {
							result += "<img class='movie0' src='" + recommendList[i].posterPath + "' alt='" + recommendList[i].title + "'><input type='hidden' name='movieNo' value='" + recommendList[i].movieNo + "'>";
						}

						$("#content1").html(result);
						
						// 영화 포스터 마우스 포인터 추가
						$(".movie0").css("cursor", "pointer");
						
						// 영화 포스터 클릭하면 영화 상세 페이지 넘기기
						$('.movie0').click(function() {
							location.href = "<%= contextPath %>/detail.mo?movieNo=" + $(this).next().val();
						})
						
					}
				})
				
			})
		</script>
    
    <a href="" class="title"><%= loginUser.getMemberNickname() %>님을 위한 추천영화</a>
      <div id="content1">
      </div>
      <% } %>


      <script>
          $(function(){

            $.ajax({
                url : "<%= contextPath %>/latest.cu",
                success : function(latestList){
                    var result = "";
                    <% for(int i=0; i<5; i++){ %>
                      result += "<img class='movie1' src='http://image.tmdb.org/t/p/w500"+ latestList[<%=i%>].posterPath +"'>"
                    <% } %>
                    $('#content2').html(result);  
                } // success
            }) // ajax

          })
      </script>

      <a class="title">최신 개봉 영화</a>
      <div id="content2">
      </div>

	  	 <script>
	        $(function(){
	        	
	          $.ajax({
	            url : "<%= contextPath %>/random.cu",
	            success : function(randomList){
	            	var result = "";
	            	<% for(int i=0; i<2; i++){ %>
	            		var randomId = randomList[<%=i%>].listMovieId.split(',');
	            		var posterPath = randomList[<%=i%>].posterPath.split(',');
	            		result = "<a href='' class='title' style='font-size: medium;'>"+randomList[<%=i%>].listName+"</a>"
	            					+ "<div class='mCenter'>"
		            					+ "<img class='movie<%=i+2%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[0] +"'>"
		            					+ "<img class='movie<%=i+2%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[1] +"'>"
		            					+ "<img class='movie<%=i+2%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[2] +"'>"
		            					+ "<img class='movie<%=i+2%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[3] +"'>"
		            					+ "<img class='movie<%=i+2%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[4] +"'>"
	            					+ "</div>";
	            		
		            		$('.div<%=i+1%>').html(result);
	            		
	            	<% } %>
	            	
	            } // success
	          }) // ajax
	        })
	       
	      </script>
	  
      <div><a class="title">MOVINIAL 추천 영화 <br></a></div>
        	  	      
         <div class='div1'>
	                      
         </div>

         <div class='div2'>
	                   
         </div>

      <div id="div34">
        <a class="title">리뷰어 랭킹</a>
        <div id="div3">
          <div class="reviewer"></div>
          <div class="reviewer"></div>
          <div class="reviewer"></div>
          <div class="reviewer"></div>
          <div class="reviewer"></div>
        </div>
        <a href="" class="title">베스트 리뷰</a>
        <div id="div4"></div>
      </div>

      <a class="title">&nbsp;&nbsp;&nbsp;&nbsp;이번주 인기 영화 TOP 10</a>
      <div id="div5"></div>


      <div id="div6"><a href="<%= contextPath %>/list.cm?currentPage=1" class="title">COMMUNITY</a></div>  
	  <br>
	      <table align="center" class="list-area" >
            <thead>
                <tr style="background-color: lightgray;">
                    <th width="100">번호</th>
                    <th width="100">말머리</th>
                    <th width="810">제목</th>
                    <th width="320">작성자</th>
                    <th width="250">작성일</th>
                    <th width="100">조회수</th>
                    <th width="100">좋아요</th>
                </tr>
            </thead> 
            <tbody>


            <%--
            	<!-- 게시글 출력 -->
            	<% if(list.isEmpty()) { %>
            	<tr>
            		<td colspan="6">조회된 게시글이 없습니다.</td>
            	</tr>
            	<% } else { %>
            	<!-- 향상된 for문(읽어오기만 할 것이기 때문)으로 list에 있는 값 순차적으로 출력 -->
				<!-- 글번호 말머리 제목 작성자 작성일 조회수 좋아요 -->
                    <% for(Community c : list) {%>
                        <% if(!c.getCommunityCategory().equals("공지")) { %>
                            <tr style="border: 1px solid lightgray;">
                        <% } else { %>
                            <tr style="border: 1px solid lightgray; font-weight: bolder; background-color: ghostwhite;">
                        <% } %>
                                <td><%= c.getCommunityNo() %></td>
                                <td><%= c.getCommunityCategory() %></td>
                                <td><%= c.getCommunityTitle() %></td>
                                <td><%= c.getCommunityWriter() %></td>
                                <td><%= c.getCreateDate() %></td>
                                <td><%= c.getViews() %></td>
                                <td><%= c.getLikes() %></td>
                            </tr>
                    <% } %>
                <% } %>
                 --%>
    
            </tbody> 
            
        </table> 
            
      <br><br>
   
    <%@ include file="/views/common/footer.jsp" %>
    
  </body>
</html>
