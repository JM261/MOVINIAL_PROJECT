<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.movinial.review.model.vo.Review, com.movinial.movie.model.vo.Movie" %>
<%
	Movie m = (Movie)request.getAttribute("m");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	
	int movieNo = ((Movie)request.getAttribute("m")).getMovieNo();
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

</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

		<!-- 영화 상세 정보 -->
		<div class="content">
			<table class="table-size">
				<tr>
					<td rowspan="7" style="width: 30%; text-align: center;">
						<img src="<%= m.getMovieImage() %>영화이미지" alt="영화 포스터">
					</td>
					<td>
						<h1><%= m.getMovieNameEn() %> <%= m.getMovieNameKr() %></h1>
					</td>
					<td>
						<h4>이 영화 보셨나요?</h4>
					</td>
					<td>
						<img src="<%= contextPath %>/resources/images/movie_seen_icon.png" alt="봤어요 아이콘"> 봤어요 <%= m.getMovieSeen() %>
					</td>
					<td>
						<img src="" alt="좋아요 아이콘"> 좋아요 <%= m.getMovieLikes() %>
					</td>
				</tr>
				<tr>
					<td>
						<br><br><br>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br>
						<h4>개봉년도 &nbsp&nbsp&nbsp <%= m.getReleaseYear() %></h4>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br>
						<h4>제작국가 &nbsp&nbsp&nbsp <%= m.getNational() %></h4>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br>
						<h4>감독 &nbsp&nbsp&nbsp <%= m.getDirector() %></h4>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<br>
						<h4>제작사 &nbsp&nbsp&nbsp <%= m.getCompany() %></h4>
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
						<a style="text-decoration: none; color: black;" href="<%= contextPath %>/reviewList.mo?currentPage=1&mno=<%= movieNo %>">MORE</a>
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