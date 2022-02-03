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
        height: 950px;
        padding: 20px;
        margin-bottom: 20px; 
         
        border: 1px solid #bcbcbc;
      }

      #div4 {
        width: 890px;
        height: 950px;
        padding: 20px;
        margin-bottom: 20px;   
          
        border: 1px solid #bcbcbc;
      }

      #div5 {
        width: 890px;
        height: 1950px;
        padding: 20px;
        margin-bottom: 20px;
        float : right;
        border: 1px solid #bcbcbc;
        text-align: center;
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
      
      .reviewer{
        border: 1px solid #bcbcbc;
        width: 100%;
        height: 25%;

      }
      
      table>thead>tr{
        font-size: 21px;
        text-align: center;
      }
      table>tbody td{
        font-size: 21px;
        text-align: center;
      }
      #div5>div{
        
        width: 800px;
        height: 190px;
        padding-left: 100px;
        margin-right:0px
      }
      #div5>div>img{
        width: 150px;
        height: 180px;
        float: left;
        
      }
      #div5>div>h2{
        width: 800px;
        padding-top: 60px;
        padding-left: 180px;
        text-align: left;
      }

      img:hover{
        cursor: pointer;
      }
      #div4>div{
        /*border: 1px solid black;*/
        width: 100%;
        height: 25%;
      }
      #div4>div>img{
        width: 170px;
        height: 200px;
        margin-top: 12px;
        margin-left: 100px;
        float: left;
      }
      #div4>div>div{
        width: 500px;
        height: 150px;
        margin-top: 32px;
        margin-left: 20px;
        float: left;
        word-break:break-all;
        word-wrap:break-word;
        font-size: 22px;
      }

      tbody>tr:hover{
        cursor : pointer;
	      background-color: black;
      }

      .review1{
        border: 1px solid black;
        float: left;
        margin-left: 130px;
        margin-top: 25px;
        width: 170px;
        height: 170px;
        display: inline-block;
      }
      .review2{
        float: left;
        width: 400px;
        height: 60px;
        margin-top: 50px;
        margin-left:40px;
        font-size: 35px;
      }
      .review3{
        float: left;
        width: 400px;
        height: 60px;
        margin-left: 45px;
        font-size: 30px;
        margin-top: 10px;
        
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
	            		var randomNo = randomList[<%=i%>].listMovieNo.split(',');
	            		result = "<a href='' class='title' style='font-size: medium;'>"+randomList[<%=i%>].listName+"</a>"
	            					+ "<div class='mCenter'>"
		            					+ "<img class='movie<%=i+2%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[0] +"'><input type='hidden' value='"+ randomNo[0] +"'>"
		            					+ "<img class='movie<%=i+2%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[1] +"'><input type='hidden' value='"+ randomNo[1] +"'>"
		            					+ "<img class='movie<%=i+2%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[2] +"'><input type='hidden' value='"+ randomNo[2] +"'>"
		            					+ "<img class='movie<%=i+2%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[3] +"'><input type='hidden' value='"+ randomNo[3] +"'>"
		            					+ "<img class='movie<%=i+2%>' src='http://image.tmdb.org/t/p/w154"+ posterPath[4] +"'><input type='hidden' value='"+ randomNo[4] +"'>"
	            					+ "</div>";
	            		
		            		$('.div<%=i+1%>').html(result);
	            		
	            	<% } %>
	            	$(".mCenter>img").click(function(){
	            		location.href = "<%= contextPath %>/detail.mo?movieNo="+$(this).next().val();
	            	})
	            } // success
	          }) // ajax
	        })
	       
	      </script>
	  
      <div><a class="title">MOVINIAL 추천 영화 <br></a></div>
        	  	      
         <div class='div1'></div>
         <div class='div2'></div>
      <script>

          $(function(){

            $.ajax({
               url : "<%= contextPath %>/ranking.re",
               success : function(list){
                  var result="";
                  for(var i in list){
                    result += "<div class='reviewer'><img class='review1' src='"+list[i].profileImage+"'><div class='review2'>"+list[i].memberName+"</div><div class='review3'>"+list[i].count+"회</div></div>";
                  }
                  $('#div3').html(result);
                  $('.review1').attr('onerror',"this.onerror=null; this.src='<%= contextPath %>/resources/images/profilePic.png'");
               } // success
            }) // ajax

          })
          
         
      </script>
      <div id="div34">
        <a class="title">리뷰어 랭킹</a>
        <div id="div3">

        </div>

        <script>

          $(function(){

            $.ajax({
               url : "<%= contextPath %>/mainPage.re",
               success : function(list){
                  var result="";
                  for(var i in list){
                    result += "<div><img src='http://image.tmdb.org/t/p/w154"+list[i].reviewTitle+"'><input type='hidden' value='"+ list[i].refMno+"'><div>"+list[i].reviewContent+"</div></div>";
                  }
                  $('#div4').html(result);
                  $('#div4>div>img').click(function(){
                    location.href = "<%= contextPath %>/detail.mo?movieNo="+$(this).next().val();

                  })
               } // success
            }) // ajax

          })

        </script>

        <a href="" class="title">베스트 리뷰</a>
        <div id="div4">
            
        </div>
      </div>

	
      <script>

        $(function(){

          $.ajax({
            url : "<%= contextPath %>/topten.mo",
            success : function(list){
              var result = "";
              <% for(int i=0; i<10; i++){ %>
                result += "<div><img src='http://image.tmdb.org/t/p/w154"+ list[<%=i%>].posterPath +"'><h2><%=i+1%>. "+ list[<%=i%>].title +"</h2><input type='hidden' value='"+list[<%=i%>].movieNo+"'></div>"
              <% } %>
              $('#div5').html(result);
                    
              $('#div5>div>img').click(function(){                  		
                location.href = "<%= contextPath %>/detail.mo?movieNo="+$(this).next().next().val();
              })

            }
          })
        })

      </script>

      <a class="title">&nbsp;&nbsp;&nbsp;&nbsp;이번주 인기 영화 TOP 10</a>
      <div id="div5">
      </div>

      <script>

        $(function(){
          
          $.ajax({
            url : "<%= contextPath %>/mainPage.co",
            success : function(list){
               var result ="";
               
               for(var i in list){
                  result += "<tr class='pageInfoCommunity' style='background-color: white;'>"+
                                "<td width='100'>"+ list[i].communityNo +"</td>"+
                                "<td width='100'>"+ list[i].communityCategory +"</td>"+
                                "<td width='810'>"+ list[i].communityTitle +"</td>"+
                                "<td width='320'>"+ list[i].communityWriter +"</td>"+
                                "<td width='250'>"+ list[i].createDate +"</td>"+
                                "<td width='100'>"+ list[i].views +"</td>"+
                                "<td width='100'>"+ list[i].likes +"</td>"+
                            "</tr>"+              ////createDate
                            "<input type='hidden' value='"+list[i].communityNo+"'>";
               }
               $('#mainPageCommunity').html(result);

               $('.pageInfoCommunity').click(function(){
                 location.href = "<%=contextPath%>/detail.cm?cno="+$(this).next().val();
               })
               

            } // success
          }) // ajax
        })
        
      </script>
      
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
            <tbody id="mainPageCommunity">
            </tbody>
        </table>
      <br><br>
   
    <%@ include file="/views/common/footer.jsp" %>
    
  </body>
</html>
