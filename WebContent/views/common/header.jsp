<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>header</title>
    <style>

      #container {
        width: 1850px;
        margin: 10px auto;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
      #header {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }
      
      #content1 {
       /*  width: 1810px; */
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }
      
      /*
      #content2 {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }

      #div1 {
        padding: 20px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
      }

      #div2 {
        width: 450px;
        margin-bottom: 20px;
        float: right;
        border: 1px solid #bcbcbc;
      }

      #content3 {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
        float:left;
      } */

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
        background: url("../../resources/images/searchbtn.png"); /* 이미지 경로 상대 경로 */
        background-repeat: no-repeat;
        width:50px;
        height:32px;
        
      }
     
      #header_search{
        margin-left:12%;

      }

      #header>ul>li>a:hover{
        color:coral;
      }

    </style>
  </head>
  <body>
    <div id="container">
      <div id="header">
        <h1><a href="#"><img src="../../resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</a></h1> <!-- 이미지 경로 상대 경로 -->
        <ul>
          <li><a href="#">LOGOUT</a></li>
          <li><a href="#">MY PAGE</a></li>
          <li><a href="#">MOVIE</a></li>
          <li><a href="#">COMMUNITY</a></li>
          <li><input type="search" name="search" id="header_search"></li>
          <li><button id="header_search_btn"></button></li>
        </ul>
   	 </div>
   	
  </body>
</html>