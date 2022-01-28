<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="static com.movinial.common.MovieTemplate.*, java.util.ArrayList, com.movinial.movie.model.vo.Movie, com.movinial.curation.model.vo.CurationList" %>
<%
	ArrayList<CurationList> list = (ArrayList<CurationList>)request.getAttribute("list");
	

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>큐레이션</title>
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
      
        #box1_2{
            float: left;
            width: 100%;
            text-align: right;
            padding-right: 20px;
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
			/* height: 350px; */
            border: 1px solid black;
            display: none;
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
            width: 87.5%;
            height: 100%;
            float: left;
            padding-left: 50px;
            padding-top: 20px;
            font-size: 23px;
        }

        #box3_check{ /* 표시 여부 */
            width: 12.5%;
            height: 100%;
            float: left;
            font-size: 23px;
            display: table-cell;
            padding-top: 20px;
            padding-right: 10px;
        }

     	#box3_2>div{
             width: 154px;
             height: 220px;
             display: inline-block;
             margin: 15px;
             margin-top: 30px;
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

		.selectbtn{
		
			background: inherit ;
			border:none;
			box-shadow:none;
			border-radius:0;
			padding:0;
			overflow:visible;
			cursor:pointer;
		}

		div>img{
			width : 154px;
			height : 220px;
			
		}

        .selectCurationList{
            height: 350px;
            border: 0.5px solid black;
        }

        .cl1{
            width: 100%;
            height: 20%;
            
        }
        .cl1_1{
            width: 50%;
            float: left;
            margin-top: 20px;
            font-size: 25px;
            padding-left: 50px;
        }
        .cl1_2{
            width: 50%;
            float: left;
        }
        .cl1_2>a{
            float: right;
            margin-right: 100px;
            margin-top: 15px;
        }
        .cl2{
            width: 100%;
            height: 80%;
            text-align: center;
        }
        .cl2>img{
            margin: 30px 15px 15px;
        }
    </style>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>

    <br>
        <div id="box">
            <div id="box1"> <!-- 상단 -->            
                <div id="box1_2">
                    <button id="box1_plus" class="btn btn-dark" style="width: 75px; height: 45px; font-size: 20px;">추가</button>
                </div>
            </div>
            <div id="box2" class="btn btn-dark"><p id="box2_title">관리자 추천 리스트</p></div>

	    <form action="<%= contextPath %>/insertList.cu" method="post">
	            <div id="box3"> <!-- 큐레이션... -->
	                <div id="box3_1">
	                    <div id="box3_title"><input type="text" name="listName" placeholder="리스트 타이틀을 입력하세요." required></input></div> <!-- 리스트 타이틀 -->
	                    <div id="box3_check">
	                        <button type="submit" class="btn btn-dark" style="width: 75px; height: 45px; font-size: 20px;">저장</button>&nbsp;&nbsp;&nbsp; <!-- 저장 -->
	                    </div> 
	                </div>
	                <div id="box3_2"> <!-- 큐레이션에 영화 추가 -->
	                    <% for(int i=1; i<=6; i++){ %>
	                        <div class="modal<%=i%>" data-toggle="modal" data-target="#insertMovie<%=i%>"></div> <!-- 클릭해서 영화명 검색 후 입력한 단어가 들어가는 영화 모두 조회 %영화명% -->
	                    <%} %>
	                </div>
	                
	            </div>
	    </form>
            <script>
                $(function(){
                    $('#box1_plus').click(function(){
                        $('#box3').toggle();
                    })
                })
            </script>
            <!-- DB에 들어가있는 값 불러오기 -->    
            <%if(list.isEmpty() && list != null){ %>   
            <%} else { %>
                <% for(int i=0; i<list.size(); i++){ %>
                    <% String[] movieId = list.get(i).getListMovieId().split(","); %>
                    <div class="selectCurationList">

                        <div class="cl1">
                            <div class="cl1_1" style="text-decoration: underline;">No.<%= list.get(i).getListNo() %> &nbsp;&nbsp; <%= list.get(i).getListName() %></div>
                            <div class="cl1_2"><a href="<%= contextPath %>/delete.cu?cno=<%= list.get(i).getListNo() %>" class="btn btn-dark"  style="width: 75px; height: 45px; font-size: 20px;">삭제</a></div>
                        </div>
                        <div class="cl2">
                            <img src='<%= getMoviePosterPath(Integer.parseInt(movieId[0]), "w154") %>'>
                            <img src='<%= getMoviePosterPath(Integer.parseInt(movieId[1]), "w154") %>'>
                            <img src='<%= getMoviePosterPath(Integer.parseInt(movieId[2]), "w154") %>'>
                            <img src='<%= getMoviePosterPath(Integer.parseInt(movieId[3]), "w154") %>'>
                            <img src='<%= getMoviePosterPath(Integer.parseInt(movieId[4]), "w154") %>'>
                            <img src='<%= getMoviePosterPath(Integer.parseInt(movieId[5]), "w154") %>'>
                        </div>     
                            
                    </div>
                <%} %>
            <%} %>
        </div>
        <br>
        
        <!-- The Modal : 큐레이션 추가 -->
        <% for(int i=1; i<=6; i++){ %>
		<div class="modal" id="insertMovie<%=i%>">
            <div class="modal-dialog">
              <div class="modal-content" style="width: 600px; height:800px">
                <div class="modal-header">
                  <h4 class="modal-title">영화 추가 <%=i%></h4>
                </div>          
                <div class="modal-body">                    
		            검색할 영화명 <input type="text" class="searchMovie<%=i%>" required>
		           <button onclick="selectMovie<%=i%>();">검색</button><br><br>
		           <div class="selectResult">
		            <!-- 검색 결과 -->
                   </div>                    
                </div>
              </div>
            </div>
        </div>
		<%} %>
		
        <script>
        <% for(int i=1; i<=6; i++){ %>
        	
            function selectMovie<%=i%>(){        	
            	
            	var $keyword = $(".searchMovie<%=i%>").val();
            	console.log($keyword);
            	
                $.ajax({
	                url : "<%= contextPath %>/search.cu",
	                data : {movieKeyword : $keyword},
	               	type : "post",
	                success : function(list){
	                	                	                 	
		                var result = "";
		                for(var i in list){
	                		 result += "<button class='selectbtn' value1='"+ list[i].posterPath +"' value2='"+ list[i].movieId +"'>"+ list[i].title +"("+ list[i].originalTitle +")</button><br><hr>"
	                        /* 영화명을 검색하여 해당되는 영화들을 불러와서 영화 정보(제목, 감독, 장르 등만 불러온다.) */
	                        
	                    } 	                	
	                	$(".selectResult").html(result);
	                	
	                	$('.selectbtn').click(function(){
	                		
	                		var url = "http://image.tmdb.org/t/p/" + "w154" + $(this).attr('value1');
	                		
	                		$('.modal<%=i%>').html("<img src="+ url +"><input type='hidden' name='listMovieId' value='"+ $(this).attr('value2') + "'>" );
	                		
	                		$(".selectResult").html("");
	                		$(".searchMovie<%=i%>").val("");
	                		$('#insertMovie<%=i%>').modal('hide');
	                	})
	                	
	                } // success               
                });
                
            } // selectMovie 
            <%} %>
        </script>             

        <%@ include file = "../common/footer.jsp" %>
        
        
    </body>
    </html>