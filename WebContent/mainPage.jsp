<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

      #div1 {
        width: 890px;
        height: 300px;
        padding: 20px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
      }

      #div2 {
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
        text-decoration: none;
        color: black;
        font-size: x-large; 
        font-weight: bold;
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
      

      </style>
  </head>
  <body>
  
 <%@ include file="/views/common/header.jsp" %>

      

      <div id="content0">
        <!-- 이미지 포스터? -->
        <!--<a href=""><img src="" alt=""></a>-->
      </div>
    
      <!-- 로그인한 회원만 보이는 부분 -->
      <% if(loginUser != null){ %>   
      <a href="" class="title"><%= loginUser.getMemberNickname() %>님을 위한 추천영화</a>
      <div id="content1">
        <div class="movie0"> </div>
        <div class="movie0"> </div>
        <div class="movie0"> </div>
        <div class="movie0"> </div>
        <div class="movie0"> </div>
      </div>
      <% } %>



      <a href="" class="title">최신 개봉 영화</a>
      <div id="content2">
        <div class="movie1"> </div>
        <div class="movie1"> </div>
        <div class="movie1"> </div>
        <div class="movie1"> </div>
        <div class="movie1"> </div>
      </div>
  
      <div><a href="" class="title">MOVINIAL 추천 영화 <br></a></div>
      <div id="div1">
        <a href="" class="title" style="font-size: medium;">색감이 예쁜 영화가 보고 싶다면?</a>
        <div class="mCenter">
          <div class="movie2"> </div>
          <div class="movie2"> </div>
          <div class="movie2"> </div>
          <div class="movie2"> </div>
          <div class="movie2"> </div>
        </div>
      </div>

      <div id="div2">
        <a href="" class="title"  style="font-size: medium;">액션 영화가 보고 싶다면?</a>
        <div class="mCenter">
          <div class="movie3"> </div>
          <div class="movie3"> </div>
          <div class="movie3"> </div>
          <div class="movie3"> </div>
          <div class="movie3"> </div>
        </div>
      </div>

      <div id="div34">
        <a href="" class="title">리뷰어 랭킹</a>
        <div id="div3">
          <div class="reviewer"></div>
          <div class="reviewer"></div>
          <div class="reviewer"></div>
          <div class="reviewer"></div>
          <div class="reviewer"></div>
        </div>
        <a href="" class="title">베스트리뷰</a>
        <div id="div4">베스트 리뷰</div>
      </div>

      <a href="" class="title">&nbsp;&nbsp;&nbsp;&nbsp;이번주 인기 영화 TOP 10</a>
      <div id="div5">이번주 인기 영화 TOP 10</div>


      <div id="div6"><a href="" class="title">COMMUNITY</a></div>  

        <div id="content3">
        
        </div>
    
      
   
    <%@ include file="/views/common/footer.jsp" %>
    
  </body>
</html>
