<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.ArrayList, com.movinial.movie.model.vo.Movie" %>
<%
	ArrayList<Movie> seenList = (ArrayList<Movie>)request.getAttribute("seenList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MOVINIAL[:near]</title>
	
	<style>

        div>a{
            text-decoration: none;
            color : black;
        }    
        
		
		/* #myReviewEnroll{
			width:600px;
		} */
		
		#box{
            width: 1400px;            
        }
        
        div{
            box-sizing: border-box;
            margin: auto;
        } 
		.selectbtn, .selectSeenbtn{
			background: inherit;
			color: black;
			border:none;
			box-shadow:none;
			border-radius:0;
			padding:0;
			overflow:visible;
			cursor:pointer;
		}
		
		.review-write-poster, .review-write-info, .review-write-content {
		    display: inline-block;
		    vertical-align: top;
		    border:none;
		}
		
		.review-write-poster > img {
		    height: 400px;
		    border: none;
		    margin-right: 20px;
		    width: 300px;
		    display: inline-block;
		    
		}
		
		.review-write-area {
		    margin-bottom: 30px;
		}
		
		.button-area > button {
		    background: black;
		    color: white;
		    width: 100%;
		    font-size: 28px;
		    cursor: pointer;
		    border:none;
		}
		
		.review-write-info > input{
		    width: 100%;
		    margin-bottom: 10px;
			border-left : none;
		    border-right: none;
		    border-top:none;
			line-height:3;
		}
		
		.review-write-info > textarea {
			width: 100%;
		    margin-bottom: 10px;
		    border: none;
		    background: none;
		    outline: none;
		    height: 260px;
		    resize: none;
		    overflow:hidden;
		}

		.sub-button-area {
		    display: flex;
		    width: 100%;
		}
		
		.sub-button-area > button {
		    width: 40%;
		    border-radius : 15px;
		    margin: 0 15px;
		    font-size: 18px;
		    line-height: 50px;
		    border: 1px sold black;
		    background-color:white;
		    color:black;
		}
		
		.sub-button-area > button:hover {
			background-color:lightgray;
		}
		
		.review-write-content > textarea {
		    height: 370px;
		    width: 600px;
		    resize:none;
		}
		
		.review-write-info {
		    margin: 0 20px;
		}
		
		.button-area {
		    width: 100%;
		}
	
		.selectResult, .selectSeenResult {
		    overflow: auto;
		    max-height: 600px;
		}
		
		.modal-body {
		    width: 100%;
	    }
	    
	    textarea:focus{
	    	outline:none;
	    }
	    
	    table{
	    	text-align:center;
	    }
	 

	</style>
</head>
<body>
	  <%@ include file="../../views/common/headerSidebar.jsp" %>

	<form id="reviewWriteForm" name="reviewWriteForm" action="<%= contextPath %>/insertMyReview.mo" method="POST">
		<div class="dt-content">
			<h2>My Review Diary</h2>
			<br>
			오늘 MOVINIAL 에서 함께한 영화는 어땠나요?<BR>
			<code><%= loginUser.getMemberNickname() %></code> 님의 생각을 알고싶어요!
			<hr>
			
			<div class="review-write-area">
				<div class="review-write-poster">
					<img src="" id="moviePoster" width="300px" height="400px" alt="">
				</div>
				<div class="review-write-info">
					<input id="movieTitle" name="movieTitle" type="text" value="" readonly>
					<textarea id="movieContent"disabled></textarea>
					<div class="sub-button-area">
						<button type="button" id="searchBtn">검색</button>
						<button type="button" id="seenBtn">Seen</button>
					</div>
				</div>
				<div class="review-write-content">
					<input type="hidden" name="movieNo" id="movieNo">
					<textarea name="reviewContent" placeholder="리뷰 내용을 입력해주세요."></textarea>
					<br>

					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="radio" class="form-check-input" name="reviewShow" checked value="Y">공개
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="radio" class="form-check-input" name="reviewShow" value="N">비공개
						</label>
					</div>
				</div>
			</div>
			
			<div class="button-area">
				<button type="submit">등록</button>
			</div>
		</div>
	</form>
			
		<div class="modal" id="insertMovie">
           <div class="modal-dialog">
             <div class="modal-content" style="width: 600px; height:800px">
               <div class="modal-header">
                 <h4 class="modal-title">영화 추가</h4>
               </div>          
               <div class="modal-body">                    
	            검색할 영화명 <input type="text" class="searchMovie" required>
	           <button clsss="subSerarchMV"onclick="selectMovie();">검색</button><br><br>
	           <div class="selectResult">
	            <!-- 검색 결과 -->
                  </div>                    
               </div>
             </div>
           </div>
       </div>
	<!----------------------------------------------------------------------------------->	

			<!-- The Modal -->
			<div class="modal" id="seenMovieList">
			  <div class="modal-dialog">
			    <div class="modal-content" style="width: 600px; height:800px">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title"><b>Ready To...</b></h4>
			        <hr>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
				       <div class="selectSeenResult">
	          				<%for (Movie mv : seenList) {%>
	       						<button class="selectSeenbtn" value1="<%=mv.getPosterPath()%>" value2="<%=mv.getMovieNo()%>" value3="<%=mv.getOverview()%>"><%=mv.getTitle()%></button>
	       						<br>
	       						<hr>
	       					<% }%>
						</div>
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="button" class="btn btn-danger" data-dismiss="modal" style="background-color:black; border:none;">Close</button>
      		      </div>
      		      

   			  </div>
  			</div>
		</div>
		
	<script>
	
	$('#searchBtn').click(function () {
		$('#insertMovie').show();
	})
	
	
	$('#seenBtn').click(function () {
		$('#seenMovieList').show();
	})
	
	
	function selectMovie(){
    	
    	var $keyword = $(".searchMovie").val();
    	console.log($keyword);
    	
        $.ajax({
            url : "<%= contextPath %>/search.cu",
            data : {movieKeyword : $keyword},
           	type : "post",
            success : function(list){
            	                	                 	
                var result = "";
                for(var i in list){
            		 result += "<button class='selectbtn' value1='"+ list[i].posterPath +"' value2='"+ list[i].movieNo +"' value3=''>"+ list[i].title +"("+ list[i].originalTitle +") </button><br><hr>"
                    /* 영화명을 검색하여 해당되는 영화들을 불러와서 영화 정보(제목, 감독, 장르 등만 불러온다.) */
                    
                } 	                	
            	$(".selectResult").html(result);
            	
            	$('.selectbtn').click(function(){
            		
            		var url = "http://image.tmdb.org/t/p/" + "w154" + $(this).attr('value1');
            		
            		$('#moviePoster').attr('src', url);
            		$('#movieTitle').val($(this).text());
            		$('#movieNo').val($(this).attr('value2'));
            		$('#movieContent').val($(this).attr('value3'));
            		$(".selectResult").html("");
            		$(".searchMovie").val("");
            		$('#insertMovie').hide();
            	})
            	
            } // success               
        });
    }
	
	$('.selectSeenbtn').click(function(){
		
		var url = "http://image.tmdb.org/t/p/" + "w154" + $(this).attr('value1');
		
		$('#moviePoster').attr('src', url);
		$('#movieTitle').val($(this).text());
		$('#movieNo').val($(this).attr('value2'));
		$('#movieContent').val($(this).attr('value3') != 'null' ? $(this).attr('value3') : '');
		$('#seenMovieList').hide(); 
	})
	</script>
</body>
</html>
	<%@ include file="../../views/common/footer.jsp" %>