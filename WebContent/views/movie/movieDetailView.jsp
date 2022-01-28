<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movinial.movie.model.vo.Movie, org.json.JSONObject, java.util.ArrayList,
				 com.movinial.review.model.vo.Review, static com.movinial.common.MovieTemplate.*,
				 java.util.Locale"%>
<%
	// 영화 DB, 상세정보, 리뷰 가져오기
	Movie m = (Movie)request.getAttribute("m");
	JSONObject movieDetail = (JSONObject)request.getAttribute("movieDetail");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	
	// ISO 3166-1 처리 객체
	//Locale locale1 = new Locale("ko", "KR");
	//Locale locale2 = new Locale("ko", "JP");
	
	//String nationalname1 = locale1.getDisplayCountry();
	//String nationalname2 = locale2.getDisplayCountry();
	
	
	// 영화 정보 삽입용 변수
	String homepage = (String)movieDetail.get("homepage");
	Locale productionCountries = new Locale("ko", (String)(movieDetail.getJSONArray("production_countries").getJSONObject(0).get("iso_3166_1"))); // 제작 국가
	String productionCompanies = (String)movieDetail.getJSONArray("production_companies").getJSONObject(0).get("name"); // 제작사
	
	

	
	// 영화 상세보기 - 영화 포스터 가져오기
	String moviePosterUrl = getMoviePosterPath(m.getMovieId(), "w780");
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
	.table-size td {
		padding: 10px;
		border: solid 1px black;
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
	.movie-likes-btn:hover {
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
				<td rowspan="7" style="width: 30%;">
					<% if(moviePosterUrl != null) { %>
						<img src="<%= moviePosterUrl %>" alt="<%= m.getTitle() %> 영화 포스터">
					<% } else { %>
						<h2>영화 포스터 없음</h2>
					<% } %>
				</td>
				<td style="width: 40%;">
					<h1><%= m.getTitle() %></h1>
				</td>
				<td colspan="3" style="text-align: center;">
					<h4>이 영화 보셨나요?</h4>
				</td>
			</tr>
			<tr>
				<td>
					<h1><%= m.getOriginalTitle() %></h1>
				</td>
				<td>
					<a class="movie-seen-btn" onclick="checkSeen()">
						<img src="<%= contextPath %>/resources/images/movie_seen_icon.png" alt="봤어요 아이콘" style="text-align: center;">
						<h3 style="text-align: center;"><%= m.getMovieSeen() %></h3>
					</a>
				</td>
				<td>
					<a class="movie-likes-btn" onclick="checkLikes()">
						<img src="<%= contextPath %>/resources/images/movie_likes_icon.png" alt="좋아요 아이콘">
						<h3 style="text-align: center;"><%= m.getMovieLikes() %></h3>
					</a>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<h4>개요</h4>
					<p>
						<%= m.getOverview() %>
					</p>
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
					<h4>제작국가 &nbsp&nbsp&nbsp <%= productionCountries.getDisplayCountry() %></h4>
					<br>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<br>
					<h4>제작사 &nbsp&nbsp&nbsp <%= productionCompanies %></h4>
					<br>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<br>
					<h4>공식홈페이지 &nbsp&nbsp&nbsp <a href="<%= homepage %>" style="text-decoration: none; color: black;">홈페이지</a></h4>
					<br>
				</td>
			</tr>
		</table>
	</div>


	<%-- movie-seen-btn, movie-likes-btn: onclick 로그인 여부 확인 --%>
	<% if(loginUser == null) { %>
	
		<script>
			function checkSeen() {
				alert("먼저 로그인해주세요");
				location.href = "<%= contextPath %>/login.me"
			}
			function checkLikes() {
				alert("먼저 로그인해주세요");
				location.href = "<%= contextPath %>/login.me"
			}
		</script>
		
	<%-- 영화 봤어요 & 좋아요: 증감 처리 --%> 
	<%-- 회원 봤어요 & 좋아요: 영화 번호 저장/삭제 처리 --%>
	<% } else { %>
		<script>
			
			var movieNo = "<%= m.getMovieNo() %>"; // 현재 영화 번호
			var movieSeenValue = <%= m.getMovieSeen() %>; // 페이지 진입시 봤어요 값
			var movieLikesValue = <%= m.getMovieLikes() %>; // 페이지 진입시 좋아요 값
			
			
			// ---------- 영화 봤어요 ----------
			
			// 회원이 해당 영화에 '봤어요'를 누른 적이 있는지 확인
			function checkSeen(){
				
				$.ajax({
					url: "chkseen.mo",
					data: { mno : <%= loginUser.getMemberNo() %> },
					success: function(lm) {
						
						// 봤어요를 눌렀는지 확인
						if(lm.seenMovie != null) { 
							// 해당 회원의 '이영화 봤어요' 영화 번호 뽑아내기 (String[])
							var seenMovie = lm.seenMovie.split(',');
						}
						
						// 영화번호가 이미 있는지 확인
						if(seenMovie.indexOf(movieNo) != -1) { // 있다면, 영화 번호 삭제
							iDontSeenIt();
						}
						else { // 없다면, 영화 번호 삽입
							iSeenIt();
						}
						
					},
					error: function() {
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}
				})
			}
			
			// 해당 영화 '봤어요' 체크 
			function iSeenIt() {
				
				$.ajax({
					url: "seen.mo",
					data: { 
						mno : <%= loginUser.getMemberNo() %>,
						movieNo: <%= m.getMovieNo() %>
					},
					success: function(seen) {
						
						if(seen > 0){ // 성공 시
							movieSeenValue++; // 봤어요 값 + 1
							$(".movie-seen-btn").children().eq(1).text(movieSeenValue);
						}
						
					},
					error: function() {
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}		
				})
				
			}
			
			// 해당 영화 '봤어요' 체크 해제
			function iDontSeenIt(){

				$.ajax({
					url: "dontSeen.mo",
					data: { 
						mno : <%= loginUser.getMemberNo() %>,
						movieNo: <%= m.getMovieNo() %>
					},
					success: function(dontSeen) {
						
						if(dontSeen > 0){
							movieSeenValue--; // 봤어요 값 - 1
							$(".movie-seen-btn").children().eq(1).text(movieSeenValue);
						}
						
					},
					error: function() {
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}	
				})
				
			}
			
			
			// ---------- 영화 좋아요 ----------
			
			// 회원이 해당 영화에 '좋아요'를 누른 적이 있는지 확인
			function checkLikes(){
				
				$.ajax({
					url: "chklike.mo",
					data: { mno : <%= loginUser.getMemberNo() %> },
					success: function(lm) {
						
						// 좋아요를 눌렀는지 확인
						if(lm.likesMovie != null) { 
							// 해당 회원의 '좋아요' 영화 번호 뽑아내기 (String[])
							var likesMovie = lm.likesMovie.split(',');
						}
						
						// 영화번호가 이미 있는지 확인
						if(likesMovie.indexOf(movieNo) != -1) { // 있다면, 영화 번호 삭제
							iDontLikeIt();
						}
						else { // 없다면, 영화 번호 삽입
							iLikeIt();
						}
						
					},
					error: function() {
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}
				})
			}
			
			// 해당 영화 '좋아요' 체크 
			function iLikeIt() {
				
				$.ajax({
					url: "like.mo",
					data: { 
						mno : <%= loginUser.getMemberNo() %>,
						movieNo: <%= m.getMovieNo() %>
					},
					success: function(like) {
						
						if(like > 0){ // 성공 시
							movieLikesValue++; // 봤어요 값 + 1
							$(".movie-likes-btn").children().eq(1).text(movieLikesValue);
						}
						
					},
					error: function() {
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}		
				})
				
			}
			
			// 해당 영화 '좋아요' 체크 해제
			function iDontLikeIt(){

				$.ajax({
					url: "dislike.mo",
					data: { 
						mno : <%= loginUser.getMemberNo() %>,
						movieNo: <%= m.getMovieNo() %>
					},
					success: function(dislike) {
						
						if(dislike > 0){
							movieLikesValue--; // 봤어요 값 - 1
							$(".movie-likes-btn").children().eq(1).text(movieLikesValue);
						}
						
					},
					error: function() {
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}	
				})
				
			}
			
		</script>
	<% } %>


	<!-- 리뷰 -->
	<div class="content">
		<table class="table table-borderless" style="border: 1px black solid;">

			<!-- 리뷰 제목 -->
			<tr>
				<td>
					<h2>리뷰</h2>
				</td>
				<td align="right">
					<h5>
						<a style="text-decoration: none; color: black;" href="<%= contextPath %>/reviewList.mo?currentPage=1&movieNo=<%= m.getMovieNo() %>">MORE</a>
					</h5>
				</td>
			</tr>

			<!-- 리뷰 게시글 한 개당 목록 -->
			<!-- 영화 상세 페이지에서는 지정된 개수만큼 출력 -->
			<!-- 조회된 리뷰가 없을 때 -->
           	<% if(list.isEmpty()) { %>
           	
            	<tr>
            	    <td style="border: 1px black solid;" colspan="6">조회된 리뷰가 없습니다.</td>
            	</tr>
            	
           	<% } else {%>
           	
           		 <!-- 리뷰 n개 출력 -->
           		<% for(Review r: list) { %>
	                <tr>
	                    <td style="width: 20%; border: 1px black solid;">
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
	                        <img src="<%= contextPath %>/resources/images/movie_likes_icon.png" alt="좋아요 아이콘"> 좋아요 <%= r.getLikes() %>
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