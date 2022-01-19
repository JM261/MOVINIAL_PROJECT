<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>MOVINIAL</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    
    #container {
        width: 940px;
        width :98%;
        margin: 10px auto;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
      #header {
        width: 900px;
        width :98%;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }
      #content1 {
        width: 900px;
        width : 98%;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }

      #content2 {
        width: 900px;
        width: 98%;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }

      #div1 {
        width: 450px;
        width: 47%;
        padding: 20px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
      }

      #div2 {
        width: 450px;
        width: 47%;
        padding: 20px;
        margin-bottom: 20px;
        float: right;
        border: 1px solid #bcbcbc;
      }

      #content3 {
        width: 900px;
        width: 98%;
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
        float:left;
      }

      #footer {
        clear: both;
        padding: 20px;
        border: 1px solid #bcbcbc;
        padding-right:4%; 
      }

      #footer>h1{
        float:right;
        margin:auto;
      }
      
      #footer>p{
        padding-left:10px;
        line-height: 20px;
      }

      #header>ul>li{
        list-style: none;
        display: inline-block;
        margin-right: 35px;
      }

      #header>ul{
        margin-left:760px;
        font-size:20pt;
        margin-top:-70px;
      }
      
      #header a{
        color:black;
        text-decoration: none;
        /* width: 3px; */
        
      }

      #header>h1{
        font-size: 60pt;
      }

      #header_search{
        border-left:none;
        border-right:none;
        border-top:none;
        width:200px;
        height:50px;
        font-size:14pt;
        
      }

      #header_search_btn{
        border:none;
        background:url("resources/images/searchbtn.png"); /* 이미지 경로 상대 경로 */
        background-repeat: no-repeat;
        width:50px;
        height:32px;
        
      }
     
      #header_search{
        margin-left:12%;

      }

      #footer1>ul{
        list-style: none;
        display: inline-block;
        
       
      }
      
      #footer1>ul>li{
        display:inline-block;
        
        
      }

      #footer1>ul>li>a{
        color:black;
        text-decoration: none;
        /* width:20px; */
        margin-left:40px;
      }

      #footer>p{
        padding-left:40px;
      }

      #header>ul>li>a:hover{
        color:coral;
      }

      #footer1>ul>li>a:hover{
        color:coral;
      }

    </style>
  </head>
  <body>
    <div id="container">
      <div id="header">
        <h1><a href="#"><img src="resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</a></h1> <!-- 이미지 경로 상대 경로 -->
        <ul>
          <li><a href="#">LOGOUT</a></li>
          <li><a href="#">MY PAGE</a></li>
          <li><a href="#">MOVIE</a></li>
          <li><a href="#">COMMUNITY</a></li>
          <li><input type="search" name="search" id="header_search"></li>
          <li><button id="header_search_btn"></button></li>
        </ul>
       
      </div>
      <div id="content1">
        <h2>Content</h2>
        <p>Lorem ipsum dolorawejfio sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
      </div>
      <div id="content2">
        <h2>Content</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
      </div>
  

      <div id="div1">
        <h2>content</h2>
        <ul>
          <li>Lorem</li>
          <li>Ipsum</li>
          <li>Dolor</li>
        </ul>
      </div>

      <div id="div2">
        <h2>content</h2>
        <ul>
          <li>Lorem</li>
          <li>Ipsum</li>
          <li>Dolor</li>
        </ul>
      </div>

      <div id="content3">
        <h2>Content</h2>
        <p>
        
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, sollicitudin sapien eget, adipiscing risus.</p>
      </div>

      <div id="footer">
        <div id="footer1">
          <ul>
            <li><b><em>Copyright©</em></b></li>
          
            <li><a href="#">개인정보처리방침</a></li>
            <li><a href="#">청소년보호정책</a></li>
            <li><a href="#">고객센터</a></li>
            <li><a href="#">공지사항</a></li>
          </ul>
        </div>
        <h1><img src="resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</h1> <!-- 이미지 경로 상대 경로 -->
        <p>   
          (주)무비니얼 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F <br>
       	   통신판매업신고 2021-서울서초-40024 고객센터 02-1511-1234 <br>
          1992-2022 MOVINIAL corp. All rights reserved. <br>  
        </p>

      </div>
    </div>
  </body>
</html>