<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movinial.member.model.vo.Member" %>    
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser"); // : Object
	// 로그인 전 : menubar.jsp가 로딩될 때 null
	// 로그인 후 : manubar.jsp가 로딩될 때 로그인한 회원의 정보가 담겨있음

%>    
    
<!doctype html>
<html lang="ko">
  <head>
  	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

	<!-- jQuery & ajax library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
    <meta charset="utf-8">
    <title>header</title>

<style>
    
	  	/* header, body, footer {
	    font-family: 'NanumSquare', sans-serif !important;
		} */

      #container {
        width: 1850px;
        margin: 10px auto;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
      
      #header {
        margin-bottom:30px;
        padding-top: 70px;
        padding-bottom : 70px;
        padding-left: 30px; 
        border: 1px solid #bcbcbc; 

      }

      .login>ul>li{
        list-style: none;
        display: inline-block;
        margin-right: 25px;
      }
      
       .logout>ul>li{
        list-style: none;
        display: inline-block;
        margin-right: 25px;
      }

      .login>ul{
        margin-left:900px;
        font-size:20pt;
        margin-top:-70px;
      }
      
      .logout>ul{
        margin-left:810px;
        font-size:20pt;
        margin-top:-70px;
      }
      
      #header a{
        color:black;
        text-decoration: none;
      
        /* width: 3px; */   
      }
      
      #header a:hover{
        color:coral;   
      }

      .login>h1{
        font-size: 50pt;
        
      }
      
      .logout>h1{
        font-size: 50pt;
       
      }

      #header_search{
        border-left:none;
        border-right:none;
        border-top:none;
        width:200px;
        height:50px;
        font-size:14pt;
        margin-left:12%;
      }
      
      #header_search_btn{
        border:none;
        background: url("<%= contextPath %>/resources/images/searchbtn.png"); /* 이미지 경로 상대 경로 */
        background-repeat: no-repeat;
        width:50px;
        height:32px;
      }
      
      .login>ul>li>a:hover{
        color:coral;
      }
      .logout>ul>li>a:hover{
        color:coral;
      }
      
      /* .content {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      } */
	
    </style>
  </head>
  
  <body> 
  
  <div id="container">
  <div id="header">
	<% if(loginUser == null) { %>  
	  <!-- 로그인 전에 보여지는 페이지  -->
	  
	    <div class="login">
		  <h1><a href="<%= contextPath %>/main.me"><img src="<%= contextPath %>/resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</a></h1> <!-- 이미지 경로 상대 경로 -->
		        <ul>
		          <li><a href="<%= contextPath %>/views/common/login.jsp">LOGIN</a></li>
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
	        <h1><a href="<%= contextPath %>/main.me"><img src="<%= contextPath %>/resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</a></h1> <!-- 이미지 경로 상대 경로 -->
	        <ul>
	          <li><a href="<%=contextPath %>/myPage.me"></a>NICKNAME</li>
	          <li><a href="<%= contextPath %>/logout.me">LOGOUT</a></li>
	          <li><a href="<%= contextPath %>/movie.me">MOVIE</a></li>
	          <li><a href="<%= contextPath %>/community.me">COMMUNITY</a></li>
	          <li><input type="search" name="search" id="header_search"></li>
	          <li><button id="header_search_btn"></button></li>
	        </ul>
	   	 </div>
	   	 <% } %>
   	 </div>
  </body>
</html>