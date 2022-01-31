<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    
    <title>MOVINIAL</title>
    
    <style>
    
      #content1{
        width: 1805px;
        height: 150px;
        padding: 20px;
        margin-bottom: 20px;
        text-align: center;
        margin-top: 200px;
      }

      #m_search{
        font-size: larger;
        width: 700px;
        height: 80px;
        font-size: 30px;
        border-left-width: 0;
        border-right-width: 0;
        border-top-width: 0;
        border-bottom-width: 1;
      }

      #m_search_btn{
        border:none;
        background: url("../resources/images/searchbtn.png"); /* 이미지 경로 상대 경로 */
        background-repeat: no-repeat;
        width:55px;
        height:30px;
      }

      #content2 {
        width: 1805px;
        height: 500px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
        text-align: center;
      }

      #content3 {
        width: 1805px;
        height: 1000px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
        text-align: center;
        margin-top: 10px;
      }

      #div1 {
        width: 890px;
        height: 500px;
        padding: 20px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
      }

      #div2 {
        width: 890px;
        height: 500px;
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
      .title{
        color: black;
        font-size: x-large; 
        font-weight: bold;
        pointer-events: none;
        cursor: default;
      }

      .movie1{
        display: inline-block;
        border: 1px solid #bcbcbc;
        width: 320px;
        height: 450px;
        margin-right: 15px;
      }
      .moviecontent{
        margin-top: 15px;
      }

      .movie2{
        display: inline-block;
        border: 1px solid #bcbcbc;
        width: 320px;
        height: 450px;
        margin-right: 15px;
      }

      .movie3{
        display: inline-block;
        border: 1px solid #bcbcbc;
        width: 155px;
        height: 215px;
        margin-right: 10px;
      }

      .movie4{
        display: inline-block;
        border: 1px solid #bcbcbc;
        width: 155px;
        height: 215px;
        margin-right: 10px;
      }

      </style>
  </head>
  <body>
  
 <%@ include file="../common/header.jsp" %>

    <div id="content1">
        <input type="text" id="m_search">
        <button id="m_search_btn"></button>
    </div>


      <a class="title">최신 개봉 영화</a>
      <div id="content2">
                
      </div>
      
      <script>
          $(function(){
			
            $.ajax({
                url : "<%= contextPath %>/latest.cu",
                success : function(latestList){
                    var result = "";
                    <% for(int i=0; i<5; i++){ %>
                      result += "<img class='movie1' src='http://image.tmdb.org/t/p/w154"+ latestList[<%=i%>].posterPath +"'><input type='hidden' name='movieNo' value='"+latestList[<%=i%>].movieNo+"'>"
                    <% } %>
                    $('#content2').html(result);
                    
                    $('.movie1').click(function(){                  		
                  		location.href = "<%= contextPath %>/detail.mo?movieNo="+$(this).next().val();
                    })
                    
                } // success
            }) // ajax
          })
          
      </script>


      <a class="title">이번주 인기 영화</a>
      <div id="content3">
      
	        <div class="moviecontent">
	          <div class="movie2"></div>
	          <div class="movie2"></div>
	          <div class="movie2"></div>
	          <div class="movie2"></div>
	          <div class="movie2"></div>
	        </div>
	        <div class="moviecontent">
	          <div class="movie2"></div>
	          <div class="movie2"></div>
	          <div class="movie2"></div>
	          <div class="movie2"></div>
	          <div class="movie2"></div>
	        </div>
        
      </div>

	  <script>
          $(function(){
			
            $.ajax({
                url : "<%= contextPath %>/popular.mo",
                success : function(list){
                    var result = "";
                    <% for(int j=0; j<2; j++){ %>
	                    <% for(int i=0; i<5; i++){ %>
	                      result += "<img class='movie2' src='http://image.tmdb.org/t/p/w154"+ list[<%=(j*5)+i%>].posterPath +"'><input type='hidden' name='movieNo' value='"+list[<%=(j*5)+i%>].movieNo+"'>"
	                    <% } %>
                    <% } %>
                    $('#content3').html(result);
                    
                    $('.movie2').click(function(){                  		
                  		location.href = "<%= contextPath %>/detail.mo?movieNo="+$(this).next().val();
                    })
                    
                } // success
            }) // ajax
          })
          
      </script>

  
      <div><a class="title">MOVINIAL 추천 영화 <br></a></div>
      <div id="div1">
        <a href="" class="title" style="font-size: medium;">색감이 예쁜 영화가 보고 싶다면?</a>
        
        <div class="moviecontent2">
         
        </div>
        <div class="moviecontent3">
          
        </div>
        
      </div>

      <div id="div2">
        <a class="title"  style="font-size: medium;">액션 영화가 보고 싶다면?</a>
       
        <div class="moviecontent4">
          
        </div>
        <div class="moviecontent5">
          
        </div>
        
      </div>
      
      <script>  	
	  	 
	        $(function(){
	        	
	          $.ajax({
	            url : "<%= contextPath %>/random.cu",
	            success : function(randomList){
	            	var result = "";
	            	console.log(randomList);
	            	<% for(int j=0; j<2; j++) {%>
		            	<% for(int i=0; i<2; i++){ %>
		            		var randomId = randomList[<%=j*2+i%>].listMovieId.split(',');
		            		var posterPath = randomList[<%=j*2+i%>].posterPath.split(',');
		            		console.log(posterPath[0]);
		            		result = "<img class='movie<%=j+3%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[0] +"'>"
			            			+ "<img class='movie<%=j+3%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[1] +"'>"
			            			+ "<img class='movie<%=j+3%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[2] +"'>"
			            			+ "<img class='movie<%=j+3%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[3] +"'>"
			            			+ "<img class='movie<%=j+3%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[4] +"'>";
		            		
			            		$('.moviecontent<%=j*2+i+2%>').html(result);
		            	<% } %>
	            	<% } %>
	            	
	            } // success
	          }) // ajax
	        })
	       
	      </script>

    <%@ include file="../common/footer.jsp" %>
    
  </body>
</html>