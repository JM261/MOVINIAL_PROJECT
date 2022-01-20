<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>큐레이션</title>
<style>

        div{
            border: 1px solid black;
            box-sizing: border-box;
            margin: auto;
        }
        #box1{
            width: 980px;
            height: 70px;
        }
        #box1>div{
            height: 70px;
        }

        #box1-1{
            float: left;
            width: 90%;
        }

        #box1-2{
            float: left;
            width: 10%;
        }
        #box2{
            width: 980px;
            height: 50px;
            text-align: center;
            
        }

        #box3{
            width: 980px;
            height: 450px;
        }
        #box3_1{
            width: 100%;
            height: 70px;
        }
        #box3_title{
            width: 80%;
            height: 100%;
            float: left;
        }
        #box3_check{
            width: 20%;
            height: 100%;
            float: left;

        }

     	#box3
      

    </style>
</head>
<body>

	

	  <div id="box1"> <!-- 상단 -->
        <div id="box1-1">
            <input type="text" placeholder="타이틀 검색" >
            <button >검색</button>
        </div>
        <div id="box1-2">
            <button>추가</button>
        </div>
    </div>

    <div id="box2">관리자 추천 리스트</div>

    <div id="box3"> <!-- 큐레이션... -->
        <div id="box3_1">
            <div id="box3_title">No.1 리스트 타이틀을 입력하세요.</div> <!-- 리스트 타이틀 -->
            <div id="box3_check">표시여부<input type="checkbox"></div> <!-- 표시 여부 -->
        </div>
        <div id="box3_2"> <!-- 큐레이션에 영화 추가 -->
            <div></div> <!-- 영화 1-->
            <div></div> <!-- 영화 2 -->
            <div></div> <!-- 영화 3 -->
            <div></div> <!-- 영화 4 -->
            <div></div> <!-- 영화 5 -->
            <div></div> <!-- 영화 6 -->
            <div></div> <!-- 영화 7 -->
            <div></div> <!-- 영화 8 -->
            <div></div> <!-- 영화 9 -->
            <div></div> <!-- 영화 10 -->
        </div>

    </div>


	
</body>
</html>