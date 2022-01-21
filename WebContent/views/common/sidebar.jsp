<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>my Page</title>
    <style>
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
        </style>
  </head>
  
  <body>

      
        <div id="dt-sidebar">
           
          <h2>Sidebar</h2>  
          
          <ul>
          	<li>기록하기</li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영화 리뷰</a></li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MOVIE SEEN</a></li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LIKES LIST</a></li>
            <li><a href="myWritingList.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내가 쓴 글</a></li>
            
            <br>
            <li>회원정보</li>
            <li><a href="updateMember.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내 정보 관리</a></li>
            <li><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 변경</a></li>
            <li><a href="deleteMember.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 탈퇴</a></li>
            
            <br>
            <li>고객센터</li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항</a></li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FAQ</a></li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문의하기</a></li>
            <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나의 문의 내역</a></li>
            <li></li>

            
          </ul>
       </div>
  </body>
</html>
