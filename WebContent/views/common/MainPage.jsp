<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
    
         @import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
        
        
         *{ font-family : 'NanumSquare';}


        div{
            border:1px solid black;
            box-sizing:border-box;
            background-color:white;
            width:1200px;
            height:1000px;
        }

      
       .wrapper{
            width:100%;

        }

        .wrapper>div{ 
            width: 100%;
        }

        .header{
            width:1200px;
            width:100%;
            height:25%;
            height:250px;
        }

        .footer{
            height:20%;
            height:200px;
            float:left;
        }

        .main{
            height:55%;
            height:550px;
        }
        
        .header>div{
            width:100%;
            height:100%;
            float:left;
        }

        .main>div{
            width:100%;
            height:100%;
        }

        .footer>div{
            width:100%;
            height:100%;
            float:left;
        }

        #header1{ 
            width:40%;
            padding-left:5%;
            font-weight: 800;
            font-size:10rem;
        }

        #header1>label{
            margin-top:16%;
        }
        
        #header2{ 
            width:40%;
            padding-top:200px;
            padding-left:105px;
        }

        #header2>a:hover{
            color: slategray;
        }


        #header3{ width:20%;}

        #main1{ width:100%; height:70%}
        #main2{ width:100%; height:70%}
        #main3{ width:100%; height:80%}
        #main3-1{ width:50%; height:100%; float:left;}
        #main3-2{ width:50%; height:100%; float:left;}

        #main4{ width:100%; height:100%;}
        #main4-1{ width:50%; height:50%; float:left;}
        #main4-2{ width:50%; height:100%; float:right;}
        #main4-3{ width:50%; height:50%; float:left;}
        #main5{ width:100%; height:70%; float:right;}
        
        #footer1{ width: 60%;}

        #footer1-1{ 
            width:100%;
            height:20%;
        }
        
        #footer1-2{ width:100%; height:80%;}
        
        #footer2{ 
            width: 40%;
            font-weight : 800;
            font-size: 50pt;
            padding-top:2%;
            padding-left: 3%;
        }


        /* -------------- */
       
        #propic{
            width: 70%;
            margin-top:-70%;
            text-decoration: none;
            position:absolute;
            margin-left:-70%;
        }
        
        #header_title{
            font-size: 3.7rem;
            font-weight:900;
            color:black;
            margin-top:150px;
            text-decoration: none;
        }
        
        #footer_title{
            font-size: 3.7rem;
            font-weight:800;
            margin-top:2%;
        }

        
        #main_search_btn{
            width:40px;
            height:40px;
            border: none;
            float:right;
            margin-top:-15%;
            margin-right:8%;
            background:url(searchbtn.png);
            background-repeat: no-repeat;
        }
       
        #myInput{
            width: 250px;
            margin-top:180px;
            margin-left:50px;
            border-top:none;
            border-left:none;
            border-right:none;
            border-color: black;
        }

        #myInput:hover{
            background:lightgray;
        }

        #header2 li{
            float:left;
            list-style: none;
            width:28%;
            font-size: 20pt;
            margin-left:0%;
            position: relative;
        }
        
        #movie{
            padding-left:10%;
        }
        
        #header2>ul>li>a{
            color:black;
            font-weight:700;
            font-size:22pt;
        }

        #header2>ul>li>a:hover{
            color:slategrey;
            text-decoration: none;
        }
       
        #user{
           color:black;
           margin-left:3%;
           text-decoration: none;
           font-family: 'nanumsquare';
           font-weight:700;
        }

        #user:hover{
            color:gray;
        }

      
        #user_pro_id{
            float:right;
        }

        #navi_list{
            /* position:absolute; */
            width:78%;
            margin-left:23%;
            float:left;
            margin-top:-10%;
            position:relative;
            display:block;
            
        }

        #footer1-1>a{
            
            color:black;
            font-size: 1.3rem;
            display:block;
            float:left;
            width:20%;
            text-decoration: none;
            text-align: center;
        }

        #footer1-1>a:hover{
            color:gray;
        }

        #footer1-2{
            padding-left:5%;
            padding-top:1%;
        }


    </style>
  
</head>

<body>

    <div class="wrapper" id="wrap">
            <div class="header">
                <div id="header1">
                    <label><a href="#" id="header_title" ><img src="movinial_logo.jpg" alt="로고">MOVINIAL[:near]</a></label>
                </div>
                <div id="header2">
                   <li><a href="#" id="user">USER_MV<img src="/woman_pro.PNG" alt="(프로필사진)" id="propic"></a></li>
                    <ul id="navi_list">
                        <li><a href="#" id="logout">LOGOUT</a></li>
                        <li><a href="#" id="movie">MOVIE</a></li>
                        <li><a href="#" id="community">COMMUNITY</a></li>
                    </ul>
                </div>
                <div id="header3">
                    <form action="#" method="get">
                        <input class="form-control" id="myInput" type="search" name="main_search">
                        <button type="button" id="main_search_btn"></button>
                    </form>
                </div>

            </div>
            <div class="main">
                <div id="main1">
                    main1
                </div>
                <div id="main2">
                    main2
                </div>
                <div id="main3">
                    <div id="main3-1">main3-1</div>
                    <div id="main3-2">main3-2</div>
                </div>
                <div id="main4">
                        <div id="main4-1">main4-1</div>
                        <div id="main4-2">main4-2</div>
                        <div id="main4-3">main4-3</div>
                </div>
                <div id="main5">
                    main5
                </div>
            </div>

            <div class="footer">
                <div id="footer1">
                    <div id="footer1-1">
                        <a href="#">이용약관</a> 
                        <a href="#">개인정보처리방침</a> 
                        <a href="#">청소년보호정책</a> 
                        <a href="#">고객센터</a> 
                        <a href="#">공지사항</a> 
                    </div>
                    <div id="footer1-2">
                        <p>
                            (주)무비니얼<br>
                           	 서울특별시 중구 남대문로 120대일빌딩 2F, 3F <br>
                           	 통신판매업신고 2021-서울서초-40024 <br>
                         	 고객센터 02-1511-1234 <br>
                             Copyright© 1992-2022 MOVINIAL corp. All rights reserved. <br>
                        </p>

                    </div>
                </div>
                <div id="footer2">
                   <label id="footer_title"><img src="movinial_logo.jpg" alt="로고">MOVINIAL[:near]</label>
                </div>
            </div>
    </div>
  
</body>
</html>