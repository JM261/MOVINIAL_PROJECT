<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movinial.movie.model.vo.Movie, org.json.JSONObject, java.util.ArrayList,
				 com.movinial.review.model.vo.Review, static com.movinial.common.MovieTemplate.*,
				 java.util.Locale, org.json.JSONArray"%>
<%
	// 영화 DB, 상세정보, 리뷰 가져오기
	Movie m = (Movie)request.getAttribute("m");
	JSONObject movieDetail = (JSONObject)request.getAttribute("movieDetail");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	
	// 영화 상세보기 - 영화 포스터 가져오기
	String moviePosterUrl = getMoviePosterPath(m.getMovieId(), "w780");
	
	// 영화 정보 삽입용 변수
	String homepage = (String)movieDetail.get("homepage"); // 홈페이지
	String productionCountry = "확인 불가"; // 제작 국가
	String productionCompany = "확인 불가"; // 제작사
	
	// JSON 빈 객체 및 빈 배열 확인
	JSONArray countriesCheck = movieDetail.getJSONArray("production_countries");
	JSONArray productionCheck = movieDetail.getJSONArray("production_companies");
	
	// 제작국가 확인
	if(!countriesCheck.isNull(0)) {
		Locale productionCountries = new Locale("ko", (String)(movieDetail.getJSONArray("production_countries").getJSONObject(0).get("iso_3166_1"))); // 제작 국가
		productionCountry = productionCountries.getDisplayCountry();
	}
	
	// 제작사 확인
	if(!productionCheck.isNull(0)) {
		productionCompany = (String)movieDetail.getJSONArray("production_companies").getJSONObject(0).get("name"); // 제작사
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><<%= m.getTitle() %>>의 상세 정보</title>
<style>
 	.mylist {
 		color:white;
 		background-color:black;
 		line-height:35px;
 		width:70px;
 		list-style:none;
 		display:inline-block;
 		text-align:center;
 		margin-bottom:10px;
 		margin-left:10px;
 		margin-right:5px;
 		margin-top:10px;
 		text-decoration: none;
 	}
 	.mylist:hover {
		text-decoration: none;
 	}
	.content {
		padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
    }
	.table-size td {
		padding: 10px;
	}
	.btn-group {
		text-decoration: none;
		color: black;
	}
	.btn-group:hover {
		text-decoration: none;
		color: black;
		cursor: pointer;
	}
	.profile {
	  	width:150px;
	  	height:150px;
	  	border-radius:60px;
	  	border: 1px solid lightgray;
	}
	.review-content {
		display: -webkit-box;
		text-overflow: ellipsis;
		overflow: hidden;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
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
					<h1 style="font-weight: bold;"><%= m.getTitle() %></h1>
				</td>
				<td colspan="3" style="text-align: center;">
					<h4 style="font-weight: bold;">이 영화 보셨나요?</h4>
				</td>
			</tr>
			<tr>
				<td>
					<h1 style="font-weight: bold;"><%= m.getOriginalTitle() %></h1>
				</td>
				<td>
					<a class="movie-seen-btn btn-group" onclick="checkSeen()">
						<img src="<%= contextPath %>/resources/images/movie_seen_icon.png" alt="봤어요 아이콘">
						&nbsp&nbsp<h3><%= m.getMovieSeen() %></h3>
					</a>
				</td>
				<td>
					<a class="movie-likes-btn btn-group" onclick="checkLikes()">
						<img src="<%= contextPath %>/resources/images/movie_likes_icon.png" alt="좋아요 아이콘">
						&nbsp&nbsp<h3><%= m.getMovieLikes() %></h3>
					</a>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<h4 style="font-weight: bold;">개요</h4>
					<% if(m.getOverview() != null) { %>
						<p>
							<%= m.getOverview() %>
						</p>
					<% } else { %>
						<p>
							없음
						</p>
					<% } %>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<br>
					<h4 style="font-weight: bold;">개봉일</h4>
					<h5><%= m.getReleaseDate() %></h5>
					<br>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<br>
					<h4 style="font-weight: bold;">제작국가</h4>
					<h5><%= productionCountry %></h5>
					<br>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<br>
					<h4 style="font-weight: bold;">제작사</h4>
					<h5><%= productionCompany %></h5>
					<br>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<br>
					<h4 style="font-weight: bold;">공식 홈페이지 &nbsp&nbsp
					<% if(!homepage.equals("")) { %>

						<a href="<%= homepage %>" target="_blank">
							<img src="<%= contextPath %>/resources/images/external-link-btn.png" alt="<%= m.getTitle() %> 공식 홈페이지로 이동" style="width: 30px; height: 30px;">
						</a>
						</h4>

					<% } else { %>

						</h4>
						<h5>확인 불가</h5>

					<% } %>
					
					<br>

				</td>
			</tr>
		</table>

	</div>

	<%-- 영화 봤어요 & 좋아요: 로그인 여부 확인 --%>
	<% if(loginUser == null) { %>
	
		<script>
			function checkSeen() {
				alert("로그인 후 이용해주시기 바랍니다");
				location.href = "<%= contextPath %>/login.me"
			}
			function checkLikes() {
				alert("로그인 후 이용해주시기 바랍니다");
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
							
							// 영화번호가 이미 있는지 확인
							if(seenMovie.indexOf(movieNo) != -1) { // 있다면, 영화 번호 삭제
								iDontSeenIt();
							}
							else { // 없다면, 영화 번호 삽입
								iSeenIt();
							}
							
						}
						else { // null일 경우
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
						
						if(seen > 0 && movieSeenValue >= 0){ // 성공 시, 현재 봤어요 값이 0보다 크거나 같다면
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
						
						if(dontSeen > 0 && movieSeenValue > 0) { // 성공 시, 현재 봤어요 값이 0보다 크다면
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
							
							// 영화번호가 이미 있는지 확인
							if(likesMovie.indexOf(movieNo) != -1) { // 있다면, 영화 번호 삭제
								iDontLikeIt();
							}
							else { // 없다면, 영화 번호 삽입
								iLikeIt();
							}
						}
						else { // null일 경우
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
						
						if(like > 0 && movieLikesValue >= 0) { // 성공 시, 현재 좋아요 값이 0보다 크거나 같다면
							movieLikesValue++; // 좋아요 값 + 1
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
						
						if(dislike > 0 && movieLikesValue > 0) { // 성공 시, 현재 좋아요 값이 0보다 크다면
							movieLikesValue--; // 좋아요 값 - 1
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

		<table class="table table-borderless">

			<!-- 리뷰 제목 -->
			<tr>
				<td colspan="2">
					<h2 style="font-weight: bold;">리뷰</h2>
				</td>
				<td align="right">
					<h5>
						<a style="text-decoration: none; color: black;" href="<%= contextPath %>/reviewList.mo?currentPage=1&movieNo=<%= m.getMovieNo() %>&sort=1">MORE</a>
					</h5>
				</td>
			</tr>

			<!-- 리뷰 게시글 한 개당 목록 -->
			<!-- 영화 상세 페이지에서는 지정된 개수만큼 출력 -->
			<!-- 조회된 리뷰가 없을 때 -->
           	<% if(list.isEmpty()) { %>
           	
            	<tr>
            	    <td colspan="7">
            	    	<h2 style="text-align: center;">조회된 리뷰가 없습니다</h2>
            	    </td>
            	</tr>
            	
           	<% } else {%>
           	
           		 <!-- 리뷰 n개 출력 -->
           		<% for(Review r: list) { %>
	                <tr>
	                    <td align="center" style="width: 10%;">
	                    	<h5><%= r.getReviewWriter() %></h5>
	                    </td>
	                    <td>
	                    	<h5>작성일 &nbsp&nbsp <%= r.getCreateDate() %> &nbsp&nbsp</h5>
	                    </td>
	                    <td align="right">
		                    <% if(loginUser != null) { %>

		                    	<!-- 리뷰 신고하기 -->
	                    		<a type="button" class="mylist report-button" data-review-no="<%= r.getReviewNo() %>" data-review-writer="<%= r.getReviewWriter() %>" style="text-decoration: none; color: white;">신고하기</a>
	                    		<input type="hidden" class="report-modal" data-toggle="modal" data-target="#reportForm">

	                    	<% } %>
	                    </td>
	                </tr>
	                <tr>
	                    <td rowspan="2" align="center">
	                        <img src="<%= contextPath %><%= r.getProfileImage() %>" alt="유저 프로필 이미지" class="profile" onerror="this.onerror=null; this.src='<%= contextPath %>/resources/images/profilePic.png'">
	                    </td>
	                    <td>
	                    	<div class="review-content">
	                    		<%= r.getReviewContent() %>
	                    	</div>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                    	<!-- 리뷰 좋아요 -->
							<a class="review-likes-btn btn-group" onclick="checkReviewLikes('<%= r.getReviewWriter() %>', '<%= r.getReviewNo() %>', this)">
	                        	<img src="<%= contextPath %>/resources/images/movie_likes_icon.png" alt="좋아요 아이콘" style="width: 30px; height: 30px;">&nbsp&nbsp
								&nbsp<h4><%= r.getLikes() %></h4>
							</a>
	                    </td>
	                </tr>
                <% } %>
				
			<% } %>
		</table>

	</div>

	<!-- 리뷰 신고 Modal -->
	<div class="container">
		<div class="modal fade" id="reportForm">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
				
					<!-- Modal 헤더 -->
					<div class="modal-header">
						<h4 class="modal-title" style="color: red;">신고 사유</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					
					<!-- 리뷰 신고 사유 작성란 -->
					<div class="modal-body">
						<textarea id="reportContent" class="form-control" cols="59" rows="5" style="resize: none;"></textarea>
					</div>
					
					<!-- 신고 제출 버튼 -->
					<div class="modal-footer">
						<button type="button" onclick="reportReview();" class="btn btn-danger" data-dismiss="modal">제출</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<%-- 리뷰 신고: 신고 증가 / 리뷰 번호 저장 처리 --%> 	
	<% if(loginUser != null) { %>
		<script>
		
			var reviewNo = ""; // 해당 리뷰 번호
			var reviewWriter = ""; // 해당 리뷰의 닉네임
			
			// 신고 버튼 클릭 시, 리뷰 신고 Modal로 해당 리뷰 번호, 닉네임 가져오기
			$(document).on("click", ".report-button", function() {
				
				reviewNo = String($(this).data("review-no")); // Number > String
				reviewWriter = $(this).data("review-writer"); // 회원번호가 아닌 닉네임
				
				// 본인 리뷰인지 확인
				if(reviewWriter == "<%= loginUser.getMemberNickname() %>") {
					alert("자신의 리뷰를 신고할 수 없습니다");
					return;
				}
				else {
					checkReportReview();
				}
				
			})
			
			// 리뷰 신고 전 신고 여부 체크
			function checkReportReview() {
				
				$.ajax({
					url: "chkreport.rev",
					data: { mno: <%= loginUser.getMemberNo() %> },
					success: function(rr){
						
						// null이 아닐 경우, 해당 리뷰에 신고를 눌렀는지 확인
						if(rr.reportReview != null) {
							
							// 해당 회원의 '신고한 리뷰' 리뷰 번호 뽑아내기 (String[])
							var reportRr = rr.reportReview.split(',');
							
							// 신고한 리뷰 번호가 이미 있는지 확인
							if(reportRr.indexOf(reviewNo) != -1) {
								alert("이미 신고한 리뷰입니다");
								return;
							}
							else { // 없으면, 리뷰 신고 Modal 열기
								$(".report-modal").click();
							}
							
						}
						else { // null일 경우, 리뷰 신고 Modal 열기
							$(".report-modal").click();
						}
						
					},
					error: function(){
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}
				})
				
			}
			
			// 리뷰 신고하기
			function reportReview() { 
		
				$.ajax({
					url: "report.rev",
					data: {
						mno : <%= loginUser.getMemberNo() %>,
						reviewNo : reviewNo
					},
					success: function(report){
						
						if(report > 0){
							alert("해당 리뷰를 신고했습니다");
							location.href = "<%= contextPath %>/detail.mo?movieNo=<%= m.getMovieNo() %>"
						}
						
					},
					error: function(){
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}	
				})
				
			}
			
		</script>
	<% } %>

	<%-- 리뷰 좋아요: 로그인 여부 확인 --%>
	<% if(loginUser == null) { %>
	
		<script>
			function checkReviewLikes() {
				alert("로그인 후 이용해주시기 바랍니다");
				location.href = "<%= contextPath %>/login.me"
			}
		</script>
		
	<%-- 리뷰 좋아요: 증감 처리 --%> 
	<%-- 리뷰 좋아요: 리뷰 번호 저장/삭제 처리 --%>
	<% } else { %>
		<script>
		
			// 회원이 해당 리뷰에 '좋아요'를 누른 적이 있는지 확인
			// 매개변수: 현재 리뷰 작성자(닉네임), 현재 리뷰 번호, 사용자가 누른 review-likes-btn 클래스 요소
			function checkReviewLikes(reviewWriter, reviewNo, reviewLikesBtn){
				
				var $reviewLikesValue = $(reviewLikesBtn).children().eq(1).text(); // 현재 리뷰의 좋아요 개수
				
				if(reviewWriter == "<%= loginUser.getMemberNickname() %>") { // 리뷰 작성자 확인
					alert("자신의 리뷰에 좋아요를 할 수 없습니다");
					return;
				}
			
				$.ajax({
					url: "chklike.rev",
					data: { mno : <%= loginUser.getMemberNo() %> },
					success: function(lr) {
						
						// 좋아요를 눌렀는지 확인
						if(lr.likesReview != null) {
							
							// 해당 회원의 '좋아요' 리뷰 번호 뽑아내기 (String[])
							var likesReview = lr.likesReview.split(',');
							
							// 리뷰번호가 이미 있는지 확인
							if(likesReview.indexOf(reviewNo) != -1) { // 있다면, 리뷰 번호 삭제
								iDontLikeItReview(reviewNo, reviewLikesBtn, $reviewLikesValue);
							}
							else { // 없다면, 리뷰 번호 삽입
								iLikeItReview(reviewNo, reviewLikesBtn, $reviewLikesValue);
							}
							
						}
						else { // null일 경우
							iLikeItReview(reviewNo, reviewLikesBtn, $reviewLikesValue);
						}
						
					},
					error: function() {
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}
				})
				
			}
			
			// 해당 영화 '좋아요' 체크 
			function iLikeItReview(reviewNo, reviewLikesBtn, $reviewLikesValue) {
				
				$.ajax({
					url: "like.rev",
					data: { 
						mno : <%= loginUser.getMemberNo() %>,
						reviewNo: reviewNo
					},
					success: function(like) {
						
						if(like > 0 && $reviewLikesValue >= 0){ // 성공 시, 현재 좋아요 값이 0보다 크거나 같다면
							$reviewLikesValue++; // 좋아요 값 + 1
							$(reviewLikesBtn).children().eq(1).text($reviewLikesValue);
						}
						
					},
					error: function() {
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}		
				})
				
			}
			
			// 해당 영화 '좋아요' 체크 해제
			function iDontLikeItReview(reviewNo, reviewLikesBtn, $reviewLikesValue) {
				
				$.ajax({
					url: "dislike.rev",
					data: { 
						mno : <%= loginUser.getMemberNo() %>,
						reviewNo: reviewNo
					},
					success: function(dislike) {
						
						if(dislike > 0 && $reviewLikesValue > 0){ // 성공 시, 현재 좋아요 값이 0보다 크다면
							$reviewLikesValue--; // 좋아요 값 - 1
							$(reviewLikesBtn).children().eq(1).text($reviewLikesValue);
						}
						
					},
					error: function() {
						alert("서버와 접속이 원활하지 않습니다 \n 잠시 후 다시 시도해주세요");
					}	
				})
				
			}
			
		</script>
	<% } %>	
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>