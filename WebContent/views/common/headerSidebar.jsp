<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movinial.member.model.vo.Member" %>    
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member)session.getAttribute("loginUser"); // : Object
	// 로그인 전 : menubar.jsp가 로딩될 때 null
	// 로그인 후 : manubar.jsp가 로딩될 때 로그인한 회원의 정보가 담겨있음
	String alertMsg = (String) session.getAttribute("alertMsg");

	int memberNo = loginUser.getMemberNo();
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
    	margin-left:-40px;
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
		
		/*------------------------  */
	.dt-content {
	        width: 1400px;
	        padding: 20px;
	        margin-bottom: 20px;
	        float: right;
	        border: 1px solid #bcbcbc;
	      }
	      
	  #dt-sidebar {
        width: 350px;
        padding: 20px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
      }
      
      #dt-sidebar {
        width: 350px;
        padding: 20px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
      }

      #dt-sidebar>ul{
          list-style: none;
          font-size: 20pt;
          margin-left:30px;
          line-height: 1.9cm;
        }
        
       #dt-sidebar>ul>li>a{
          text-decoration: none;
          color:black;
      }


      #dt-sidebar>ul>li>a:hover{
          color:coral;
      }
      
      /*-------------------------------  */
       #dt-sidebar {
        width: 350px;
        padding: 20px;
        margin-bottom: 20px;
        float: left;
        border: 1px solid #bcbcbc;
      }

      #dt-sidebar>ul{
          list-style: none;
          font-size: 20pt;
          margin-left:30px;
          line-height: 1.9cm;
        }
        
        #dt-sidebar>ul>li>a{
            text-decoration: none;
            color:black;
      }

      #dt-sidebar>ul>li>a:hover{
          color:coral;
      }
      
      /*----------------------------------------------------*/
      
      #delete_btn, #updatePwd_btn {
      	width:750px;
      	background-color:black;
      }
      
      /*---------------------------------------------*/
      
     /* 회원탈퇴 */
     
     #iptpwd{
     	width: 600px;
     }
     
      /*---------------------------------------------*/
      
     /* 비밀번호변경 */
     
     #memberPwd, #updatePwd, #checkPwd{
     	width: 400px;
     	float:right;
     	border-left:none;
     	border-top:none;
     	border-right:none;
     	line-height:31px;
     }
     
     
    </style>
  </head>
  
   <body> 
  	<script>
		var msg = "<%=alertMsg %>"; 

		if(msg != "null"){
		
			alert(msg);

		<%session.removeAttribute("alertMsg"); %>
		
		}
		
	</script>
  <div id="container">
  <div id="header">
	<% if(loginUser == null) { %>  
	  <!-- 로그인 전에 보여지는 페이지  -->
	  
	    <div class="login">
		  <h1><a href="<%= contextPath %>/main.me"><img src="<%= contextPath %>/resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</a></h1> <!-- 이미지 경로 상대 경로 -->
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
	        <h1><a href="<%= contextPath %>/main.me"><img src="<%= contextPath %>/resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</a></h1> <!-- 이미지 경로 상대 경로 -->
	        <ul>
	          <li><a href="<%= contextPath %>/myPage.me"><%=loginUser.getMemberNickname() %></a> 님</li>
	          <li><a href="<%= contextPath %>/logout.me">LOGOUT</a></li>
	          <li><a href="<%= contextPath %>/movie.me">MOVIE</a></li>
	          <li><a href="<%= contextPath %>/community.me">COMMUNITY</a></li>
	          <li><input type="search" name="search" id="header_search"></li>
	          <li><button id="header_search_btn"></button></li>
	        </ul>
	   	 </div>
	   	 <% } %>
   	 </div>
   	 
   	 
        <div id="dt-sidebar">
           
          <h2>Side bar</h2>  
          
          <ul>
          	<li>기록하기</li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영화 리뷰</a></li>
            <li><a href="<%=contextPath%>/views/member/moveSeenListView.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOVIE SEEN</a></li>
            <li><a href="<%=contextPath%>/views/member/myLikesListView.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LIKES LIST</a></li>
          	<li><a href="<%= contextPath %>/mylist.bo?currentPage=1&userNo=<%= memberNo %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가 쓴 글</a></li>
            
            <br>
            <li>회원정보</li>
            <li><a href="<%= contextPath %>/views/member/updateMember.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내 정보 관리</a></li>
            <li><a data-toggle="modal" href="#updatePwdForm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 변경</a></li>
			<li><a data-toggle="modal" href="#deleteForm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 탈퇴</a></li>

			<br>
            <li>고객센터</li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항</a></li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FAQ</a></li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의하기</a></li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나의 문의 내역</a></li>
            <li></li>

          </ul>
       </div>
       
       
       <!-- 회원 탈퇴 -->
       <div class="modal fade" id="deleteForm">
   		 <div class="modal-dialog modal-lg">
      	 <div class="modal-content">
      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">회원 탈퇴</h4>
	          <br><Br>
          	  <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

        <div class="modal-body">
          	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          	   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          		회원 탈퇴 시, <code>모든 개인정보와 데이터</code>는 삭제되며 다시 복구할 수 없습니다<br><br>
          	 <form action="<%= contextPath %>/delete.me" method="post">
          	 	<table>
          	 		<tr>
          				<td><B>PASSWORD&nbsp;&nbsp;</B></td>
          				<td><input type="password" name="memberPwd" id="iptpwd" required></td>
          			</tr>
          		</table>
          		<br>
         	 <button type="submit" class="btn btn-secondary" id="delete_btn">탈퇴하기</button>
        	</form>
        </div>

      </div>
    </div>
  </div>
  
  
  	<!-- 비밀번호 변경 -->
   <div class="modal fade" id="updatePwdForm">
   		 <div class="modal-dialog modal-lg">
      	 <div class="modal-content">
      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">비밀번호 변경</h4>
	          <br><br>
          	  <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          	 <form action="<%= contextPath %>/updatePwd.me" method="post">
          	 <input type="hidden" name="memberId" value="<%= loginUser.getMemberId() %>">
          	 	<table>
          	 		<tr>
          				<td><B>현재 비밀번호&nbsp;&nbsp;&nbsp;&nbsp;</B><input type="password" name="memberPwd" id="memberPwd" required></td>
          			</tr>

					<tr>  					
          				<td><B>변경할 비밀번호&nbsp;</B><input type="password" name="updatePwd" id="updatePwd" required></td>
          			</tr>

          			<tr>
          				<td><B>비밀번호 확인&nbsp;&nbsp;&nbsp;&nbsp;</B><input type="password" name="checkPwd" id="checkPwd" required></td>
          			</tr>
          		</table>
          		<br> 
         	 <button type="submit" class="btn btn-secondary" id="updatePwd_btn" 
         	 	onclick="return validatePwd();">변경</button> 
        	</form>
        </div>

      </div>
    </div>
  </div>
  
   <script>
 	
   function validatePwd(){
 		if($("input[name=updatePwd]").val() != $("input[name=checkPwd]".val())){
 			return false;
 			
 		}
 		return true;
 		
 	}
   
   </script>
   
  </body>
</html>