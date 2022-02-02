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
 		text-decolation:none;
 	}
 	.mylist:hover{
 		text-decolation:none;
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
	    font-size: 28px;
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
                        <h2 style="font-weight: bold; margin-left: 40px;"><%= m.getTitle() %></h2><br><br>
                        <h2 style="font-weight: bold; margin-left: 40px;"><%= m.getOriginalTitle() %></h2><br><br>
                        <h2 style="font-weight: bold; margin-left: 40px;"><%= m.getReleaseDate() %></h2><br><br><br><br><br><br>
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
		
        <div class="review-sort" style="margin-left: 30px;">
        	<a href="<%= contextPath %>/reviewList.mo?currentPage=1&movieNo=<%= m.getMovieNo() %>&sort=1" >최신순</a>
        	<a href="<%= contextPath %>/reviewList.mo?currentPage=1&movieNo=<%= m.getMovieNo() %>&sort=2" >등록순</a>
        	<a href="<%= contextPath %>/reviewList.mo?currentPage=1&movieNo=<%= m.getMovieNo() %>&sort=3" >좋아요순</a>
        </div>
        
        <br><br>
        
		<table class="table table-borderless">

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
								<h4><%= r.getLikes() %></h4>
							</a>
	                    </td>
	                </tr>
                <% } %>
                
               <% } %>
		</table>

            
            
            
            
            
            
            
            

			<% if(loginUser == null) { %>

				<!-- 로그인 안 했을 때 표시 -->
				<textarea class="enroll-form form-control" cols="200" rows="7" placeholder="리뷰를 작성하려면 로그인이 필요합니다."></textarea>

			<% } else { %>

				<!-- 리뷰 작성 -->
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