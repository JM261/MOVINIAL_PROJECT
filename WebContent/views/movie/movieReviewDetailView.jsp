<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.movinial.movie.model.vo.Movie,
				com.movinial.common.model.vo.PageInfo, com.movinial.review.model.vo.Review,
				static com.movinial.common.MovieTemplate.*" %>
<%
	// 해당 영화 모든 리뷰, 영화 DB 가져오기
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	Movie m = (Movie)request.getAttribute("m");
	
	// 영화 포스터 가져오기
	String moviePosterUrl = getMoviePosterPath(m.getMovieId(), "w500");
	
	// 페이징 처리용
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	// 리뷰 정렬용
	int sort = (int)request.getAttribute("sort");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><<%= m.getTitle() %>>의 상세 리뷰</title>
<style>
	.content {
		padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
    }
	.enroll-form {
		resize: none;
	}
    .enroll-form>div {
        display: inline-block;
    }
	.paging-area>a:hover {
		cursor: pointer;
	}	
	.review-order>a {
		color: black;
		font-weight: bolder;
		font-size: large;
		text-decoration: none;
	}
	.review-order>a:hover {
		color: black;
		text-decoration: none;
	}
	.table-size {
		width: 100%;
	}
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
 	.mylist:hover{
		text-decoration: none;
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
	.review-sort>a {
	    color: black;
	    font-weight: bolder;
	    font-size: 25px;
	    text-decoration: none;
        margin: 30px;
	}
	.review-sort>a:hover {
		color: black;
	    text-decoration: none;
	}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<!-- 리뷰 상세보기: 영화 상세 정보 -->
	<div class="content">

		<h2 style="font-weight: bold;">리뷰 상세보기</h2>
		
		<table class="table-size">
			<tr>
				<td>
					<h2 style="font-weight: bold; margin-left: 40px;"><%= m.getTitle() %></h2>
					<br><br>
					<h2 style="font-weight: bold; margin-left: 40px;"><%= m.getOriginalTitle() %></h2>
					<br><br>
					<h2 style="font-weight: bold; margin-left: 40px;"><%= m.getReleaseDate() %></h2>
					<br><br><br><br><br><br>
				</td>
				<td align="right">
				
				<% if(moviePosterUrl != null) { %>
					<img src="<%= moviePosterUrl %>" alt="<%= m.getTitle() %> 영화 포스터">
				<% } else { %>
					<h2>영화 포스터 없음</h2>
				<% } %>
				</td>
			</tr>
		</table>

		<br><br>

	</div>

	<!-- 리뷰 -->
	<div class="content">

		<br>

		<!-- 리뷰 정렬 -->
        <div class="review-sort" style="margin-left: 30px;">
        	<a href="<%= contextPath %>/reviewList.mo?currentPage=1&movieNo=<%= m.getMovieNo() %>&sort=1" >최신순</a>
        	<a href="<%= contextPath %>/reviewList.mo?currentPage=1&movieNo=<%= m.getMovieNo() %>&sort=2" >등록순</a>
        	<a href="<%= contextPath %>/reviewList.mo?currentPage=1&movieNo=<%= m.getMovieNo() %>&sort=3" >좋아요순</a>
        </div>
        
        <br><br>
        
		<!-- 리뷰 출력 -->
		<table class="table table-borderless">

			<!-- 조회된 리뷰가 없을 때 -->
			<% if(list.isEmpty()) { %>

				<tr>
					<td colspan="7">
						<h2 style="text-align: center;">조회된 리뷰가 없습니다</h2>
					</td>
				</tr>

			<% } else {%>
           	
           		 <!-- 정렬 기준 리뷰 10개 출력 -->
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
								<h4><%= r.getLikes() %></h4>
							</a>
	                    </td>
	                </tr>

                <% } %>
                
            <% } %>

		</table>

            
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

		<!-- 리뷰 작성란 -->

		<!-- 로그아웃 -->
		<% if(loginUser == null) { %>
			
			<textarea class="enroll-form form-control" cols="200" rows="7" placeholder="리뷰를 작성하려면 로그인이 필요합니다." disabled></textarea>

		<!-- 로그인 -->
		<% } else { %>

			<!-- 리뷰 작성폼 -->
			<form action="<%= contextPath %>/insertReview.mo" method="post" class="enroll-form">

				<!-- 회원 번호 및 영화 번호 및 제목 전송 -->
				<input type="hidden" name="memberNo" value= "<%= loginUser.getMemberNo() %>">
				<input type="hidden" name="memberNickname" value= "<%= loginUser.getMemberNickname() %>">					
				<input type="hidden" name="movieNo" value="<%= m.getMovieNo() %>">
				<input type="hidden" name="movieTitle" value="<%= m.getTitle() %>">
				
				<!-- 리뷰 작성 시점 정렬 정보 확인 -->
				<input type="hidden" name="sort" value="<%= sort %>">

				<textarea class="enroll-form form-control" name="reviewContent" cols="200" rows="7" required placeholder="해당 영화에 관련된 리뷰만 작성하시기 바랍니다.&#13;&#10;광고성 글, 비방글, 욕설 등 부적절한 내용이 포함될 시 신고 될 수 있으며, 부적절한 컨텐츠로 판단되면 별도의 안내없이 삭제 조치 될 수 있습니다."></textarea>

				<br>

				<!-- 리뷰 공개/비공개 -->
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="radio" class="form-check-input" name="reviewShow" required value="Y">공개
					</label>
				</div>

				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="radio" class="form-check-input" name="reviewShow" required value="N">비공개
					</label>
				</div>

				<!-- 등록 -->
				<div class="form-check-inline">
					<button type="submit" class="btn btn-sm btn-secondary">등록</button>
				</div>
				
			</form>

		<% } %>



		<!-- 페이징바 -->
		<div class="paging-area" align="center">

			<br><br>
			
			<!-- 페이징 버튼 -->
			<!-- 페이징바에서 < 를 담당: 이전페이지 이동 -->
			<% if(currentPage != 1) { %>
				<a class="btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/reviewList.mo?currentPage=<%= currentPage - 1 %>&movieNo=<%= m.getMovieNo() %>&sort=<%= sort %>'">&lt;</a>
			<% } %>
			
			<% for(int i = startPage; i <= endPage; i++) { %>

				<% if(i != currentPage) { %>
					<a class="btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/reviewList.mo?currentPage=<%= i %>&movieNo=<%= m.getMovieNo() %>&sort=<%= sort %>'"><%= i %></a>
				<% } else { %>
					<a class="btn-secondary btn-sm" disabled><%= i %></a>
				<% } %>

			<% } %>
			
			<!-- 페이징바에서 > 를 담당: 다음페이지 이동 -->
			<% if(currentPage != maxPage && maxPage != 0) { %>
				<a class="btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/reviewList.mo?currentPage=<%= currentPage + 1 %>&movieNo=<%= m.getMovieNo() %>&sort=<%= sort %>'">&gt;</a>
			<% } %>

		</div>

    </div>
	
    <%@ include file="../common/footer.jsp" %>

</body>
</html>