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
        width: 800px;
        border-left-width: 0;
        border-right-width: 0;
        border-top-width: 0;
        border-bottom-width: 1;
      }

      #m_search_btn{
        border:none;
        background: url("../../resources/images/searchbtn.png"); /* 이미지 경로 상대 경로 */
        background-repeat: no-repeat;
        width:50px;
        height:32px;
      }

      #content2 {
        width: 1805px;
        height: 500px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }

      #content3 {
        width: 1805px;
        height: 1000px;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
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
        text-decoration: none;
        color: black;
        font-size: x-large; 
        font-weight: bold;
      }

      </style>
  </head>
  <body>
  
 <%@ include file="../common/header.jsp" %>

    <div id="content1">
        <input type="text" id="m_search">
        <button id="m_search_btn"></button>
    </div>


      <a href="" class="title">최신 개봉 영화</a>
      <div id="content2">
        
      </div>


      <a href="" class="title">이번주 인기 영화</a>
      <div id="content3">
       
      </div>

  
      <div><a href="" class="title">MOVINIAL 추천 영화 <br></a></div>
      <div id="div1">
        <a href="" class="title" style="font-size: medium;">색감이 예쁜 영화가 보고 싶다면?</a>
        
        
      </div>

      <div id="div2">
        <a href="" class="title"  style="font-size: medium;">액션 영화가 보고 싶다면?</a>
       
        
      </div>

    <%@ include file="../common/footer.jsp" %>
    
  </body>
</html>