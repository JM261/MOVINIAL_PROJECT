<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>footer</title>
    <style>

     
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
   <!-- <div id="container"> -->
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
        <h1><img src="../../resources/images/movinial_logo.jpg" alt="로고">MOVINIAL[:near]</h1> <!-- 이미지 경로 상대 경로 -->
        <p>   
          (주)무비니얼 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F <br>
       	   통신판매업신고 2021-서울서초-40024 고객센터 02-1511-1234 <br>
          1992-2022 MOVINIAL corp. All rights reserved. <br>  
        </p>
      </div>
    </div>
  </body>
</html>