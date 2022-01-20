<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movinial.member.model.vo.Member" %>    
<%
	String contextPath = request.getContextPath();

	//Member loginUser = (Member)session.getAttribute("loginUser"); // : Object
	// 로그인 전 : menubar.jsp가 로딩될 때 null
	// 로그인 후 : manubar.jsp가 로딩될 때 로그인한 회원의 정보가 담겨있음
	
	//String alertMsg = (String)session.getAttribute("alertMsg"); // : Object
	// 서비스 요청 전 : alertMsg = null
	// 서비스 요청 후 성공 시 : alertMsg = 메시지문구

%>    
    
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>header</title>
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
      
      /*
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

<% if(loginUser == null) { %>  
  <!-- 로그인 전에 보여지는 페이지  -->
    <div class="login">
	  <h1><a href="<%= contextPath %>/main.me"><img src="../../resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</a></h1> <!-- 이미지 경로 상대 경로 -->
	        <ul>
	          <li><a href="<%= contextPath %>/login.me">LOGIN</a></li>
	          <li><a href="<%= contextPath %>/enrollForm.me">JOIN</a></li>
	          <li><a href="<%= contextPath %>/movie.me">MOVIE</a></li>
	          <li><a href="<%= contextPath %>/community.me">COMMUNITY</a></li>
	          <li><input type="search" name="search" id="header_search"></li>
	          <li><button id="header_search_btn"></button></li>
	        </ul>
	</div>
  
  <% } else { %>  
  <!-- 로그인 후 보여지는 페이지 -->
	<div class="logout">
        <h1><a href="<%= contextPath %>/main.me"><img src="../../resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</a></h1> <!-- 이미지 경로 상대 경로 -->
        <ul>
          <li><a href="<%= contextPath %>/logout.me">LOGOUT</a></li>
          <li><a href="<%= contextPath %>/myPage.me">MY PAGE</a></li>
          <li><a href="<%= contextPath %>/movie.me">MOVIE</a></li>
          <li><a href="<%= contextPath %>/community.me">COMMUNITY</a></li>
          <li><input type="search" name="search" id="header_search"></li>
          <li><button id="header_search_btn"></button></li>
        </ul>
   	 </div>
   	 <% } %>
   	 
   	 
   	 </div>
   	</div>
  </body>
</html>