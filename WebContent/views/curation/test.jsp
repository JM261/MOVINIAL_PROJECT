<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file = "../common/header.jsp" %>
	
	<input type="text" id="searchMovie">
	<button onclick="selectMovie();">버튼</button>
	<div id="selectResult">
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

</body>
</html>