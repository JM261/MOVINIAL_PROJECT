<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.movinial.movie.model.vo.Movie, com.movinial.common.model.vo.PageInfo, com.movinial.review.model.vo.Review" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	Movie m = (Movie)request.getAttribute("m");
	
	// 페이징 처리용
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	// 알림 메시지 담기
	String alertMsg = (String)request.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
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

</style>
</head>
<body>

    <%@ include file="../common/header.jsp" %>
    
    <!-- 리뷰 정상 작성 확인 알림창 스크립트 -->
    <script>
		var msg = "<%= alertMsg %>";
		
		if(msg != "null") { // 메시지가 있을 경우
			alert(msg);
		
			<% request.removeAttribute("alertMsg"); %>
		}
	</script>

        <!-- 리뷰 상세보기: 영화 상세 정보 -->
        <div class="content">

            <h2>리뷰 상세보기</h2>

            <br><br>

            <table class="table-size">
                <tr>
                    <td>
                        <h2><%= m.getMovieNameEn() %> &nbsp&nbsp <%= m.getMovieNameKr() %> &nbsp&nbsp <%= m.getReleaseYear() %></h2>
                    </td>
                    <td align="right">
                        <img src="영화이미지" alt="영화 포스터">
                    </td>
                </tr>
            </table>

			<br><br>

        <!-- 리뷰 -->
			<table class="table table-borderless">
            
            	<!-- 조회된 리뷰가 없을 때 -->
            	<% if(list.isEmpty()) { %>
            	
	            	<tr>
	            	    <td colspan="6">조회된 리뷰가 없습니다.</td>
	            	</tr>
	            	
            	<% } else {%>
            	
            		 <!-- 리뷰 10개 출력 -->
            		 
            		<div class="review-order">
        				<a href="<%= contextPath %>/list.cm?currentPage=1&cct=공지" style="margin-left: 10px;" >최신순</a>
        				<a href="<%= contextPath %>/list.cm?currentPage=1&cct=전체" style="margin-left: 10px;">등록순</a>
        				<a href="<%= contextPath %>/list.cm?currentPage=1&cct=일반" style="margin-left: 10px;" >좋아요순</a>
        			</div>

					<br>
            		 
            		<% for(Review r: list) { %>
		                <tr>
		                    <td style="width: 20%;">
		                    	<%= r.getReviewWriter() %>
		                    </td>
		                    <td>
                                작성일 <%= r.getCreateDate() %> <a type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#reportForm">신고하기</a><!-- MODAL -->
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

            <br><br>

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
					<input type="hidden" name="movieNameKr" value="<%= m.getMovieNameKr() %>">

					<textarea class="enroll-form form-control" name="reviewContent" cols="200" rows="7" placeholder="해당 영화에 관련된 리뷰만 작성하시기 바랍니다.&#13;&#10;광고성 글, 비방글, 욕설 등 부적절한 내용이 포함될 시 신고 될 수 있으며, 부적절한 컨텐츠로 판단되면 별도의 안내없이 삭제 조치 될 수 있습니다."></textarea>

					<br>

					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="radio" class="form-check-input" name="reviewShow" value="Y">공개
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="radio" class="form-check-input" name="reviewShow" value="N">비공개
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
					<a class="btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/reviewList.mo?currentPage=<%= currentPage - 1 %>&mno=<%= m.getMovieNo() %>'">&lt;</a>
				<% } %>
				
				<% for(int i = startPage; i <= endPage; i++) { %>
					<% if(i != currentPage) { %>
						<a class="btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/reviewList.mo?currentPage=<%= i %>&mno=<%= m.getMovieNo() %>'"><%= i %></a>
					<% } else { %>
						<a class="btn-secondary btn-sm" disabled><%= i %></a>
					<% } %>
				<% } %>
				
				<!-- 페이징바에서 > 를 담당: 다음페이지 이동 -->
				<% if(currentPage != maxPage && maxPage != 0) { %>
					<a class="btn-secondary btn-sm" onclick="location.href='<%= contextPath %>/reviewList.mo?currentPage=<%= currentPage + 1 %>&mno=<%= m.getMovieNo() %>'">&gt;</a>
				<% } %>

			</div>

        </div>

        <!-- 리뷰 신고 Modal -->
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
	
							<button type="submit" class="btn btn-secondary">신고</button>
                            <!-- <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">취소</button> -->
					    </form>
				    </div>

			    </div>
			</div>
		</div>

    <%@ include file="../common/footer.jsp" %>

</body>
</html>