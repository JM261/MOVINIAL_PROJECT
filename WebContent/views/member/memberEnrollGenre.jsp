<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
     String memberId = (String)request.getSession().getAttribute("memberId");
     String memberPwd = (String)request.getSession().getAttribute("memberPwd"); // 필수입력사항
	 String memberName = (String)request.getSession().getAttribute("memberName"); // 필수입력사항
	 String nickName = (String)request.getSession().getAttribute("nickName"); // 필수입력사항
	
	 String email = (String)request.getSession().getAttribute("email"); // 빈 문자열이 들어갈 수 있음
	 String phone = (String)request.getSession().getAttribute("phone");
     String errorMsg = (String)request.getAttribute("errorMsg"); // : Object
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선호 장르 저장하기</title>

<style>

        #box{
            width: 1400px;            
        }
        
        div{
            /* border: 1px solid black; */
            box-sizing: border-box;
            margin: auto;
        }        
        #box1{
            width: 100%;
            height: 60px;
        }
        #box1>div{
            
            height: 100%;
        }
        #box1_1{
            float: left;
            width: 90%;
        }
        #box1_1>input{
            border-left:none;
            border-right:none;
            border-top:none;
        }
        #box1_2{
            float: left;
            width: 10%;
            text-align: center;
            vertical-align: middle;
        }

        #box2{
            width: 100%;
            height: 70px;
            text-align: center;
            border: 1px solid black;
        }
        #box2>p{
            font-size: 32px;
        }


        #box3{
            width: 100%;
            height: 400px;
            border: 1px solid black;
        }

        #box3_1{
            width: 100%;
            height: 15%;
        }

        #box3_2{
            width: 100%;
            height: 85%;
            text-align: center;            
            vertical-align: middle;
        }

        #box3_title{ /* 리스트 타이틀을 입력하세요 */
            width: 80%;
            height: 100%;
            float: left;
            padding-left: 50px;
            padding-top: 20px;
            font-size: 23px;
        }

        #box3_check{ /* 표시 여부 */
            width: 20%;
            height: 100%;
            float: left;
            font-size: 23px;
            display: table-cell;
            padding-top: 20px;
            padding-right: 10px;
        }

     	#box3_2>div{
             width: 12%;
             height: 250px;
             display: inline-block;
             margin: 15px;
             margin-top: 40px;
             vertical-align: center;
             border: 1px solid black;
         }

         #box2_title{
             font-size: 25px;
         }

         #box3_check p{
             display: inline;
             float: right;
             margin-right: 30px;
            }

        #box3_title input{
            display: inline;
            float: left;
            margin-left: 10px;
            width: 400px;
            border-left:none;
            border-right:none;
            border-top:none;
         }         


    </style>


</head>
<body>

	 <%@ include file="../common/header.jsp" %>
	

<script>
		
		// script태그 내에서도 스크립틀릿과 같은 jsp요소를 쓸 수 있다.
	
		var msg = "<%= errorMsg %>"; 
		// "메시지 문구" / "null"
		
		if(msg != "null"){ // 즉, 성공 / 경고 메시지 문구가 담겨있을 경우
			alert(msg);
		
			// menubar.jsp가 로딩 될때마다 매 번 alert가 떠버림
			// session에 들어있는 alertMsg키값에 대한 밸류를 지워주면됨
			// => XX.removeAttribute("키값")
			<% request.removeAttribute("alertMsg"); %>
			
		}
	</script>

    (선택사항) 좋아하는 영화를 선택해 주세요

    <form id="enroll-form" action="<%= contextPath %>/insert.me" method="post">
	
	<td><input type="text" name="memberId" maxlength="12" id="memberId" value="<%= memberId %>"></td> 
    <td><input type="password" name="memberPwd" maxlength="15" id="memberPwd" value="<%= memberPwd %>"></td>
    <td><input type="text" name="memberName" id="membernickName" maxlength="6" value="<%= memberName %>"></td>
   	<td><input type="text" name="membernickName" id="nickName" maxlength="6" value="<%= nickName %>"></td>
    <td><input type="email" name="email" id="email" value="<%= email %>"></td>
    <td><input type="text" name="phone" value="<%= phone %>"> </td>

	</form>
	
	<br>
    <div id="box">
        <div id="box1"> <!-- 상단 -->
            <div id="box1_1">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width: 300px; height: 40px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button class="btn btn-secondary" style="width: 75px; height: 45px; font-size: 20px;">검색</button>
            </div>
            <div id="box1_2">
                <button id="box1_plus" class="btn btn-secondary" style="width: 75px; height: 45px; font-size: 20px;">추가</button>
            </div>
        </div>
        
        <div id="box2" class="btn btn-secondary"><p id="box2_title">선호 영화 고르기</p></div>
        
        <div id="box3"> <!-- 큐레이션... -->
            <div id="box3_1">
                <div id="box3_title"><input type="text" placeholder="리스트 타이틀을 입력하세요."></input></div> <!-- 리스트 타이틀 -->
                <div id="box3_check"><p>표시여부&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" style='zoom:2.0;'></p></div> <!-- 표시 여부 -->
            </div>
            <div id="box3_2"> <!-- 큐레이션에 영화 추가 -->
                <div data-toggle="modal" data-target="#insertMovie"></div> <!-- 영화 1 --> <!-- 클릭해서 영화명 검색 후 입력한 단어가 들어가는 영화 모두 조회 %영화명% -->
                <div></div> <!-- 영화 2 -->
                <div></div> <!-- 영화 3 -->
                <div></div> <!-- 영화 4 -->
                <div></div> <!-- 영화 5 -->
                <div></div> <!-- 영화 6 -->               
                
            </div>
            
        </div>
    </div>
        
        <br>
        
        <!-- The Modal : 큐레이션 추가 -->
		<div class="modal" id="insertMovie">
            <div class="modal-dialog">
              <div class="modal-content" style="width: 600px;">
          
                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">영화 추가</h4>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
          
                <!-- Modal body -->
                <div class="modal-body">
                    

                        검색할 영화명 <input type="text" id="searchMovie">
                        <button onclick="selectMovie();">검색</button>
                        <div id="selectResult">
                            <!-- 검색 결과가 존재하면 출력 없으면 "검색 조회 결과가 없습니다." -->
                        </div>

                    
                </div>
              </div>
            </div>
        </div>

        <script>
        
      
            function selectMovie(){        	
            	
            	var $keyword = $("#searchMovie").val();
            	console.log($keyword);
            	
                $.ajax({
                url : "search.cu",
                data : {
                    movieKeyword : $keyword
                },
               	type : "post",
                success : function(list){
                	
                    var result = "";
					                    
                	for(var i in list){
                		result += list[i].movieNameKr + "("+list[i].movieNameEn+")<br>"
                        /* 영화명을 검색하여 해당되는 영화들을 불러와서 영화 정보(제목, 감독, 장르 등만 불러온다.) */    
                    }
                	$("#selectResult").html(result);
                	
                },
                error : function(){
                	
                    $("#selectResult").html("조회 결과가 없습니다.");
                }

                })
                
            }
    
        </script>
	
	
	
	    <%@ include file="../common/footer.jsp" %>
	
</body>
</html>