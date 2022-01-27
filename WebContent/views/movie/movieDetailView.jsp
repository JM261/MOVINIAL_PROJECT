<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movinial.movie.model.vo.Movie, org.json.JSONObject, java.util.ArrayList,
				 com.movinial.review.model.vo.Review, static com.movinial.common.MovieTemplate.* " %>
<%
	// 영화 DB, 상세정보, 리뷰 가져오기
	Movie m = (Movie)request.getAttribute("m");
	JSONObject movieDetail = (JSONObject)request.getAttribute("movieDetail");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	
	// 영화 포스터 가져오기
	String moviePosterUrl = getMoviePosterPath(m.getMovieId(), "w780");
	
	// 봤어요/좋아요 클릭 여부 확인 변수
	// int movieSeenChk = Integer.parseInt(request.getAttribute("movieSeenChk"));
	// int movieLikesChk = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 페이지</title>
<style>
	.content {
		padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
    }
	.table-size {
		width: 100%;
	}
	.movie-seen-btn {
		text-decoration: none;
		color: black;
	}
	.movie-seen-btn:hover {
		text-decoration: none;
		color: black;
	}
	.movie-likes-btn {
		text-decoration: none;
		color: black;
	}

</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

		<!-- 영화 상세 정보 -->
		<div class="content">
			<table class="table-size">
				<tr>
					<td rowspan="7" style="width: 30%; text-align: center;">
						<% if(moviePosterUrl != null) { %>
							<img src="<%= moviePosterUrl %>" alt="<%= m.getTitle() %> 영화 포스터">
						<% } else { %>
							<h2>영화 포스터 없음</h2>
						<% } %>
					</td>
					<td>
						<h1><%= m.getTitle() %> <%= m.getOriginalTitle() %></h1>
					</td>
					<td>
						<h4>이 영화 보셨나요?</h4>
					</td>
					<td>
						<a class="movie-seen-btn">
							<input type="hidden" class="get-movie-no" value="<%= m.getMovieNo() %>">
							<img src="<%= contextPath %>/resources/images/movie_seen_icon.png" alt="봤어요 아이콘"><%= m.getMovieSeen() %>
						</a>
					</td>
					<td>
						<a class="movie-likes-btn">
							<input type="hidden" class="get-movie-no" value="<%= m.getMovieNo() %>">
							<img src="<%= contextPath %>/resources/images/movie_likes_icon.png" alt="좋아요 아이콘"><%= m.getMovieLikes() %>
						</a>
					</td>
				</tr>

				<script>
					$(function() {

						// 봤어요/좋아요 클릭 여부 확인 변수
						//var movieSeenChk;
						//var movieLikesChk;
						
						//console.log(movieSeenChk);

						// 봤어요 아이콘 클릭시
						$(".movie-seen-btn").click(function() {
							$.ajax({
								url: "movieSeenBtn.mo",
								data: {
									movieNo: $(".get-movie-no").val()
								},
								success: function(result) {
									
									
									console.log(result);
									alert("됨");
									$(".movie-seen-btn").val()

								},
								error: function() {
									alert("외않되");
								}
							})






						})
					})







				</script>



				<tr>
					<td>
						<br><br><br>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br>
						<h4>개요</h4>
						<p>
							<%= m.getOverview() %>
						</p>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br>
						<h4>개봉일 &nbsp&nbsp&nbsp <%= m.getReleaseDate() %></h4>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br>
						<h4>제작국가 &nbsp&nbsp&nbsp <%= movieDetail.getJSONArray("production_countries").getJSONObject(0).get("name") %></h4>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br>
						<h4>제작사 &nbsp&nbsp&nbsp <%= movieDetail.getJSONArray("production_companies").getJSONObject(0).get("name") %></h4>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br>
						<h4>제작사 &nbsp&nbsp&nbsp</h4>
						<br>
					</td>
				</tr>
			</table>
		</div>


		<!-- 리뷰 -->
		<div class="content">
			<table class="table table-borderless">

				<!-- 리뷰 제목 -->
				<tr>
					<td>
						<h2>리뷰</h2>
					</td>
					<td align="right">
						<a style="text-decoration: none; color: black;" href="<%= contextPath %>/reviewList.mo?currentPage=1&mno=<%= m.getMovieNo() %>">MORE</a>
					</td>
				</tr>

				<!-- 리뷰 게시글 한 개당 목록 -->
				<!-- 영화 상세 페이지에서는 지정된 개수만큼 출력 -->
				<!-- 조회된 리뷰가 없을 때 -->
            	<% if(list.isEmpty()) { %>
            	
	            	<tr>
	            	    <td colspan="6">조회된 리뷰가 없습니다.</td>
	            	</tr>
	            	
            	<% } else {%>
            	
            		 <!-- 리뷰 n개 출력 -->
            		<% for(Review r: list) { %>
		                <tr>
		                    <td style="width: 20%;">
		                    	<%= r.getReviewWriter() %>
		                    </td>
		                    <td>
                                작성일 <%= r.getCreateDate() %>
								<a type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#reportForm">신고하기</a><!-- MODAL -->
		                    </td>
		                </tr>
		                <tr>
		                    <td rowspan="2">
		                        <img src="" alt="유저 프로필 이미지 경로">
		                    </td>
		                    <td>
		                    	<p>
		                    		<%= r.getReviewContent() %>
		                    	</p>
		                    </td>
		                </tr>
		                <tr>
		                    <td>
		                        <img src="" alt="좋아요 아이콘"> 좋아요 <%= r.getLikes() %>
		                    </td>
		                </tr>
	                <% } %>
	                
                <% } %>
			</table>
		</div>

		
		<!-- Modal 영역 -->
		<!-- 신고하기 -->
		<div class="modal fade" id="reportForm">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
		
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">신고 사유</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
		
				<!-- Modal body -->
				<div class="modal-body">
					<form action="신고처리할 서블릿" method="post">
							<table>
								<textarea name="reportContent" cols="60" rows="10" style="resize: none;"></textarea>

							</table>
							<br>
	
							<button type="submit" class="btn btn-info btn-sm">비밀번호 변경</button>
					</form>
				</div>
			</div>
			</div>
		</div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>