<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList
				, com.movinial.member.model.vo.MemberGenre " %>
				
<%
     String memberId = (String)request.getSession().getAttribute("memberId");
     String memberPwd = (String)request.getSession().getAttribute("memberPwd"); // 필수입력사항
	 String memberName = (String)request.getSession().getAttribute("memberName"); // 필수입력사항
	 String nickName = (String)request.getSession().getAttribute("nickName"); // 필수입력사항
	
	 ArrayList<MemberGenre> memberGenreList =  (ArrayList<MemberGenre>)request.getAttribute("memberGenreList"); // 장르리스트
	 ArrayList<MemberGenre> memberGenreMovieList =  (ArrayList<MemberGenre>)request.getAttribute("memberGenreMovieList"); // 장르영화리스트
	 
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
		.btn-area{
		
		width : 1500px;
		height: 100px;
        text-align:center; 
		}
		.btn-area>input{
            align-
		
		}

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

	<div class="genContext">

   <h2>(선택사항) 선호 영화장르를 선택해 주세요 </h2> <br>
   <p> 선호장르는 최대 3가지를 선택할 수 있습니다	<p>
    
    </div>
    
            <div class="btn-area" >
       		<input type="button" value=" < 이전" >
 			<input type="button" class="" value="회원가입 > " onclick="fnSubmit();">
        </div>

  <br>
 <script type="text/javascript">
 function fnSubmit(){
	var f = document.enrollform;
	var obj_length = document.getElementsByName("genreId").length;
	var genreIdTemp = "";
	var checkGenre = 0;
    for (var i=0; i<obj_length; i++) {
         if (document.getElementsByName("genreId")[i].checked == true) {
            // alert(document.getElementsByName("genreId")[i].value);
            if( genreIdTemp == "" ){
            	genreIdTemp =  document.getElementsByName("genreId")[i].value;
            }else{
            	genreIdTemp = genreIdTemp + ","+ document.getElementsByName("genreId")[i].value;
            }
            checkGenre++;
         }
    }
    if( checkGenre > 3 ){
		alert("선호장르 선택은 최대 3개");	  
		return;
	}
    //alert(genreIdTemp);
    document.getElementById("prefergenre").value = genreIdTemp;
    
    f.action =  "/movinial/insert.me";//

	f.submit(); /* 모든 조건문을 실행한 뒤 submit 실행. action으로 찾아가는 경로. */
 }
  </script>
  	
  <form id="enrollform" name="enrollform"  method="post">
    <div id="box">
        <div id="box2" class="btn btn-secondary"><p id="box2_title">선호 영화 고르기</p></div>
        <% if(!memberGenreList.isEmpty()) { %>	
        	<% for(MemberGenre g: memberGenreList) { %>
        <div id="box3"> <!-- 영화포스터 띄울 화면... -->
            <div id="box3_1">
            	<div id="box3_check"><p><input type="checkbox" style='zoom:2.0;' value="<%= g.getGenreId() %>" name="genreId"></p></div> <!-- 표시 여부 -->
                <div id="box3_title"><input type="text" value="<%= g.getGenreName() %>" readonly></input></div> <!-- 리스트 타이틀 -->
            </div>
            <div id="box3_2"> <!-- 큐레이션에 영화 추가 -->
                <% for(MemberGenre p : memberGenreMovieList) { %>
                 	<% if( g.getGenreId().equals(p.getGenreId()) ) { %>
                		<div><img src ="https://image.tmdb.org/t/p/w185<%= p.getGenrePosterPath() %>" width="200px" height="250px"></div> <!-- 영화 2 -->
              	    <% } %>
                <% } %>
            </div>
        </div>
        	<% } %>
         <% }%>
        <br><br>
        
        <div class="btn-area" >
       		<input type="button" value=" < 이전" >
 			<input type="button" class="" value="회원가입 > " onclick="fnSubmit();">
        </div>
    </div>
        <td><input type="hidden" name="memberId" maxlength="12" id="memberId" value="<%= memberId %>"></td> 
	    <td><input type="hidden" name="memberPwd" maxlength="15" id="memberPwd" value="<%= memberPwd %>"></td>
	    <td><input type="hidden" name="memberName" id="membernickName" maxlength="6" value="<%= memberName %>"></td>
	   	<td><input type="hidden" name="membernickName" id="nickName" maxlength="6" value="<%= nickName %>"></td>
	    <td><input type="hidden" name="email" id="email" value="<%= email %>"></td>
	    <td><input type="hidden" name="phone" value="<%= phone %>"> </td>
	    <td><input type="hidden" name="prefergenre" id="prefergenre"> </td>
	    <td><input type="hidden" name="a" id="a" value="aaaaa"> </td>
  </form>    
    
    
        
        
        
        
        
        
        

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